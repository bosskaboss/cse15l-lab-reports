# The grep command

### Syntax of the grep command

`grep [optional-filters] "<your-string-to-search>" <files-to-search>`


Optional command line filters

To show some of the commands off I will be using the file `technical/biomed/1471-2105-3-2.txt` from the [docsearch git repository](https://github.com/ucsd-cse15l-f22/docsearch/)

`grep "Base pair" technical/biomed/1471-2105-3-2.txt`

outputs

![Image](/IMAGES/normalGrep.PNG)

-n : Display the matched lines and their line numbers.

Useful if you want to change the phrase and need to know where it is.

`grep -n "Base pair" technical/biomed/1471-2105-3-2.txt`

Finds the lines that dont contain "base pair". Outputs

![Image](/IMAGES/nGrep.PNG)

`grep -n "Nucleotide" technical/biomed/1471-2105-3-2.txt`

![Image](/IMAGES/nGrep2.PNG)

`grep -n "RNA" technical/biomed/1471-2105-3-2.txt`

![Image](/IMAGES/nGrep3.PNG)

-i : Ignores, case for matching

This allows you to search for the word no matter the casing of the letters so if the word was typed weirdly with some capitilized letters it would still find it for you.

`grep -i "Base pair" technical/biomed/1471-2105-3-2.txt`

outputs

![Image](/IMAGES/iGrep.PNG)

`grep -i "Nucleotide" technical/biomed/1471-2105-3-2.txt`

![Image](/IMAGES/iGrep2.PNG)

`grep -i "RNA" technical/biomed/1471-2105-3-2.txt`

![Image](/IMAGES/iGrep3.PNG)

-w : Match whole word

This command is usefull as it lets you find the exact word for example if you want to search for the word "dash" it will ignore words like "dashdoor", "dashing", and "dashier".

`grep -w "Base pair" technical/biomed/1471-2105-3-2.txt`

finds the word "Base pair" and not "base pair" or "base pairs". Output:

![Image](/IMAGES/wGrep.PNG)

`grep -w "Nucleotide" technical/biomed/1471-2105-3-2.txt`

![Image](/IMAGES/wGrep2.PNG)

`grep -w "RNA" technical/biomed/1471-2105-3-2.txt`

![Image](/IMAGES/wGrep3.PNG)