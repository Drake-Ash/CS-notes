---
tags:
  - dsa
  - two-pointers
To_review: true
Status: Complete
Link: "[leetcode](https://leetcode.com/problems/container-with-most-water/)"
Time_in_minutes: 10
Difficulty: medium
---
# Problem
## Description
You are given an integer array `height` of length `n`. There are `n` vertical lines drawn such that the two endpoints of the `ith` line are `(i, 0)` and `(i, height[i])`.

Find two lines that together with the x-axis form a container, such that the container contains the most water.

Return _the maximum amount of water a container can store_.

**Notice** that you may not slant the container.

**Example 1:**

![](https://s3-lc-upload.s3.amazonaws.com/uploads/2018/07/17/question_11.jpg)

**Input:** height = [1,8,6,2,5,4,8,3,7]
**Output:** 49
**Explanation:** The above vertical lines are represented by array [1,8,6,2,5,4,8,3,7]. In this case, the max area of water (blue section) the container can contain is 49.

**Example 2:**

**Input:** height = [1,1]
**Output:** 1

**Constraints:**

- `n == height.length`
- `2 <= n <= 105`
- `0 <= height[i] <= 104`
## My solution
```cpp
class Solution {

public:

    int maxArea(vector<int>& height) {

        int area = 0;

        for (int i = 0, j = height.size() - 1; i < j;) {

            int currentArea = min(height[i], height[j]) * (j-i);

            if (currentArea > area) {

                area = currentArea;

            }

  

            if (height[j] > height[i]) {

                i++;

            } else if (height[j] < height[i]) {

                j--;

            } else {

                i++;

                j--;

            }

        }

  

        return area;

    }

};
```
## Optimal solution
```cpp
same as above
```
## Notes
1. Try and identify the pattern in the problem, after brute force
	1. If you know the pattern then try solving this using that faster.
- [ ] Get this under 5 minutes