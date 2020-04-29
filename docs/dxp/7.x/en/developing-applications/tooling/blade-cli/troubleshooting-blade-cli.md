# Troubleshooting Blade CLI

If Blade CLI isn't working as expected, you may find answers here. 

## The blade command is not available in my CLI

If you used the install script, the path to the `blade` executable must be added to your system `$PATH` variable: 

**macOS**

```bash
echo 'export PATH="$PATH:$HOME/Library/PackageManager/bin"' >> ~/.bash_profile
```

**Linux**

```bash
echo 'export PATH="$PATH:$HOME/jpm/bin"' >> ~/.bash_profile
```

If you're using a shell other than `bash`, you must add the path to the `blade` executable manually. 

## I can't update blade

You may have tried to update Blade CLI by downloading a newer installer and installing it over your existing version. This is not supported, and now you may have two separate installations on your machine. You must delete the legacy Blade files in your global folder, if present. 

Using an administrative account, navigate to your `[global folder]/jpm4j` folder and delete these two files: 

- `/bin/blade`
- `/commands/blade`

Now the newer installation in your user home folder is recognized and available in your CLI. 
