# AutoGrader

```
# Create your grading script here

set -e

rm -rf student-submission
git clone $1 student-submission

FILE="student-submission/ListExamples.java"

if [ -f "$FILE" ]
then
    echo "$FILE does exist."
else
    echo "$FILE does not exist."
    exit
fi


cp TestListExamples.java ./student-submission

set +e

javac -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar student-submission/*.java 2> error.txt

set -e

if [ -s error.txt ]
then
    echo "$(cat error.txt)"
    exit
fi

cd ./student-submission

set +e
java -cp .:../lib/hamcrest-core-1.3.jar:../lib/junit-4.13.2.jar org.junit.runner.JUnitCore TestListExamples > junitoutput.txt
grep -n ") " junitoutput.txt > foutput.txt
set -e

if [ -s foutput.txt ]
then
    echo "$(cat foutput.txt)"
    echo "You failed no points!"
    exit
else
    echo "You Passed full points!"
    exit
fi

```

![](/IMAGES/lab5pic1.PNG)

![](/IMAGES/lab5pic2.PNG)

![](/IMAGES/lab5pic3.PNG)


## Trace

`set -e `
___

* stdout:   ""
* stderr:   ""
* exitcode: 0

`rm -rf student-submission`
___

* stdout:   ""
* stderr:   ""
* exitcode: 0

`git clone $1 student-submission`
___

* stdout:   ""
* stderr:   "Cloning into 'student-submission'..."
* exitcode: 0

`if [ -f "$FILE" ]`
___

* This is true because `-f` checks to see if file exists which it does.

`echo "$FILE does exist."`
___

* stdout:   "student-submission/ListExamples.java does exist."
* stderr:   ""
* exitcode: 0

`cp TestListExamples.java ./student-submission`
___

* stdout:   ""
* stderr:   ""
* exitcode: 0

`set +e`
___

* stdout:   ""
* stderr:   ""
* exitcode: 0

`javac -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar student-submission/*.java 2> error.txt`
___

* stdout:   ""
* stderr:   "student-submission/ListExamples.java:15: error: ';' expected
        result.add(0, s)
                        ^
1 error"
* exitcode: 1

`set -e`
___

* stdout:   ""
* stderr:   ""
* exitcode: 0

`if [ -s error.txt ]`
___

* This is true because it checks to see if anything is in error.txt which there is.

`echo "$(cat error.txt)"`
____
* stdout:   ""
* stderr:   ""
* exitcode: 0

`exit`
___

* stdout:   ""
* stderr:   ""
* exitcode: 0