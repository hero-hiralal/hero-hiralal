KALI-APKTOOL-FIX

This script is to fix apktool in kali which is outdated.

When will encounter this error?
While using msfvenom to create android payload you may encounter this error and it fails due to the deprecated version.

This script is nothing but an automated update of apktool.

If you check out current version of your apktool it must be 2.7.0+dsfg which indeed creates this error in the
first place. 

If you check out the code I have set apt package manager to hold the package as in future if you try to update
apktool will be held back so that you dont install the outdated package from the kali repository.