---
tags:
  - dsa
  - binary-search
  - priority-queue
To_review: true
Status: Review again
Link: "[leetcode](https://leetcode.com/problems/number-of-flowers-in-full-bloom/description/)"
Time_in_minutes: 71
Difficulty: hard
---
# Problem
## Description
You are given a **0-indexed** 2D integer array `flowers`, where `flowers[i] = [starti, endi]` means the `ith` flower will be in **full bloom** from `starti` to `endi` (**inclusive**). You are also given a **0-indexed** integer array `people` of size `n`, where `people[i]` is the time that the `ith` person will arrive to see the flowers.

Return _an integer array_ `answer` _of size_ `n`_, where_ `answer[i]` _is the **number** of flowers that are in full bloom when the_ `ith` _person arrives._

**Example 1:**

![](https://assets.leetcode.com/uploads/2022/03/02/ex1new.jpg)

**Input:** flowers = [[1,6],[3,7],[9,12],[4,13]], poeple = [2,3,7,11]
**Output:** [1,2,2,2]
**Explanation:** The figure above shows the times when the flowers are in full bloom and when the people arrive.
For each person, we return the number of flowers in full bloom during their arrival.

**Example 2:**

![](https://assets.leetcode.com/uploads/2022/03/02/ex2new.jpg)

**Input:** flowers = [[1,10],[3,3]], poeple = [3,3,2]
**Output:** [2,2,1]
**Explanation:** The figure above shows the times when the flowers are in full bloom and when the people arrive.
For each person, we return the number of flowers in full bloom during their arrival.

**Constraints:**

- `1 <= flowers.length <= 5 * 104`
- `flowers[i].length == 2`
- `1 <= starti <= endi <= 109`
- `1 <= people.length <= 5 * 104`
- `1 <= people[i] <= 109`
## My solution
```cpp
class Solution {
public:
    vector<int> fullBloomFlowers(vector<vector<int>>& flowers, vector<int>& people) {
        vector<int> result;
        map<int, int> flowersMap;

        for (int i = 0; i < flowers.size(); i++) {
            flowersMap[flowers[i][0]]++;
            flowersMap[flowers[i][1] + 1]--;
        }
        vector<int> positions;
        vector<int> prefixSum;
        int curr = 0;
        for (auto& flower: flowersMap) {
            positions.push_back(flower.first);
            curr += flower.second;
            prefixSum.push_back(curr);
        }

        for (int i = 0; i < people.size(); i++) {
            int position = upper_bound(positions.begin(), positions.end(), people[i]) - positions.begin() - 1;
            result.push_back(position != -1 ? prefixSum[position] : 0);
        }

        return result;
    }

    vector<int> fullBloomFlowers1(vector<vector<int>>& flowers, vector<int>& people) {
        unordered_map<long, long> flowerLinear;
        for (long i = 0; i < flowers.size(); i++) {
            vector<int> flower  = flowers[i];
            for (long j = flower[0]; j <= flower[1]; j++) {
                flowerLinear[j]++;
            }
        }

        vector<int> result;
        for (long i = 0; i < people.size(); i++) {
            result.push_back(flowerLinear[people[i]]);
        }

        return result;
    }
};
```
## Optimal solution
```cpp
// 1st solution mentioned in the above solution
```
## Notes
#dsa
1. Try thinking about multiple patterns, if it helps solve the problem or not
2. Think if you can optimise brute force solution
- [ ] Get this under 15 minutes