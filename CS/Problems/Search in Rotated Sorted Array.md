---
tags:
  - dsa
  - "#binary-search"
  - "#important"
To_review: true
Status: Review again
Link: "[leetcode](https://leetcode.com/problems/search-in-rotated-sorted-array/description/)"
Time_in_minutes: 45
Difficulty: medium
---
# Problem
## Description
There is an integer array `nums` sorted in ascending order (with **distinct** values).

Prior to being passed to your function, `nums` is **possibly rotated** at an unknown pivot index `k` (`1 <= k < nums.length`) such that the resulting array is `[nums[k], nums[k+1], ..., nums[n-1], nums[0], nums[1], ..., nums[k-1]]` (**0-indexed**). For example, `[0,1,2,4,5,6,7]` might be rotated at pivot index `3` and become `[4,5,6,7,0,1,2]`.

Given the array `nums` **after** the possible rotation and an integer `target`, return _the index of_ `target` _if it is in_ `nums`_, or_ `-1` _if it is not in_ `nums`.

You must write an algorithm with `O(log n)` runtime complexity.

**Example 1:**

**Input:** nums = [4,5,6,7,0,1,2], target = 0
**Output:** 4

**Example 2:**

**Input:** nums = [4,5,6,7,0,1,2], target = 3
**Output:** -1

**Example 3:**

**Input:** nums = [1], target = 0
**Output:** -1

**Constraints:**

- `1 <= nums.length <= 5000`
- `-104 <= nums[i] <= 104`
- All values of `nums` are **unique**.
- `nums` is an ascending array that is possibly rotated.
- `-104 <= target <= 104`
## My solution
```cpp
class Solution {

public:

    int search(vector<int>& nums, int target) {

        int left = 0, right = nums.size() - 1;

        int mid = 0;

  

        while (left <= right) {

            mid = left + (right-left)/2;

            cout << left << " " << mid << " " << right << endl;

  

            if (nums[mid] == target) {

                return mid;

            }

            if (nums[left] <= nums[mid]) {

                // Left sorted portion

                if (nums[left] <= target && target <= nums[mid]) right = mid - 1;

                else left = mid + 1;

            } else {

                // Right sorted portion

                if (nums[mid] <= target && target <= nums[right]) left = mid + 1;

                else right = mid - 1;

            }

        }

  

        return -1;

    }

};
```
## Optimal solution
```cpp
same as above
```
## Notes
#dsa
1. Should have dissected the problem into multiple cases before solving for this
2. Its more to do with intuition of the problem than how I solve it
3. sometimes the simpler solutions can help solve this faster
4. Solutions intuition
	1. Find the pivot point and use a relative index based binary search to get the result. Or
	2. Find whether mid belongs to left sorted array and right sorted array, then decide how the search space needs to converge based on target
- [ ] Get this under 10 minutes