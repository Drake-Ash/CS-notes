---
tags:
  - dsa
  - arrays
To_review: true
Status: Complete
Link: "[leetcode](https://leetcode.com/problems/contains-duplicate/description/)"
Difficulty: easy
Time_in_minutes: 7
---
# Problem
## Description
Given an integer array `nums`, return `true` if any value appears **at least twice** in the array, and return `false` if every element is distinct.

**Example 1:**

**Input:** nums = [1,2,3,1]
**Output:** true

**Example 2:**

**Input:** nums = [1,2,3,4]
**Output:** false

**Example 3:**

**Input:** nums = [1,1,1,3,3,4,3,2,4,2]
**Output:** true

**Constraints:**

- `1 <= nums.length <= 105`
- `-109 <= nums[i] <= 109`

## My solution
```cpp
class Solution {

public:

    bool containsDuplicate(vector<int>& nums) {

        unordered_set<int> duplicateChecker;

  

        for (int i = 0 ; i< nums.size(); i++) {

            if (duplicateChecker.find(nums[i]) != duplicateChecker.end()) {

                return true;

            }

            duplicateChecker.insert(nums[i]);

        }

        return false;

    }

};
```
## Optimal solution
```cpp
class Solution {

public:

    bool containsDuplicate(vector<int>& nums) {

        return nums.size() != unordered_set<int>(nums.begin(), nums.end()).size();

    }

};
```
## Notes
- [ ] Get this under 2-3 minutes