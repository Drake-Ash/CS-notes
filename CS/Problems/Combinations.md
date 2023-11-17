---
tags:
  - dsa
  - backtracking
To_review: true
Status: Complete | Pending review
Link: "[leetcode](https://leetcode.com/problems/combinations/description/)"
Time_in_minutes: 11
Difficulty: medium
---
# Problem
## Description
Given two integers `n` and `k`, return _all possible combinations of_ `k` _numbers chosen from the range_ `[1, n]`.

You may return the answer in **any order**.

**Example 1:**

**Input:** n = 4, k = 2
**Output:** [[1,2],[1,3],[1,4],[2,3],[2,4],[3,4]]
**Explanation:** There are 4 choose 2 = 6 total combinations.
Note that combinations are unordered, i.e., [1,2] and [2,1] are considered to be the same combination.

**Example 2:**

**Input:** n = 1, k = 1
**Output:** [[1]]
**Explanation:** There is 1 choose 1 = 1 total combination.

**Constraints:**

- `1 <= n <= 20`
- `1 <= k <= n`
## My solution
```cpp
class Solution {
public:
    vector<vector<int>> combine(int n, int k) {
        vector<vector<int>> result;
        vector<int> subResult;
        backtrack(n, k, result, subResult, 0);
        return result;
    }

    void backtrack(int n, int k, vector<vector<int>> &result, vector<int> subResult, int currNum) {
        if (k == 0) {
            result.push_back(subResult);
            return;
        }
        for (int i = currNum + 1; i <= n; i++) {
            subResult.push_back(i);
            backtrack(n, k - 1, result, subResult, i);
            subResult.pop_back();
        }
    }
};
```
## Optimal solution
```cpp
//same as above
```
## Notes
#dsa
1. Think about optimizing this further.
	1. Possible optimization is to cut off the branch when we know that there are not enough items on the list to form a k sized array 
	2. 
- [ ] Get this under 5 minutes