set directory=%2
set file = %1
if directory == "" set directory="~/"
scp %1 cs15lfa22be@ieng6.ucsd.edu:%directory%
ssh cs15lfa22be@ieng6.ucsd.edu "ls" 
ssh cs15lfa22be@ieng6.ucsd.edu "javac %1" 
ssh cs15lfa22be@ieng6.ucsd.edu "java %~n1" 
