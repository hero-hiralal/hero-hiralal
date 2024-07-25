#/bin/bash
#This is a script to fix apktool error which you will face upon the latest installation
#The kali repository has a version of the apktool such as 2.7.0-dsfg, which is buggy and must be deprecated.
#To fix this error we need manually install the latest version for the developer site (iboughtpeaches).

#Let's remove the current package
sudo --purge remove apktool

#Then lets download the files that we need. (Will download a wrapper script named as "apktool")  
wget https://raw.githubusercontent.com/iBotPeaches/Apktool/master/scripts/linux/apktool

#Give execution permissions to it.
chmod +x apktool

#Then download the jar file of apktool.(This is a current version but may be different for you as they keep releasing every 2 months.. So just check out "https://bitbucket.org/iBotPeaches/apktool/downloads/" for updates)
wget https://bitbucket.org/iBotPeaches/apktool/downloads/apktool_2.9.3.jar

#Now we have to move them to the usr/local/bin and with the same command lets change the name from "apktool_2.9.3.jar" to just apktool.jar as it be easy for the wrapper script to find it.
mv apktool_2.9.3.jar /usr/local/bin/apktool.jar

#Lets move the wrapper script alongside with it

mv apktool /usr/local/bin

#Now after you have done this lets make sure that upon updating kali-linux the package doesnt get updated as it will download the buggy version over the latest one we installed.
#For that lets use apt-mark hold to stop the package from updating.
sudo apt-mark hold apktool

# And  you're done fixing.. I would suggest to use this info as a script so that you  don't have to manually set it up (Only keep in mind that to check the latest version from the i-bot-peaches website.)

#Test apktool
apktool -h

