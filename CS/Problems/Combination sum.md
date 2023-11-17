---
tags:
  - dsa
  - backtracking
To_review: true
Status: Review again
Link: "[leetcode](https://leetcode.com/problems/combination-sum/description/)"
Time_in_minutes: 10
Difficulty: medium
---
# Problem
## Description
Given an array of **distinct** integers `candidates` and a target integer `target`, return _a list of all **unique combinations** of_ `candidates` _where the chosen numbers sum to_ `target`_._ You may return the combinations in **any order**.

The **same** number may be chosen from `candidates` an **unlimited number of times**. Two combinations are unique if the 

frequency

 of at least one of the chosen numbers is different.

The test cases are generated such that the number of unique combinations that sum up to `target` is less than `150` combinations for the given input.

**Example 1:**

**Input:** candidates = [2,3,6,7], target = 7
**Output:** [[2,2,3],[7]]
**Explanation:**
2 and 3 are candidates, and 2 + 2 + 3 = 7. Note that 2 can be used multiple times.
7 is a candidate, and 7 = 7.
These are the only two combinations.

**Example 2:**

**Input:** candidates = [2,3,5], target = 8
**Output:** [[2,2,2,2],[2,3,3],[3,5]]

**Example 3:**

**Input:** candidates = [2], target = 1
**Output:** []

**Constraints:**

- `1 <= candidates.length <= 30`
- `2 <= candidates[i] <= 40`
- All elements of `candidates` are **distinct**.
- `1 <= target <= 40`
## My solution
```cpp
class Solution {
public:
    vector<vector<int>> combinationSum(vector<int>& candidates, int target) {
        vector<vector<int>> result;
        vector<int> subResult;
        backtrack(candidates, target, 0, result, subResult);
        return result;
    }

    void backtrack(vector<int> &candidates, int target, int pos, vector<vector<int>> &result, vector<int> subResult) {
        if (target == 0) {
            result.push_back(subResult);
            return;
        }
        if (target < 0) return;
        for (int i = pos; i < candidates.size(); i++) {
            subResult.push_back(candidates[i]);
            backtrack(candidates, target - candidates[i], i, result, subResult);
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
1. Read the question properly before writing the code
2. Think about how to solve using the pattern properly

- [ ] Get this under 5 minutes