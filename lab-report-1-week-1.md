# How to log into a course-specific account on ieng6

- Installing VScode
- Remotely Connecting
- Trying Some Commands
- Moving Files with `scp`
- Setting an SSH Key
- Optimizing Remote Running

To insall VScode you need to [https://code.visualstudio.com/](https://code.visualstudio.com/) and click on the download button and follow the instuctions after that.
Make sure when you are downloading you are downloading the right verion for your Operating System. 



To remotely connect to another computer we will be using the terminal that is inside of VScode. If you have a windows computer you will need to make sure you have OpenSSH CLient which could be already insalled and can check it under manage optional features in settings. If not then click here [https://docs.microsoft.com/en-us/windows-server/administration/openssh/openssh_install_firstuse](https://docs.microsoft.com/en-us/windows-server/administration/openssh/openssh_install_firstuse).

Once you have that open VScode terminal whihc you can do by clicking on terminal and then new terminal or Ctrl or Command + `.

Then to connect run the command bellow. Make sure to replace the `zz` to match with your account.

`ssh cs15lfa22zz@ieng6.ucsd.edu`

The first time you connect you will be asked to if you want to connect type yes. This is normal when connect to a new computer but concerning if you get this message often to a computer that you connect to often as it could be someone is listening in on your connection.

After typeing yes it will ask for your password.


Commands you can use 

- `cd ~` (takes you to home directory)
- `ls <directory>`
- Ctr + D or `exit` (stop remote connection)



Create a file you want to copy on your local computer. (a blank Hello.txt file works)

Format of using `scp`

`scp <file1><file2> <username>@<servername>:<directory>`

`scp Hello.txt cs15lfa22zz@ieng6.ucsd.edu:~/`

Now when you connect to the remot computer and type `ls` you should see the file you copied over.



Now to make connecting to the remote computer easier you can give the remote computer your local computer ssh key. It lets you log in without haing to type the password.

Type

``
