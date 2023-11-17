---
tags:
  - dsa
  - backtracking
To_review: true
Status: Complete | Pending review
Link: "[leetcode]()"
Time_in_minutes: 25
Difficulty: medium
---
# Problem
## Description
Given an array `nums` of distinct integers, return _all the possible permutations_. You can return the answer in **any order**.

**Example 1:**

**Input:** nums = [1,2,3]
**Output:** [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]

**Example 2:**

**Input:** nums = [0,1]
**Output:** [[0,1],[1,0]]

**Example 3:**

**Input:** nums = [1]
**Output:** [[1]]

**Constraints:**

- `1 <= nums.length <= 6`
- `-10 <= nums[i] <= 10`
- All the integers of `nums` are **unique**.
## My solution
```cpp
class Solution {
public:
    vector<vector<int>> permute(vector<int>& nums) {
        vector<vector<int>> result;
        vector<int> subResult;
        unordered_set<int> used;
        backtrack(nums, result, subResult, used);
        return result;
    }

    void backtrack(vector<int> nums, vector<vector<int>> &result, vector<int> subResult, unordered_set<int> used) {
        if (subResult.size() == nums.size()) {
            result.push_back(subResult);
            return;
        }
        for (int i = 0; i < nums.size(); i++) {
            if (used.count(nums[i]) == 0) {
                used.insert(nums[i]);
                subResult.push_back(nums[i]);
                backtrack(nums, result, subResult, used);
                used.erase(nums[i]);
                subResult.pop_back();
            }
        }
    }
};
```
## Optimal solution
```cpp
/*
    Given array of distinct integers, return all the possible permutations
    Ex. nums = [1,2,3] -> [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]

    Permute by swapping i/start, DFS from this point, backtrack to undo swap

    Time: O(n x n!)
    Space: O(n!)
*/

class Solution {
public:
    vector<vector<int>> permute(vector<int>& nums) {
        vector<vector<int>> result;
        dfs(nums, 0, result);
        return result;
    }
private:
    void dfs(vector<int>& nums, int start, vector<vector<int>>& result) {
        if (start == nums.size()) {
            result.push_back(nums);
            return;
        }
        for (int i = start; i < nums.size(); i++) {
            swap(nums[i], nums[start]);
            dfs(nums, start + 1, result);
            swap(nums[i], nums[start]);
        }
    }
};

```
## Notes
#dsa
1. Think about the tree structure to solve this
2. Optimal solution depends on how we are trying to solve the problem

- [ ] Get this under 5 minutes