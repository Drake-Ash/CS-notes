---
tags:
  - dsa
  - arrays
To_review: true
Status: Review again
Link: "[leetcode](https://leetcode.com/problems/product-of-array-except-self/)"
Difficulty: medium
Time_in_minutes: 20
---
# Problem
## Description
Given an integer array `nums`, return _an array_ `answer` _such that_ `answer[i]` _is equal to the product of all the elements of_ `nums` _except_ `nums[i]`.

The product of any prefix or suffix of `nums` is **guaranteed** to fit in a **32-bit** integer.

You must write an algorithm that runs in `O(n)` time and without using the division operation.

**Example 1:**

**Input:** nums = [1,2,3,4]
**Output:** [24,12,8,6]

**Example 2:**

**Input:** nums = [-1,1,0,-3,3]
**Output:** [0,0,9,0,0]

**Constraints:**

- `2 <= nums.length <= 105`
- `-30 <= nums[i] <= 30`
- The product of any prefix or suffix of `nums` is **guaranteed** to fit in a **32-bit** integer.
## My solution
```cpp
class Solution {

public:

    vector<int> productExceptSelf(vector<int>& nums) {

        vector<int> leftProduct(nums.size());

        vector<int> rightProduct(nums.size());

        vector<int> result(nums.size());

        leftProduct[0] = 1;

        for (int i = 1; i < nums.size(); i++) {

            leftProduct[i] = leftProduct[i-1] * nums[i-1];

        }

  

        rightProduct[nums.size()-1] = 1;

        for (int i = nums.size() - 2; i != -1; i--) {

            rightProduct[i] = rightProduct[i+1] * nums[i+1];

        }

  

        for (int i = 0; i<leftProduct.size(); i++) {

            result[i] = leftProduct[i] * rightProduct[i];

        }

        return result;

    }

};
```
## Optimal solution
```cpp
class Solution {
public:
    vector<int> productExceptSelf(vector<int>& nums) {
        int n = nums.size();
        vector<int> output(n);
        output[0] = 1;
        for(int i=1; i<n; i++){
            output[i] = output[i-1] * nums[i-1];
        }
        int right = 1;
        for(int i=n-1; i>=0; i--){
            output[i] *= right;
            right *= nums[i];
        }
        return output;
    }
};
```
## Notes
1. Possible solutions
	1. Brute force - iterate over all items and find the product except self - O(n^2)
		1. Bit more optimised, use occurrences count to speed up calculations
	2. Division approach - Multiply all and divide with each index value to get the result array
2. Checked solutions and understood what needs to be done
	1. Take left and right products separately for each index and store it
	2. result will be multiplication of these left and right products array
- [ ] Get this under 10 minutes