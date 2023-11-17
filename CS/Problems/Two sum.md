---
tags:
  - dsa
  - arrays
To_review: true
Status: Complete
Link: "[leetcode](https://leetcode.com/problems/two-sum/)"
Difficulty: easy
Time_in_minutes: 25
---
# Problem
## Description
Given an array of integers `nums` and an integer `target`, return _indices of the two numbers such that they add up to `target`_.

You may assume that each input would have **_exactly_ one solution**, and you may not use the _same_ element twice.

You can return the answer in any order.

**Example 1:**

**Input:** nums = [2,7,11,15], target = 9
**Output:** [0,1]
**Explanation:** Because nums[0] + nums[1] == 9, we return [0, 1].

**Example 2:**

**Input:** nums = [3,2,4], target = 6
**Output:** [1,2]

**Example 3:**

**Input:** nums = [3,3], target = 6
**Output:** [0,1]

**Constraints:**
- `2 <= nums.length <= 104`
- `-109 <= nums[i] <= 109`
- `-109 <= target <= 109`
- **Only one valid answer exists.**

## My solution
```cpp
class Solution {

public:

    vector<int> twoSum(vector<int>& nums, int target) {

        vector<int> result;

        unordered_map<int, vector<int>> idVsNums;

        for(int i = 0; i < nums.size(); i++) {

            idVsNums[nums[i]].push_back(i);

        }

  

        for(auto x: idVsNums) {

            int otherPair = target - x.first;

            if (idVsNums.find(otherPair) == idVsNums.end()) {

                continue;

            }

  

            if (otherPair == x.first) {

                if (x.second.size() >= 2) {

                    result.push_back(x.second[0]);

                    result.push_back(x.second[1]);

                    return result;

                }

                continue;

            }

  

            result.push_back(x.second[0]);

            result.push_back(idVsNums[otherPair][0]);

            return result;

        }

        return result;

    }

};
```
## Optimal solution
```cpp
class Solution {
public:
    vector<int> twoSum(vector<int>& nums, int target) {
        unordered_map<int, int> numMap;
        int n = nums.size();

        for (int i = 0; i < n; i++) {
            int complement = target - nums[i];
            if (numMap.count(complement)) {
                return {numMap[complement], i};
            }
            numMap[nums[i]] = i;
        }

        return {}; // No solution found
    }
};
```
## Notes
1. Think through solutions faster, don't be stuck/distracted. Put down things on paper or somewhere for faster processing
- [ ] Get this under 5 minutes