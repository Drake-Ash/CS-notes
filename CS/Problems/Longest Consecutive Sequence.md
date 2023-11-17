---
tags:
  - dsa
  - arrays
  - important
To_review: true
Status: Complete | Pending review
Link: "[leetcode](https://leetcode.com/problems/longest-consecutive-sequence/description/)"
Difficulty: medium
Time_in_minutes: 10
---
# Problem
## Description
Given an unsorted array of integers `nums`, return _the length of the longest consecutive elements sequence._

You must write an algorithm that runs in `O(n)` time.

**Example 1:**

**Input:** nums = [100,4,200,1,3,2]
**Output:** 4
**Explanation:** The longest consecutive elements sequence is `[1, 2, 3, 4]`. Therefore its length is 4.

**Example 2:**

**Input:** nums = [0,3,7,2,5,8,4,6,0,1]
**Output:** 9

**Constraints:**

- `0 <= nums.length <= 105`
- `-109 <= nums[i] <= 109`
## My solution
```cpp
class Solution {

public:

    int longestConsecutive(vector<int>& nums) {

        unordered_set<int> uniqueNums;

        for (int i = 0; i< nums.size(); i++) {

            uniqueNums.insert(nums[i]);

        }

  

        int maxSeq = 0;

        int currentSeq = 0;

        for (int i = 0; i< nums.size(); i++) {

            int j = 0;

            if (uniqueNums.find(nums[i] - 1) == uniqueNums.end()) {

                while (uniqueNums.find(nums[i] + j) != uniqueNums.end()) {

                    j++;

                    currentSeq++;

                }

                maxSeq = max(maxSeq, currentSeq);

                currentSeq = 0;

            }

        }

  

        return maxSeq;

    }

};
```
## Optimal solution
```cpp
same as above
```
## Notes
1. There were multiple solutions for this problem
	1. Brute force
	2. Optimised brute force with sorting
2. Solve for this required intuition that for us to find longest subsequence, we need to find the starting value and keep checking if the next value exists in the list.
	1. * Starting value case helps remove many coinciding cases *
		1. To identify starting value, check if the previous value exists or not, if it doesn't exist then the current value is a starting value for subsequence
- [ ] Get this under 5 minutes