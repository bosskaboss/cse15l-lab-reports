# How to log into a course-specific account on ieng6

- Installing VScode
- Remotely Connecting
- Trying Some Commands
- Moving Files with `scp`
- Setting an SSH Key
- Optimizing Remote Running

To insall VScode you need to [https://code.visualstudio.com/](https://code.visualstudio.com/) and click on the download button and follow the instuctions after that.
Make sure when you are downloading you are downloading the right verion for your Operating System. 

![Image](/IMAGES/VScodeDownloadPage.PNG)

To remotely connect to another computer we will be using the terminal that is inside of VScode. If you have a windows computer you will need to make sure you have OpenSSH CLient which could be already insalled and can check it under manage optional features in settings. If not then click here [https://docs.microsoft.com/en-us/windows-server/administration/openssh/openssh_install_firstuse](https://docs.microsoft.com/en-us/windows-server/administration/openssh/openssh_install_firstuse).

Once you have that open VScode terminal whihc you can do by clicking on terminal and then new terminal or Ctrl or Command + `.

Then to connect run the command bellow. Make sure to replace the `zz` to match with your account.

`ssh cs15lfa22zz@ieng6.ucsd.edu`

The first time you connect you will be asked to if you want to connect type yes. This is normal when connect to a new computer but concerning if you get this message often to a computer that you connect to often as it could be someone is listening in on your connection.

After typeing yes it will ask for your password.

![Image](/IMAGES/RemoteConnecting.PNG)

Commands you can use 

- `cd ~` (takes you to home directory)
- `ls <directory>`
- Ctr + D or `exit` (stop remote connection)

![Image](/IMAGES/SomeCommands.PNG)

Create a file you want to copy on your local computer. (a blank Hello.txt file works)

Format of using `scp`

`scp <file1><file2> <username>@<servername>:<directory>`

`scp Hello.txt cs15lfa22zz@ieng6.ucsd.edu:~/`

Now when you connect to the remot computer and type `ls` you should see the file you copied over.

![Image](/IMAGES/CopyFilesSSH.PNG)

Now to make connecting to the remote computer easier you can give the remote computer your local computer ssh key. It lets you log in without haing to type the password.

Type

`ssh-keygen`

but if your on windows type

`ssh-keygen -t ed25519`

and then make sure you're running as an Administrator.
```
Get-Service ssh-agent | Set-Service -StartupType Automatic

Start-Service ssh-agent

Get-Service ssh-agent

ssh-add <path to the sshkey>
```

Now we can add the key to the remote server

`mkdir .ssh`

and then send the file to the server to the new directory.

`scp /Users/joe/.ssh/id_rsa.pub cs15lfa22@ieng6.ucsd.edu:~/.ssh/authorized_keys`

**make sure the path matches yours.**

Then it should work.

![Image](/IMAGES/SSHKeyNoPass.PNG)