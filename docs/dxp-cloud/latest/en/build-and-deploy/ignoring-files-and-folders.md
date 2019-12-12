# Ignoring Files and Folders

DXP Cloud allows subscribers to determine which files and folders should be ignored before deploying a service. This is done by creating a `.lcpignore` file and placed inside the top level of the project folder (for example: `/etc/lfrlearn/` where `lfrlearn` is the project name). By placing the file here, the **ignore** rules can be shared with other users.

## Using the `.lcpignore` File

1. Navigate to the location of the project folder.
1. Create a file called `.lcpignore`.
1. Modify the file accordingly.
1. Run `lcp deploy` on a terminal to deploy your service with the new `.lcpignore` rules.

## LCP Ignore Patterns

The `.lcpignore` file uses globbing patterns to match against file names. (These are the same patterns used in a `.gitignore` file.) Administrators can construct such patterns using various symbols:

| Pattern | Example matches | Explanation* |
| --- | --- | --- |
| `**/service` | `service/file.txt`, or, `service/monday/foo.bar`, or `build/service/file.txt` | Prepending a pattern with a double asterisk matches folders anywhere in the repository. |
| `**/service/file.txt` | `service/file.txt`; or `build/service/file.txt` but not `service/build/file.txt` | Using a double asterisk matches files based on their name and the name of their parent folder. |
| `*.txt` | `file.txt`, `foo.txt`, `.txt`, or, `service/file.txt` | An asterisk is a wildcard that matches zero or more characters. |
| `*.txt` or `!important.txt` | `file.txt`, `trace.txt` but not `important.txt`, `service/important.txt` |Prepending an exclamation mark to a pattern negates it. If a file matches a pattern, but also matches a negating pattern defined later in the file, it will not be ignored. |
| `*.txt` or `!important/*.txt` or `trace.*` | `file.txt` `important/trace.txt` but not `important/file.txt` | Patterns defined after a negating pattern ignores any previously negated files. |
| `/file.txt` | `file.txt`, but not `service/file.txt` | Prepending a slash matches files only in the repository root. |
| `file.txt` | `file.txt`, or `service/file.txt` | By default, patterns match files in any folder |
| `file?.txt` | `fileo.txt`, `files.txt` but not `file10.txt` | Using a question mark matches exactly one character. |
| `file[0-9].txt` | `file0.txt`, `file1.txt`, but not `file10.txt`| Using square brackets matches a single character from a specified range. |
| `file[01].txt` | `file0.txt`, `file1.txt`, but not `file2.txt` nor `file01.txt` | Using square brackets matches a single character from the specified set. |
| `file[!01].txt` | `file2.txt`, but not `file0.txt`, nor `file1.txt`, nor `file01.txt` | Using an exclamation mark matches any character except one from the specified set. |
| `file[a-z].txt` | `filea.txt`, `fileb.txt`, but not `file1.txt` | Ranges can be numeric or alphabetic. |
| `txts`| `txts`, `txt/file.txt`, `txts/latest/foo.bar`, `build/txts`, `build/txts/file.txt` | If a slash is *not* appended, the pattern will match both files and the contents of folders with that name. In the example matches on the left, both folders and files named `txts` are ignored. |
| `txts/` | `txts/file.txt`, `txts/latest/foo.bar`, `build/txts/foo.bar`, `build/txts/latest/file.txt` | Appending a slash indicates the pattern is a folder. The entire contents of any folder in the repository matching that name – including all of its files and subfolders – will be ignored. |
| `txts/**/file.txt` | `txts/file.txt`, `txts/monday/file.txt`, or `txts/monday/pm/file.txt` | A double asterisk matches zero or more folders. |
| `txts/*day/file.txt`| `txts/monday/file.txt` or `txts/tuesday/file.txt`, but not `txts/latest/file.txt` | Wildcards can be used in folder names as well. |
| `txts/file.txt` | `txts/file.txt`, but not `file.txt` `build/txts/file.txt` | Patterns specifying a file in a particular folder are relative to the repository root. Note that prepending a slash has no effect. |

As best practice, keep the `.lcpignore` file in the top level folder of your project. If your repository has multiple `.lcpignore` files (not recommended), LCP will read them as a unified document.

NOTES: If a file or folder has been deployed and administrators want to ignore it later, LCP will not ignore the file if a subsequent rule tries to include that file or folder. Rather, that file or folder will not be updated.

## Additional Information

* [Introduction to the Liferay DXP Service](../using-the-liferay-dxp-service/introduction-to-the-liferay-dxp-service.md)
* [Configuring the Liferay DXP Service](../using-the-liferay-dxp-service/configuring-the-liferay-dxp-service.md)
