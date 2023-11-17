---
tags:
  - dsa
  - backtracking
To_review: true
Status: Complete | Pending review
Link: "[leetcode](https://leetcode.com/problems/word-search/description/)"
Time_in_minutes: 25
Difficulty: medium
---
# Problem
## Description
Given an `m x n` grid of characters `board` and a string `word`, return `true` _if_ `word` _exists in the grid_.

The word can be constructed from letters of sequentially adjacent cells, where adjacent cells are horizontally or vertically neighboring. The same letter cell may not be used more than once.

**Example 1:**

![](https://assets.leetcode.com/uploads/2020/11/04/word2.jpg)

**Input:** board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word = "ABCCED"
**Output:** true

**Example 2:**

![](https://assets.leetcode.com/uploads/2020/11/04/word-1.jpg)

**Input:** board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word = "SEE"
**Output:** true

**Example 3:**

![](https://assets.leetcode.com/uploads/2020/10/15/word3.jpg)

**Input:** board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word = "ABCB"
**Output:** false

**Constraints:**

- `m == board.length`
- `n = board[i].length`
- `1 <= m, n <= 6`
- `1 <= word.length <= 15`
- `board` and `word` consists of only lowercase and uppercase English letters.

**Follow up:** Could you use search pruning to make your solution faster with a larger `board`?
## My solution
```cpp
class Solution {
public:
vector<vector<int>> directions;
public:
    Solution() {
        directions = {
            {1, 0},
            {0, 1},
            {-1, 0},
            {0, -1}
        };
    }

    bool exist(vector<vector<char>>& board, string word) {
        for (int i = 0; i < board.size(); i++) {
            for (int j = 0; j < board[i].size(); j++) {
                if (backtrack(board, word, i, j, 0)) return true;
            }
        }
        return false;
    }

    bool backtrack(vector<vector<char>>& board, string word, int i, int j, int pos) {
        if (pos >= word.size()) return false;
        if (word[pos] != board[i][j]) return false;
        if (pos == word.size() - 1) return true;

        char temp = board[i][j];
        board[i][j] = '.';
        int newI = i, newJ = j;

        for (int direction = 0; direction < directions.size(); direction++) {
            newI = i + directions[direction][0];
            newJ = j + directions[direction][1];

            if (newI < 0 || newI >= board.size()) continue;
            if (newJ < 0 || newJ >= board[i].size()) continue;
            if (board[newI][newJ] == '.') continue;

            if (backtrack(board, word, newI, newJ, pos + 1)) return true;
        }

        board[i][j] = temp;

        return false;
    }
};
```
## Optimal solution
```cpp
same as above
```
## Notes
#dsa
1. Iterate faster Ashwin

- [ ] Get this under 15 minutes