---
tags:
  - dsa
  - arrays
To_review: true
Status: Complete | Pending review
Link: "[leetcode](https://leetcode.com/problems/majority-element-ii/description)"
Time_in_minutes: 10
Difficulty: medium
---
# Problem
## Description
Given an integer array of size `n`, find all elements that appear more than `⌊ n/3 ⌋` times.

**Example 1:**

**Input:** nums = [3,2,3]
**Output:** [3]

**Example 2:**

**Input:** nums = [1]
**Output:** [1]

**Example 3:**

**Input:** nums = [1,2]
**Output:** [1,2]

**Constraints:**

- `1 <= nums.length <= 5 * 104`
- `-109 <= nums[i] <= 109`

**Follow up:** Could you solve the problem in linear time and in `O(1)` space?
## My solution
```cpp
class Solution {
public:
    vector<int> majorityElement(vector<int>& nums) {
        int x = 0, y = 0, cx = 0, cy = 0;
        for (int i = 0; i < nums.size(); i++) {
            if (x == nums[i]) {
                cx++;
            } else if (y == nums[i]) {
                cy++;
            } else if (cx == 0) {
                x = nums[i];
                cx++;
            } else if (cy == 0) {
                y = nums[i];
                cy++;
            } else {
                cx--;
                cy--;
            }
            // cout << x << " " << cx << " " << y << " " << cy << endl;
        }

        cx = 0;
        cy = 0;

        for (int i = 0; i < nums.size(); i++) {
            if (x == nums[i]) cx++;
            else if (y == nums[i]) cy++;
        }
        vector<int> result;
        if (cx > nums.size()/3) result.push_back(x);
        if (cy > nums.size()/3) result.push_back(y);
        return result;
    }
};
```
## Optimal solution
```cpp
same as above
```
## Notes
#dsa
1. Intuition is to use Boyer-Moore's voting algo
- [ ] Get this under 5 minutes