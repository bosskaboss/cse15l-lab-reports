# VIM

## Part 1

One of the task was to

In DocSearchServer.java, change the main method so that rather than hardcoding the search on the `./technical` directory, it uses the second command-line argument for the path to search

`? ” . / <Enter> d 2 w x x i a r g s [ 1 ] <esc> : x <Enter>`

`? ” . / <Enter>` finds the `./technical` from the bottom because there are multiple `./technical` and the one we want to change is at the bottom.

![](/IMAGES/challengeStep1.PNG)

`d 2 w` deletes `"./technical`

![](/IMAGES/challengeStep2.PNG)

`x x` deletes `/"`

![](/IMAGES/challengeStep3.PNG)

`i a r g s [ 1 ] <esc>` inserts `arg[1]` and escapes to normal mode 

![](/IMAGES/challengeStep4.PNG)

`: x <Enter>` saves and exits vim

![](/IMAGES/challengeStep5.PNG)


## Part 2

It took me 3mins and 15sec to scp the file to the remote server and run it there

It took me 1min and 2 sec to edit it in vim and run it.

Which of these two styles would you prefer using if you had to work on a program that you were running remotely, and why?

I would prefer editing it in vim and running it as I don't have to go through the hasle of login and then making sure I am in the right directory to run the file.

What about the project or task might factor into your decision one way or another? (If nothing would affect your decision, say so and why!)

The amount of editing I would have to do would play a factor. If I have to write a whole new file I would scp that file in to make sure it doesn't have any errors but if its a small change like a string then I would use vim. 