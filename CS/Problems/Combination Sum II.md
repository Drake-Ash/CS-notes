---
tags:
  - dsa
  - backtracking
To_review: true
Status: Complete | Pending review
Link: "[leetcode](https://leetcode.com/problems/combination-sum-ii/description/)"
Time_in_minutes: 5
Difficulty: medium
---
# Problem
## Description
Given a collection of candidate numbers (`candidates`) and a target number (`target`), find all unique combinations in `candidates` where the candidate numbers sum to `target`.

Each number in `candidates` may only be used **once** in the combination.

**Note:** The solution set must not contain duplicate combinations.

**Example 1:**

**Input:** candidates = [10,1,2,7,6,1,5], target = 8
**Output:** 
[
[1,1,6],
[1,2,5],
[1,7],
[2,6]
]

**Example 2:**

**Input:** candidates = [2,5,2,1,2], target = 5
**Output:** 
[
[1,2,2],
[5]
]

**Constraints:**

- `1 <= candidates.length <= 100`
- `1 <= candidates[i] <= 50`
- `1 <= target <= 30`
## My solution
```cpp
class Solution {
public:
    vector<vector<int>> combinationSum2(vector<int>& candidates, int target) {
        vector<vector<int>> result;
        vector<int> subResult;
        sort(candidates.begin(), candidates.end());
        backtrack(candidates, result, subResult, 0, target);
        return result;
    }

    void backtrack(vector<int> nums, vector<vector<int>> &result, vector<int> &subResult, int pos, int target) {
        if (target < 0) return;
        if (target == 0) {
            result.push_back(subResult);
            return;
        }

        for (int i = pos; i < nums.size(); i++) {
            if (i != pos && nums[i] == nums[i - 1]) continue;
            subResult.push_back(nums[i]);
            backtrack(nums, result, subResult, i + 1, target - nums[i]);
            subResult.pop_back();
        }
    }
};
```
## Optimal solution
```cpp
Same as above
```
## Notes
#dsa
- [ ] Get this under 5 minutes