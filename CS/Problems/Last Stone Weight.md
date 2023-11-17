---
tags:
  - dsa
  - priority-queue
To_review: true
Status: Complete | Pending review
Link: "[leetcode](https://leetcode.com/problems/last-stone-weight/description/)"
Time_in_minutes: 7
Difficulty: easy
---
# Problem
## Description
You are given an array of integers `stones` where `stones[i]` is the weight of the `ith` stone.

We are playing a game with the stones. On each turn, we choose the **heaviest two stones** and smash them together. Suppose the heaviest two stones have weights `x` and `y` with `x <= y`. The result of this smash is:

- If `x == y`, both stones are destroyed, and
- If `x != y`, the stone of weight `x` is destroyed, and the stone of weight `y` has new weight `y - x`.

At the end of the game, there is **at most one** stone left.

Return _the weight of the last remaining stone_. If there are no stones left, return `0`.

**Example 1:**

**Input:** stones = [2,7,4,1,8,1]
**Output:** 1
**Explanation:** 
We combine 7 and 8 to get 1 so the array converts to [2,4,1,1,1] then,
we combine 2 and 4 to get 2 so the array converts to [2,1,1,1] then,
we combine 2 and 1 to get 1 so the array converts to [1,1,1] then,
we combine 1 and 1 to get 0 so the array converts to [1] then that's the value of the last stone.

**Example 2:**

**Input:** stones = [1]
**Output:** 1

**Constraints:**

- `1 <= stones.length <= 30`
- `1 <= stones[i] <= 1000`
## My solution
```cpp
class Solution {
public:
    int lastStoneWeight(vector<int>& stones) {
        priority_queue<int> maxHeap(stones.begin(), stones.end());
        int result = 0;
        int x, y;

        while(true) {
            if (maxHeap.size() == 1) {
                result = maxHeap.top();
                break;
            }
            if (maxHeap.size() != 0) {
                x = maxHeap.top();
                maxHeap.pop();
            } else break;

            if (maxHeap.size() != 0) {
                y = maxHeap.top();
                maxHeap.pop();
            } else break;

            // cout <<  x << " " << y << endl;

            if (x == y) continue;
            maxHeap.push(x - y);
        }

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
1. Check what heap you need before coding. is it max heap or min heap
2. C++ by default gives max heap
- [ ] Get this under 5 minutes