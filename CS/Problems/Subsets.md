---
tags:
  - dsa
  - backtracking
To_review: true
Status: Complete | Pending review
Link: "[leetcode](https://leetcode.com/problems/subsets/)"
Time_in_minutes: 
Difficulty: medium
---
# Problem
## Description
Given an integer array `nums` of **unique** elements, return _all possible_ 

_subsets_

 _(the power set)_.

The solution set **must not** contain duplicate subsets. Return the solution in **any order**.

**Example 1:**

**Input:** nums = [1,2,3]
**Output:** [[],[1],[2],[1,2],[3],[1,3],[2,3],[1,2,3]]

**Example 2:**

**Input:** nums = [0]
**Output:** [[],[0]]

**Constraints:**

- `1 <= nums.length <= 10`
- `-10 <= nums[i] <= 10`
- All the numbers of `nums` are **unique**.
## My solution
```cpp
class Solution {
public:
    vector<vector<int>> subsets(vector<int>& nums) {
        vector<int> curr;
        vector<vector<int>> result;
        dfs(nums, 0, curr, result);
        return result;
    }

    void dfs1(vector<int> nums, int start, vector<int> &curr, vector<vector<int>> &result) {
        result.push_back(curr);
        for (int i = start; i < nums.size(); i++) {
            curr.push_back(nums[i]);
            dfs(nums, i+1, curr, result);
            curr.pop_back();
        }
    }

    void dfs(vector<int> nums, int start, vector<int> &curr, vector<vector<int>> &result) {
        if (start == nums.size()) {
            result.push_back(curr);
            return;
        }
        curr.push_back(nums[start]);
        dfs(nums, start+1, curr, result);
        curr.pop_back();
        dfs(nums, start+1, curr, result);
    }

};
```
## Optimal solution
```cpp
same as above
```
## Notes
#dsa
1. There are multiple ways to solve a problem, think of solving it the way you understand it, you can simplify your understanding later and build better solutions as you get used to it
  
![diff](https://leetcode.com/problems/subsets/Figures/78/combinations.png)
