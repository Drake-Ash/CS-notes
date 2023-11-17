---
tags:
  - dsa
  - backtracking
To_review: true
Status: Complete | Pending review
Link: "[leetcode](https://leetcode.com/problems/n-queens-ii/description/)"
Time_in_minutes: 23
Difficulty: hard
---
# Problem
## Description
The **n-queens** puzzle is the problem of placing `n` queens on an `n x n` chessboard such that no two queens attack each other.

Given an integer `n`, return _the number of distinct solutions to the **n-queens puzzle**_.

**Example 1:**

![](https://assets.leetcode.com/uploads/2020/11/13/queens.jpg)

**Input:** n = 4
**Output:** 2
**Explanation:** There are two distinct solutions to the 4-queens puzzle as shown.

**Example 2:**

**Input:** n = 1
**Output:** 1

**Constraints:**

- `1 <= n <= 9`
## My solution
```cpp
class Solution {
public:
    vector<vector<int>> qPos;
    int count;
public:
    bool isSafe(int row, int col) {
        for (int i = 0; i < qPos.size(); i++) {
            if (row == qPos[i][0] || col == qPos[i][1]) {
                return false;
            }
            if (abs(row - qPos[i][0]) == abs(col - qPos[i][1])) {
                return false;
            }
        }
        return true;
    }

    void printArray() {
        for (int i = 0; i < qPos.size(); i++)
            cout << "[" << qPos[i][0] << "," << qPos[i][1] << "]";
        cout << endl;
    }

    void placeQueens(int row, int col, int n) {
        for (int col = 0; col < n; col++) {
            if (isSafe(row, col)) {
                qPos.push_back({row, col});
                if (row + 1 == n) {
                    printArray();
                    count++;
                } else {
                    placeQueens(row + 1, col, n);
                }
                qPos.pop_back();
            }
        }
    }

    int totalNQueens(int n) {
        count = 0;
        placeQueens(0, 0, n);
        return count;
    }
};
```
## Optimal solution
```cpp
same as above
```
## Notes
#dsa
1. Think of backtracking decision tree and draw it out
2. multiple ways to solve it
- [ ] Get this under 10 minutes