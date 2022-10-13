# Simple Search Engine

```java
import java.io.IOException;
import java.net.URI;
import java.util.ArrayList;

class Handler implements URLHandler {
    // The one bit of state on the server: a number that will be manipulated by
    // various requests.
    ArrayList<String> stringList = new ArrayList<>();

    public String handleRequest(URI url) {
        if (url.getPath().equals("/")) {
            return String.format("List: %s", stringList.toString());
        }
        else if (url.getPath().contains("/add")) {
            String[] parameters = url.getQuery().split("=");
            if(stringList.contains(parameters[1])){
                return String.format("Word %s already there",parameters[1]);
            }
            else{
                stringList.add(parameters[1]);
                return String.format("Word added %s", parameters[1]);
            }
        } else {
            System.out.println("Path: " + url.getPath());
            if (url.getPath().contains("/search")) {
                String[] parameters = url.getQuery().split("=");
                String strToReturn="";
                for (String string : stringList) {
                    if(string.contains(parameters[1])){
                        strToReturn += string + " ";
                    }
                }
                return strToReturn;
            }
            return "404 Not Found!";
        }
    }
}
public class SearchEngine {
    public static void main(String[] args) throws IOException {
        if(args.length == 0){
            System.out.println("Missing port number! Try any number between 1024 to 49151");
            return;
        }

        int port = Integer.parseInt(args[0]);

        Server.start(port, new Handler());
    } 
}
```

![Image1](/IMAGES/SearchEngine1.PNG)

When opening the SearchEngine and no words has been add it displays an empty list.


![Image2](/IMAGES/SearchEngineAddApple.PNG)



![Image3](/IMAGES/SearchEngine2.PNG)

![Image4](/IMAGES/SearchEngineQueryApp.PNG)



