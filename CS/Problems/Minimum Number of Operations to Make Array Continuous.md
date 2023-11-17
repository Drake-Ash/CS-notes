---
tags:
  - dsa
  - sliding-window
  - binary-search
To_review: true
Status: Review again
Link: "[leetcode](https://leetcode.com/problems/minimum-number-of-operations-to-make-array-continuous/)"
Time_in_minutes: 42
Difficulty: hard
---
# Problem
## Description
You are given an integer array `nums`. In one operation, you can replace **any** element in `nums` with **any** integer.

`nums` is considered **continuous** if both of the following conditions are fulfilled:

- All elements in `nums` are **unique**.
- The difference between the **maximum** element and the **minimum** element in `nums` equals `nums.length - 1`.

For example, `nums = [4, 2, 5, 3]` is **continuous**, but `nums = [1, 2, 3, 5, 6]` is **not continuous**.

Return _the **minimum** number of operations to make_ `nums` **_continuous_**.

**Example 1:**

**Input:** nums = [4,2,5,3]
**Output:** 0
**Explanation:** nums is already continuous.

**Example 2:**

**Input:** nums = [1,2,3,5,6]
**Output:** 1
**Explanation:** One possible solution is to change the last element to 4.
The resulting array is [1,2,3,5,4], which is continuous.

**Example 3:**

**Input:** nums = [1,10,100,1000]
**Output:** 3
**Explanation:** One possible solution is to:
- Change the second element to 2.
- Change the third element to 3.
- Change the fourth element to 4.
The resulting array is [1,2,3,4], which is continuous.

**Constraints:**

- `1 <= nums.length <= 105`
- `1 <= nums[i] <= 109`
## My solution
```cpp
class Solution {
public:
    int minOperations(vector<int>& nums) {
        int n = nums.size();
        set<int> uniqueNums(nums.begin(), nums.end());
        vector<int> newNums(uniqueNums.begin(), uniqueNums.end());
        
        int r = 0;
        int ops = n;

        for (int l = 0; l < newNums.size(); l++) {
            while (r < newNums.size() && newNums[r] < n + newNums[l]) r++;
            ops = min(ops, n - (r - l));
        }

        return ops;
    }
};
```
## Optimal solution
```cpp
same as above
```
## Notes
#dsa
1. Iterate faster to get to the solution
2. Simpler solutions are the key sometimes. Think and keep it simple
- [ ] Get this under 15 minutes