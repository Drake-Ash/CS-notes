---
tags:
  - dsa
  - sorting
  - arrays
To_review: true
Status: Complete | Pending review
Link: "[leetcode](https://leetcode.com/problems/sort-an-array/)"
Time_in_minutes: 10
Difficulty: medium
---
# Problem
## Description
Given an array of integers `nums`, sort the array in ascending order and return it.

You must solve the problem **without using any built-in** functions in `O(nlog(n))` time complexity and with the smallest space complexity possible.

**Example 1:**

**Input:** nums = [5,2,3,1]
**Output:** [1,2,3,5]
**Explanation:** After sorting the array, the positions of some numbers are not changed (for example, 2 and 3), while the positions of other numbers are changed (for example, 1 and 5).

**Example 2:**

**Input:** nums = [5,1,1,2,0,0]
**Output:** [0,0,1,1,2,5]
**Explanation:** Note that the values of nums are not necessairly unique.

**Constraints:**

- `1 <= nums.length <= 5 * 104`
- `-5 * 104 <= nums[i] <= 5 * 104`
## My solution
```cpp
class Solution {
public:
    void merge(vector<int>& nums, int l, int m, int r) {
        int i = l, j = m + 1;
        vector<int> result;

        while(i <= m && j <= r) {
            if (nums[i] < nums[j])
                result.push_back(nums[i++]);
            else
                result.push_back(nums[j++]);
        }

        while (i <= m) result.push_back(nums[i++]);
        while (j <= r) result.push_back(nums[j++]);

        for(i = l; i <= r; i++) {
            nums[i] = result[i-l];
        }
    }

    void mergeSort(vector<int>& nums, int l, int r) {
        if (l >= r) return;

        int m = l + (r - l) / 2;

        mergeSort(nums, l, m);
        mergeSort(nums, m + 1, r);

        merge(nums, l, m, r);
    }

    vector<int> sortArray(vector<int>& nums) {
        mergeSort(nums, 0, nums.size() - 1);
        return nums;
    }
};
```
## Optimal solution
```cpp
same as above
```
## Notes
#dsa
1. USE A NOTEPAD TO THINK ABOUT HOW TO SOLVE THIS BEFORE WRITING CODE

- [ ] Get this under 5 minutes