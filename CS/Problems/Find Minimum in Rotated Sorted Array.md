---
tags:
  - dsa
  - binary-search
  - important
To_review: true
Status: Complete | Pending review
Link: "[leetcode](https://leetcode.com/problems/find-minimum-in-rotated-sorted-array/description/)"
Time_in_minutes: 25
Difficulty: medium
---
# Problem
## Description
Suppose an array of length `n` sorted in ascending order is **rotated** between `1` and `n` times. For example, the array `nums = [0,1,2,4,5,6,7]` might become:

- `[4,5,6,7,0,1,2]` if it was rotated `4` times.
- `[0,1,2,4,5,6,7]` if it was rotated `7` times.

Notice that **rotating** an array `[a[0], a[1], a[2], ..., a[n-1]]` 1 time results in the array `[a[n-1], a[0], a[1], a[2], ..., a[n-2]]`.

Given the sorted rotated array `nums` of **unique** elements, return _the minimum element of this array_.

You must write an algorithm that runs in `O(log n) time.`

**Example 1:**

**Input:** nums = [3,4,5,1,2]
**Output:** 1
**Explanation:** The original array was [1,2,3,4,5] rotated 3 times.

**Example 2:**

**Input:** nums = [4,5,6,7,0,1,2]
**Output:** 0
**Explanation:** The original array was [0,1,2,4,5,6,7] and it was rotated 4 times.

**Example 3:**

**Input:** nums = [11,13,15,17]
**Output:** 11
**Explanation:** The original array was [11,13,15,17] and it was rotated 4 times. 

**Constraints:**

- `n == nums.length`
- `1 <= n <= 5000`
- `-5000 <= nums[i] <= 5000`
- All the integers of `nums` are **unique**.
- `nums` is sorted and rotated between `1` and `n` times.
## My solution
```cpp
class Solution {

public:

    int findMin(vector<int>& nums) {

        int n = nums.size();

        if (n == 1) return nums[0];

        if (n == 2) return min(nums[0], nums[1]);

        int l = 0, r = n - 1;

        int m = 0;

        int prev = 0, next = 0;

        while (l <= r) {

            m = l + (r-l)/2;

            prev = (n + m - 1) % n;

            next = (n + m + 1) % n;

            if (nums[prev] > nums[m] && nums[next] > nums[m]) {

                return nums[m];

            } else if (nums[m] > nums[r]) {

                l = m + 1;

            } else {

                r = m - 1;

            }

        }

        return -1;

    }

};
```
## Optimal solution
```cpp
class Solution {

public:

    int findMin(vector<int>& nums) {

        int left = 0, right = nums.size() - 1, mid = 0;

        while (left < right) {

            mid = left + (right - left) / 2;

            if (nums[mid] > nums[right]) left = mid + 1;

            else right = mid;

        }

        return nums[left];

    }

};
```
## Notes
#dsa
1. don't write the solution without thinking about all the edge cases
2. solve case wise for solution before writing
- [ ] Get this under 10 minutes