---
tags:
  - dsa
  - DP
To_review: true
Status: Review again
Link: "[leetcode](https://leetcode.com/problems/min-cost-climbing-stairs/description/)"
Time_in_minutes: 12
Difficulty: easy
---
# Problem
## Description
You are given an integer array `cost` where `cost[i]` is the cost of `ith` step on a staircase. Once you pay the cost, you can either climb one or two steps.

You can either start from the step with index `0`, or the step with index `1`.

Return _the minimum cost to reach the top of the floor_.

**Example 1:**

**Input:** cost = [10,15,20]
**Output:** 15
**Explanation:** You will start at index 1.
- Pay 15 and climb two steps to reach the top.
The total cost is 15.

**Example 2:**

**Input:** cost = [1,100,1,1,1,100,1,1,100,1]
**Output:** 6
**Explanation:** You will start at index 0.
- Pay 1 and climb two steps to reach index 2.
- Pay 1 and climb two steps to reach index 4.
- Pay 1 and climb two steps to reach index 6.
- Pay 1 and climb one step to reach index 7.
- Pay 1 and climb two steps to reach index 9.
- Pay 1 and climb one step to reach the top.
The total cost is 6.

**Constraints:**

- `2 <= cost.length <= 1000`
- `0 <= cost[i] <= 999`
## My solution
```cpp
class Solution {
public:
    int minCostClimbingStairs(vector<int>& cost) {
        vector<int> dp(cost.size() + 1);

        dp[0] = 0;
        dp[1] = 0;

        for (int i = 2; i <= cost.size(); i++) {
            dp[i] = min(dp[i-1] + cost[i-1], dp[i-2] + cost[i-2]);
        }

        return dp[cost.size()];
    }
};
```
## Optimal solution
```cpp
same as above
```
## Notes
#dsa
1. Think of DP solving format before writing code. Think this fast
- [ ] Get this under 5 minutes