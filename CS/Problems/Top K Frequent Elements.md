---
tags:
  - dsa
  - arrays
To_review: true
Status: Complete | Pending review
Link: "[leetcode](https://leetcode.com/problems/top-k-frequent-elements/)"
Difficulty: medium
Time_in_minutes: 32
---
# Problem
## Description
Given an integer array `nums` and an integer `k`, return _the_ `k` _most frequent elements_. You may return the answer in **any order**.

**Example 1:**

**Input:** nums = [1,1,1,2,2,3], k = 2
**Output:** [1,2]

**Example 2:**

**Input:** nums = [1], k = 1
**Output:** [1]
## My solution
```cpp
class Solution {

public:

    vector<int> topKFrequent(vector<int>& nums, int k) {

        vector<int> result;

        unordered_map<int, int> counter;

  

        for (int i = 0; i < nums.size(); i++) {

            counter[nums[i]]++;

        }

  

        map<int, vector<int>> occurenceCounter;

        for (auto x: counter) {

            occurenceCounter[x.second].push_back(x.first);

        }

  

        k = counter.size() - k;

        for (auto x: occurenceCounter) {

            for (int i = 0; i < x.second.size() && k >= 0; i++) {

                if (k == 0) {

                    result.push_back(x.second[i]);

                } else {

                    k--;

                }

            }

        }

  

        return result;

    }

};
```
## Optimal solution
```cpp
Same as above
```
## Notes
1. Don't assume things and start with the solution
2. Understand the problem first before starting the solution
- [ ] Get this under 10 minutes