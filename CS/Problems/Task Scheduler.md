---
tags:
  - dsa
  - priority-queue
To_review: true
Status: Complete | Pending review
Link: "[leetcode](https://leetcode.com/problems/task-scheduler/description/)"
Time_in_minutes: 24
Difficulty: medium
---
# Problem
## Description
Given a characters array `tasks`, representing the tasks a CPU needs to do, where each letter represents a different task. Tasks could be done in any order. Each task is done in one unit of time. For each unit of time, the CPU could complete either one task or just be idle.

However, there is a non-negative integer `n` that represents the cooldown period between two **same tasks** (the same letter in the array), that is that there must be at least `n` units of time between any two same tasks.

Return _the least number of units of times that the CPU will take to finish all the given tasks_.

**Example 1:**

**Input:** tasks = ["A","A","A","B","B","B"], n = 2
**Output:** 8
**Explanation:** 
A -> B -> idle -> A -> B -> idle -> A -> B
There is at least 2 units of time between any two same tasks.

**Example 2:**

**Input:** tasks = ["A","A","A","B","B","B"], n = 0
**Output:** 6
**Explanation:** On this case any permutation of size 6 would work since n = 0.
["A","A","A","B","B","B"]
["A","B","A","B","A","B"]
["B","B","B","A","A","A"]
...
And so on.

**Example 3:**

**Input:** tasks = ["A","A","A","A","A","A","B","C","D","E","F","G"], n = 2
**Output:** 16
**Explanation:** 
One possible solution is
A -> B -> C -> A -> D -> E -> A -> F -> G -> A -> idle -> idle -> A -> idle -> idle -> A

**Constraints:**

- `1 <= task.length <= 104`
- `tasks[i]` is upper-case English letter.
- The integer `n` is in the range `[0, 100]`.
## My solution
```cpp
class Solution {
public:
    int leastInterval(vector<char>& tasks, int n) {
        vector<int> charCounter(26);

        for (int i = 0; i < tasks.size(); i++) {
            charCounter[tasks[i] - 'A']++;
        }

        priority_queue<int> maxHeap;
        for (int i = 0; i < 26; i++) {
            if (charCounter[i] != 0) maxHeap.push(charCounter[i]);
        }

        queue<vector<int>> waitingQ;
        int time = 0;
        while (!waitingQ.empty() || !maxHeap.empty()) {
            ++time;

            if (!maxHeap.empty()) {
                if (maxHeap.top() - 1 != 0)
                    waitingQ.push({time + n, maxHeap.top() - 1});
                maxHeap.pop();
            }

            if (!waitingQ.empty() && waitingQ.front()[0] == time) {
                maxHeap.push(waitingQ.front()[1]);
                waitingQ.pop();
            }
        }

        return time;
    }
};
```
## Optimal solution
```cpp
same as above
```
## Notes
#dsa
1. Think of looping conditions properly
- [ ] Get this under 10 minutes