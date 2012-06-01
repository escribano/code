http://www.w3schools.com/jsref/jsref_slice_array.asp

Example

Select elements from an array:
````
var fruits = ["Banana", "Orange", "Lemon", "Apple", "Mango"];
var citrus = fruits.slice(1,3);
````
The result of citrus will be:

Orange,Lemon

Definition and Usage

The slice() method returns the selected elements in an array, as a new array object.

The slice() method selects the elements starting at the given start argument, and ends at, but does not include, the given end argument.

Note: The original array will not be changed.

The slice() method is supported in all major browsers.

Syntax

array.slice(start, end)
Parameter Values

Parameter	Description
start	Required. An integer that specifies where to start the selection (The first element has an index of 0). Use negative numbers to select from the end of an array
end	Optional. An integer that specifies where to end the selection. If omitted, all elements from the start position and to the end of the array will be selected. Use negative numbers to select from the end of an array
Technical Details

Return Value:	An Array() object, containing the selected elements
JavaScript Version:	1.2

More Examples

Example

Select elements using negative values:

var fruits = ["Banana", "Orange", "Lemon", "Apple", "Mango"];
var myBest = fruits.slice(-3,-1);
The result of myBest will be:

Lemon,Apple


