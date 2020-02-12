# Client-to-Site VPN Example

The following scenario walks through how to set up an IPsec or an OpenVPN test server. Once the VPN server is configured, a secure connection is established between the internal network and the production environment on DXP Cloud. This example uses Ubuntu Server 18.0.4 as a proof of concept. Please read the [Client to Site VPN](./client-to-site-vpn.md) article for an overview on DXP Cloud's Client-to-Site VPNs functionality.

```warning::
   Examples and values may be subject to change and should be adapted for your specific environment.
```

## Basic Setup for an IPsec Server

To configure an IPsec test server:

1. Save the following file as `~/ipsec.conf` and replace the `leftid` value with your VPN server's external IP.

    ```properties
    config setup
        charondebug="ike 1, knl 1, cfg 0"
        uniqueids=no

    conn ikev2-vpn
        auto=add
        compress=no
        type=tunnel
        keyexchange=ikev2
        fragmentation=yes
        forceencaps=yes
        dpdaction=clear
        dpddelay=300s
        rekey=no
        left=%any
        leftid=18.188.145.101
        leftcert=server-cert.pem
        leftsendcert=always
        leftsubnet=0.0.0.0/0
        right=%any
        rightid=%any
        rightauth=eap-mschapv2
        rightsourceip=10.10.10.0/24
        rightdns=8.8.8.8,8.8.4.4
        rightsendcert=never
        eap_identity=%identity
    ```

1. On your server, replace the `SERVER_EXTERNAL_IP` with your VPN server's external IP and `USERNAME/PASSWORD` with your values:

    ```properties
    SERVER_EXTERNAL_IP="18.188.145.101"
    USERNAME="myuser"
    PASSWORD="mypassword"
    ```

1. Install the necessary dependencies:

    ```bash
    sudo apt-get update
    sudo apt install -y strongswan strongswan-pki
    ```

1. Set up the security certificates and keys:

    ```bash
        mkdir -p ~/pki/{cacerts,certs,private}
        chmod 700 ~/pki
        ipsec pki --gen --type rsa --size 4096 --outform pem > ~/pki/private/ca-key.pem
        ipsec pki --self --ca --lifetime 3650 --in ~/pki/private/ca-key.pem \ --type rsa --dn "CN=VPN root CA" --outform pem > ~/pki/cacerts/ca-cert.pem

        ipsec pki --gen --type rsa --size 4096 --outform pem > ~/pki/private/server-key.pem


        ipsec pki --pub --in ~/pki/private/server-key.pem --type rsa \
    |   ipsec pki --issue --lifetime 1825 \
        --cacert ~/pki/cacerts/ca-cert.pem \
        --cakey ~/pki/private/ca-key.pem \
        --dn "CN=$SERVER_EXTERNAL_IP" --san "$SERVER_EXTERNAL_IP" \
        --flag serverAuth --flag ikeIntermediate --outform pem \
    >  ~/pki/certs/server-cert.pem

        sudo cp -r ~/pki/* /etc/ipsec.d/
    ```

1. Configure [StrongSwan](https://www.strongswan.org/) (see the `server.conf` file described above).

    ```bash
        sudo cp ~/ipsec.conf /etc/ipsec.conf
    ```

1. Configure the VPN server's authentication.

    ```bash
        echo -e ": RSA \"server-key.pem\"\n$USERNAME : EAP \"$PASSWORD\"" | sudo tee /etc/ipsec.secrets

        sudo systemctl restart strongswan
    ```

1. Configure the OS kernel.

    ```bash
        sudo sed -i 's/#net\/ipv4\/ip_forward=1/net\/ipv4\/ip_forward=1/g' /etc/ufw/sysctl.conf
        sudo sed -i 's/#net\/ipv4\/conf\/all\/accept_redirects/net\/ipv4\/conf\/all\/accept_redirects/g' /etc/ufw/sysctl.conf
        echo "net/ipv4/conf/all/send_redirects=0" | sudo tee -a /etc/ufw/sysctl.conf
        echo "net/ipv4/ip_no_pmtu_disc=1" | sudo tee -a /etc/ufw/sysctl.conf
    ```

1. Configure the OS's firewall.

    ```bash
        networkInterfaceName=$(ip link | awk -F: '$0 !~ "lo|vir|^[^0-9]"{print $2a;getline}' | head -1)
        config="-A ufw-before-forward --match policy --pol ipsec --dir in --proto esp -s 10.10.10.0/24 -j ACCEPT"
        config="$config\n-A ufw-before-forward --match policy --pol ipsec --dir out --proto esp -d 10.10.10.0/24 -j ACCEPT"
        config="$config\nCOMMIT"
        config="$config\n*nat\n-A POSTROUTING -s 10.10.10.0/24 -o $networkInterfaceName -m policy --pol ipsec --dir out -j ACCEPT"
        config="$config\n-A POSTROUTING -s 10.10.10.0/24 -o $networkInterfaceName -j MASQUERADE"
        config="$config\nCOMMIT"
        config="$config\n*mangle"
        config="$config\n-A FORWARD --match policy --pol ipsec --dir in -s 10.10.10.0/24 -o $networkInterfaceName -p tcp -m tcp --tcp-flags SYN,RST SYN -m tcpmss --mss 1361:1536 -j TCPMSS --set-mss 1360"
        config="$config\nCOMMIT"
        sudo sed -i "s/COMMIT//g" /etc/ufw/before.rules
        echo -e $config | sudo tee -a /etc/ufw/before.rules

        sudo ufw allow 500,4500/udp
        sudo ufw allow OpenSSH
        sudo ufw disable
        sudo ufw enable
    ```

1. Obtain a server certificate to use on the client.

    ```bash
        cat /etc/ipsec.d/cacerts/ca-cert.pem
    ```

The IPsec VPN server has been configured.

## Basic Setup for the OpenVPN Server

Follow these steps if using an OpenVPN server:

1. Create a `~/server.conf` with the following values:

    ```properties
        #Port where the VPN server will answer requests
        port 1194

        #TCP or UDP - UDP is faster
        proto udp

        #This will create a routed IP tunnel instead of an ethernet tunnel
        dev tun

        #The VPN subnet range, all IPs that connected clients will have upon connection
        #The Server will take the first IP (in this case, 10.10.20.1),
        #and all other addresses are available to clients
        server 10.10.20.0 255.255.255.0

        #SSL root certificate (ca), certificate itself (cert) and private key (key)
        #All clients use the same CA, but have their own cert and key.
        ca /etc/openvpn/keys/ca.crt
        cert /etc/openvpn/keys/server.crt
        key /etc/openvpn/keys/server.key

        #Diffie Hellman parameters, this file can be generated with
        #openssl dhparam -out dh2048.pem 2048
        dh /etc/openvpn/keys/dh2048.pem

        #Records the IP address of each client so clients can use the same IP address
        #in case of reconnection
        ifconfig-pool-persist ipp.txt

        #Keeps connection alive, sends a ping every 10 seconds, and assume the connection is
        #down if no ping is received in 120 seconds
        keepalive 10 120

        #Cryptographic cipher used. The Client must use the same cipher
        cipher AES-256-CBC

        #HMAC - Hashed Message Authentication Code - used to avoid UDP port flooding,
        #must be the same on client and server
        auth SHA256

        #Enable compression on the VPN link
        compress lz4-v2
        push "compress lz4-v2"

        #Allows username/password authentication via PAM (linux accounts, LDAP),
        #if not provided, authentication is done via x509 certificates
        plugin /usr/lib/x86_64-linux-gnu/openvpn/plugins/openvpn-plugin-auth-pam.so login

        #Explicitly disables x509 certificate authentication
        verify-client-cert none

        #Try to avoid accessing certain resources on restart,
        #since they may not be available
        persist-key
        persist-tun

        #Notify all clients when the service is restarting,
        #so they can try to reconnect automatically
        explicit-exit-notify 1

        #Short status file showing current connections, updated every minute
        status openvpn-status.log

        #Redirect log messages to a log file
        log-append  /var/log/openvpn.log

        #Log verbosity, 0 is silent, 9 is extremely verbose
        verb 7
    ```

1. Install the necessary dependencies:

    ```bash
        sudo apt-get update
        sudo apt-get install -y openvpn easy-rsa
    ```

1. Set up the certificates and keys.

    ```bash
        make-cadir ~/openvpn-ca
        cd ~/openvpn-ca
        source vars
        ./clean-all
        ln -s openssl-1.0.0.cnf openssl.cnf
        ./build-ca
        ./build-dh
        ./build-key-server server
        openvpn --genkey --secret keys/ta.key
        sudo mkdir -p /etc/openvpn/keys/ && sudo cp ~/openvpn-ca/keys/* /etc/openvpn/keys/
    ```

1. Use the OpenVPN `server.conf` file from above.

    ```bash
        sudo cp ~/server.conf /etc/openvpn/
    ```

1. Configure the OS kernel.

    ```bash
        sudo sed -i 's/#net.ipv4.ip_forward=1/net.ipv4.ip_forward=1/g' /etc/sysctl.conf
        sudo sysctl -p
    ```

1. Configure the OS firewall

    ```bash
        networkInterfaceName=$(ip link | awk -F: '$0 !~ "lo|vir|^[^0-9]"{print $2a;getline}' | head -1)
        echo -e "*nat\n:POSTROUTING ACCEPT [0:0]\n-A POSTROUTING -s 10.8.0.0/8 -o $networkInterfaceName -j MASQUERADE\nCOMMIT\n" | sudo tee -a /etc/ufw/before.rules
        sudo sed -i 's/DEFAULT_FORWARD_POLICY="DROP"/DEFAULT_FORWARD_POLICY="ACCEPT"/g' /etc/default/ufw
        sudo ufw allow 1194/udp
        sudo ufw allow OpenSSH
        sudo ufw disable
        sudo ufw enable
    ```

1. Start the VPN server service.

    ```bash
        sudo systemctl start openvpn@server
    ```

1. Create the OS user to be used for authentication on the VPN.

    ```bash
        sudo adduser myuser
    ```

The OpenVPN server has been configured.
