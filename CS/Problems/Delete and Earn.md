---
tags:
  - dsa
  - DP
To_review: true
Status: Complete | Pending review
Link: "[leetcode](https://leetcode.com/problems/delete-and-earn/description/)"
Time_in_minutes: 30
Difficulty: medium
---
# Problem
## Description
You are given an integer array `nums`. You want to maximize the number of points you get by performing the following operation any number of times:

- Pick any `nums[i]` and delete it to earn `nums[i]` points. Afterwards, you must delete **every** element equal to `nums[i] - 1` and **every** element equal to `nums[i] + 1`.

Return _the **maximum number of points** you can earn by applying the above operation some number of times_.

**Example 1:**

**Input:** nums = [3,4,2]
**Output:** 6
**Explanation:** You can perform the following operations:
- Delete 4 to earn 4 points. Consequently, 3 is also deleted. nums = [2].
- Delete 2 to earn 2 points. nums = [].
You earn a total of 6 points.

**Example 2:**

**Input:** nums = [2,2,3,3,3,4]
**Output:** 9
**Explanation:** You can perform the following operations:
- Delete a 3 to earn 3 points. All 2's and 4's are also deleted. nums = [3,3].
- Delete a 3 again to earn 3 points. nums = [3].
- Delete a 3 once more to earn 3 points. nums = [].
You earn a total of 9 points.

**Constraints:**

- `1 <= nums.length <= 2 * 104`
- `1 <= nums[i] <= 104`
## My solution
```cpp
class Solution {
public:
    int deleteAndEarn(vector<int>& nums) {
        unordered_map<int, int> numsFreq;
        int maxNum = INT_MIN;
        for (int i = 0; i < nums.size(); i++) {
            numsFreq[nums[i]]++;
            maxNum = max(maxNum, nums[i]);
        }

        vector<int> dp(maxNum + 1, 0);
        dp[0] = 0;
        dp[1] = numsFreq.count(1) != 0 ? numsFreq[1] : 0;

        for (int i = 2; i <= maxNum; i++) {
            if (numsFreq.count(i) != 0) {
                dp[i] = max(dp[i-2] + i * numsFreq[i], dp[i-1]);
            } else {
                dp[i] = max(dp[i-2], dp[i-1]);
            }
        }

        return dp[maxNum];
    }
};
```
## Optimal solution
```cpp
same as above
```
## Notes
#dsa
**Algorithm**

1. Declare a hash table `points` that will map elements to the amount of points that we can gain from taking each element.
    
2. Loop through `nums` once to populate `points` and find the largest element in `nums`, `maxNumber`.
    
3. Initialize an array `maxPoints` of size `maxNumber + 1`, where `maxPoints[num]` will store the maximum amount of points we can gain if we only considered numbers from `0` to `num` (inclusive). Set all the values to `0` initially, except for `maxPoints[1]` - it should be set to `points[1]` (our base case).
    
4. Iterate from `2` to `maxNumber`. At each iteration, apply the recurrence relation `maxPoints[num] = max(maxPoints[num - 1], maxPoints[num - 2] + points[num])` to populate `maxPoints`.
    
5. At the end, return `maxPoints[maxNumber]`.

- [ ] Get this under 10 minutes