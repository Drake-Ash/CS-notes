---
tags:
  - arrays
---
# Intro
Collection of items of same data type which are stored in contiguous memory locations. Arrays are data structures, not data types. They help with storing different data types

## Properties of an array
![[Pasted image 20230908163214.png]]
Positions are usually calculated by adding an offset to base variables memory value, this works because of same data type

## Different dimensions of arrays
We can have multiple dimensions for an array
2D array example
![[Pasted image 20230908164358.png]]

## Static and Dynamic arrays
Arrays can be of 2 types based on memory allocation
### Static Arrays
Memory allocation is fixed in during the declaration of array
```
int arr[5] = {1,2,3,4,5};
```
### Dynamic Arrays
Memory allocation is not fixed, can change based on the elements added into the array
```
vector<int> arr(5) = {1,2,3,4,5};
```
