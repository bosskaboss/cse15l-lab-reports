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
The method handleRequest gets called for the different urls.

![Image1](/IMAGES/SearchEngine1.PNG)

When opening the SearchEngine and no words has been added it displays an empty list.

Since the path is just "/" is returns a list of strings that has been added.

![Image2](/IMAGES/SearchEngineAddApple.PNG)

When adding `/add?s=applle` to the url it adds the word if its not already in the list.

Since the path includes a `/add` it is going to add the word that comes after the `=`.

Should you change the word after the `=` it will make a new request and add the word if its not already in the list.

![Image3](/IMAGES/SearchEngine2.PNG)

When going back you can see that the word was added to the list.

![Image4](/IMAGES/SearchEngineQueryApp.PNG)

When adding `/search?s=app` it looks through the list for words that contain "app" and returns them.

Since the path includes a `/search` it is going to look for the word that contains the prase after the `=`.

Should you change the word after the `=` it will make a new request and look through the list for words that contain the new phrase and returns them.


# Symptoms and Failure-inducing Inputs

## Array Methods

- The failure-inducing input
```java
@Test
  public void testReverse() {
    int[] a = {3, 1, 5};
    assertArrayEquals(new int[]{5, 1, 3}, ArrayExamples.reversed(a));
  }
@Test
  public void testReverseInPlaceMulti() {
    int[] input = {0, 1, 2, 3, 4};
    ArrayExamples.reverseInPlace(input);
    assertArrayEquals(new int[]{4, 3, 2, 1, 0}, input);
  }
```


- The symptom
![Image](/IMAGES/ArrayMethodBugs.PNG)

3)When the test is run on reverse, the output is actually {0,0,0}

2)When the test is run on reverseInPlace, the output is actually {4, 3, 2, 3, 4}


- The Bug
```java
static int[] reversed(int[] arr) {
    int[] newArray = new int[arr.length];
    for(int i = 0; i < arr.length; i += 1) {
      arr[i] = newArray[arr.length - i - 1];
          }
    return arr;
}
```

The reason reversed is returning zero because it is copying the values from a array with 0 value elements. newArray should have copied the contents of arr.

```java
static void reverseInPlace(int[] arr) {
    for(int i = 0; i < arr.length; i += 1) { 
        arr[i] = arr[arr.length - i - 1];
        } 
  }
```

The reason reverseInPlace is outputting that is because it is not using a temporary variable to store the values of the first half of the array which are lost once the first few reversal steps occur.

## List Methods

- The failure-inducing input
```java
@Test
    public void filterTest() {
        List<String> list_input = new ArrayList<String>();
        list_input.add("Apple");
        list_input.add("Bannana");
        list_input.add("Orange");
        StringChecker SC = new StrCh();
        list_input = ListExamples.filter(list_input, SC);
        List<String> list_output = new ArrayList<String>();
        list_output.add("Bannana");
        list_output.add("Orange");
        assertEquals(list_output, list_input);
    }
@Test 
	public void testMerge() {
		ArrayList<String> first = new ArrayList<String>();
		ArrayList<String> second = new ArrayList<String>();
		first.add("A");
		second.add("B");
		first.add("C");
		second.add("D");
		
		ArrayList<String> test = new ArrayList<String>();
		test.add("A");
		test.add("B");
		test.add("C");
		test.add("D");
		assertEquals(test, ListExamples.merge(first, second));
	}
```

-The symptom
![Image](/IMAGES/ListMethodSymptom1.PNG)

It filters and adds the items in the revers order instead of in the order  of the original list.

Merge runs forever, in an infinite loop, Java ends the process as the heap is full and there is no longer any available memory remaining.

- The bug
```java
if(sc.checkString(s))
```
The index parameter should be return.size()-1 so it can add items at the end of the list.

```Java
if(list1.get(index1).compareTo(list2.get(index2)) < 0)
```

The program does not check if the current list element has already been added. Thus, in line 28, the program continuously adds the last element from list1 when all elements in list1 are lexicographically lesser in value, as compared with the elements from list2.
