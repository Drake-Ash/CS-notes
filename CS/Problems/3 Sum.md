---
tags:
  - dsa
  - two-pointers
To_review: true
Status: Complete
Link: "[leetcode](https://leetcode.com/problems/3sum/)"
Time_in_minutes: 90
Difficulty: medium
---
# Problem
## Description
Given an integer array nums, return all the triplets `[nums[i], nums[j], nums[k]]` such that `i != j`, `i != k`, and `j != k`, and `nums[i] + nums[j] + nums[k] == 0`.

Notice that the solution set must not contain duplicate triplets.

**Example 1:**

**Input:** nums = [-1,0,1,2,-1,-4]
**Output:** [[-1,-1,2],[-1,0,1]]
**Explanation:** 
nums[0] + nums[1] + nums[2] = (-1) + 0 + 1 = 0.
nums[1] + nums[2] + nums[4] = 0 + 1 + (-1) = 0.
nums[0] + nums[3] + nums[4] = (-1) + 2 + (-1) = 0.
The distinct triplets are [-1,0,1] and [-1,-1,2].
Notice that the order of the output and the order of the triplets does not matter.

**Example 2:**

**Input:** nums = [0,1,1]
**Output:** []
**Explanation:** The only possible triplet does not sum up to 0.

**Example 3:**

**Input:** nums = [0,0,0]
**Output:** [[0,0,0]]
**Explanation:** The only possible triplet sums up to 0.

**Constraints:**

- `3 <= nums.length <= 3000`
- `-105 <= nums[i] <= 105`
## My solution
```cpp
class Solution {

public:

    vector<vector<int>> threeSum(vector<int>& nums) {

        vector<vector<int>> result;

        sort(nums.begin(), nums.end());

        int n = nums.size();

  

        for (int i = 0; i < n; i++) {

            if(i > 0 && nums[i] == nums[i-1]) continue;

            int j = i + 1;

            int k = n - 1;

  

            while (j < k) {

                int threeSum = nums[i] + nums[j] + nums[k];

                if (threeSum > 0) k--;

                else if (threeSum < 0) j++;

                else {

                    result.push_back({nums[i], nums[j], nums[k]});

                    j++;

                    k--;

                    while (j < k && nums[j] == nums[j-1]) j++;

                    while (j < k && nums[k] == nums[k+1]) k--;

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
1. Solutions I can think of
	1. Brute force - 3 loops - O(n^3)
	2. Store sums of 2 items in a map, and convert this into a 2 sum problem
2. Don't get frustrated because of this, problem was tricky because it wanted the unique values whose sum is zero.
3. Optimal solution is similar to 2 sum with sorted array as input
	1. Solution is specific to the problem and not generic here