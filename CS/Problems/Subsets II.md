---
tags:
  - dsa
  - backtracking
To_review: true
Status: Review again
Link: "[leetcode](https://leetcode.com/problems/subsets-ii/description/)"
Time_in_minutes: 15
Difficulty: medium
---
# Problem
## Description
Given an integer array `nums` that may contain duplicates, return _all possible_ 

_subsets_

 _(the power set)_.

The solution set **must not** contain duplicate subsets. Return the solution in **any order**.

**Example 1:**

**Input:** nums = [1,2,2]
**Output:** [[],[1],[1,2],[1,2,2],[2],[2,2]]

**Example 2:**

**Input:** nums = [0]
**Output:** [[],[0]]

**Constraints:**

- `1 <= nums.length <= 10`
- `-10 <= nums[i] <= 10`
## My solution
```cpp
class Solution {
    public:
public:
    vector<vector<int>> subsetsWithDup(vector<int>& nums) {
        vector<vector<int>> result;
        vector<int> subResult;
        sort(nums.begin(), nums.end());
        backtrack(nums, result, subResult, 0);
        return result;
    }

    void backtrack(vector<int>& nums, vector<vector<int>>& result, vector<int>& subResult, int pos) {
        result.push_back(subResult);
        for (int i = pos; i < nums.size(); i++) {
            if (i != pos && nums[i] == nums[i - 1]) continue;
            subResult.push_back(nums[i]);
            backtrack(nums, result, subResult, i + 1);
            subResult.pop_back();
        }
    }
};
```
## Optimal solution
```cpp
same as above
```
## Notes
#dsa
1. Solution intuition
	1. Handling duplicates can be simplified with using sorting

- [ ] Get this under 5 minutes