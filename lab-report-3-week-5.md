# The grep command

### Syntax of the grep command

`grep [optional-filters] "<your-string-to-search>" <files-to-search>`


Optional command line filters

To show some of the commands off I will be using the file `technical/biomed/1471-2105-3-2.txt` from the a [docsearch git repository](https://github.com/ucsd-cse15l-f22/docsearch/)

`grep "Base pair" technical/biomed/1471-2105-3-2.txt`

outputs

![Image](/IMAGES/normalGrep.PNG)

-v : This prints out all the lines that do not matches the pattern

`grep -v "Base pair" technical/biomed/1471-2105-3-2.txt`

outputs

![Image](/IMAGES/vGrep.PNG)

-i : Ignores, case for matching

This allows you to search for the word no matter the caseing of the letters.

`grep -i "Base pair" technical/biomed/1471-2105-3-2.txt`

outputs

![Image](/IMAGES/iGrep.PNG)

-w : Match whole word

`grep -w "Base pair" technical/biomed/1471-2105-3-2.txt`

outputs

![Image](/IMAGES/wGrep.PNG)