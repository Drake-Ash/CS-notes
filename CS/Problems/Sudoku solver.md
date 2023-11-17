---
tags:
  - dsa
To_review: true
Status: Review again
Link: "[leetcode](https://leetcode.com/problems/sudoku-solver/description/)"
Time_in_minutes: 65
Difficulty: hard
---
# Problem
## Description
Write a program to solve a Sudoku puzzle by filling the empty cells.

A sudoku solution must satisfy **all of the following rules**:

1. Each of the digits `1-9` must occur exactly once in each row.
2. Each of the digits `1-9` must occur exactly once in each column.
3. Each of the digits `1-9` must occur exactly once in each of the 9 `3x3` sub-boxes of the grid.

The `'.'` character indicates empty cells.

**Example 1:**

![](https://upload.wikimedia.org/wikipedia/commons/thumb/f/ff/Sudoku-by-L2G-20050714.svg/250px-Sudoku-by-L2G-20050714.svg.png)

**Input:** board = [["5","3",".",".","7",".",".",".","."],["6",".",".","1","9","5",".",".","."],[".","9","8",".",".",".",".","6","."],["8",".",".",".","6",".",".",".","3"],["4",".",".","8",".","3",".",".","1"],["7",".",".",".","2",".",".",".","6"],[".","6",".",".",".",".","2","8","."],[".",".",".","4","1","9",".",".","5"],[".",".",".",".","8",".",".","7","9"]]
**Output:** [["5","3","4","6","7","8","9","1","2"],["6","7","2","1","9","5","3","4","8"],["1","9","8","3","4","2","5","6","7"],["8","5","9","7","6","1","4","2","3"],["4","2","6","8","5","3","7","9","1"],["7","1","3","9","2","4","8","5","6"],["9","6","1","5","3","7","2","8","4"],["2","8","7","4","1","9","6","3","5"],["3","4","5","2","8","6","1","7","9"]]
**Explanation:** The input board is shown above and the only valid solution is shown below:

![](https://upload.wikimedia.org/wikipedia/commons/thumb/3/31/Sudoku-by-L2G-20050714_solution.svg/250px-Sudoku-by-L2G-20050714_solution.svg.png)

**Constraints:**

- `board.length == 9`
- `board[i].length == 9`
- `board[i][j]` is a digit or `'.'`.
- It is **guaranteed** that the input board has only one solution.
## My solution
```cpp
class Solution {
public:
    vector<vector<unordered_set<char>>> blockChecker;
    vector<unordered_set<char>> rowChecker;
    vector<unordered_set<char>> colChecker;

public:
    void solveSudoku(vector<vector<char>>& board) {
        rowChecker.resize(9);
        colChecker.resize(9);
        blockChecker.resize(3);
        for (int i = 0; i < 3; i++) {
            blockChecker[i].resize(3);
        }

        for (int i = 0; i < 9; i++) {
            for (int j = 0; j < 9; j++) {
                if (board[i][j] != '.') {
                    blockChecker[i/3][j/3].insert(board[i][j]);
                    rowChecker[i].insert(board[i][j]);
                    colChecker[j].insert(board[i][j]);
                }
            }
        }

        backtrack(board);
    }

    void placeNumber(vector<vector<char>> &board, int i, int j, char num) {
        blockChecker[i/3][j/3].insert(num);
        rowChecker[i].insert(num);
        colChecker[j].insert(num);
        board[i][j] = num;
    }

    void removeNumber(vector<vector<char>> &board, int i, int j, char num) {
        blockChecker[i/3][j/3].erase(num);
        rowChecker[i].erase(num);
        colChecker[j].erase(num);
        board[i][j] = '.';
    }

    bool isSafe(vector<vector<char>> &board, int i, int j, char num) {
        return rowChecker[i].count(num) == 0 && colChecker[j].count(num) == 0 && blockChecker[i/3][j/3].count(num) == 0;
    }

    bool backtrack(vector<vector<char>>& board) {
        for (int i = 0; i < 9; i++) {
            for (int j = 0; j < 9; j++) {
                if (board[i][j] == '.') {
                    char n = '1';
                    for (int num = 0; num < 9; num++) {
                        n = '1' + num;
                        if (isSafe(board, i, j, n)) {
                            placeNumber(board, i, j, n);
                            if (backtrack(board)) return true;
                            removeNumber(board, i, j, n);
                        }
                    }
                    return false;
                }
            }
        }
        return true;
    }
};
```
## Optimal solution
```cpp
same as above
```
## Notes
#dsa
1. Memory and runtime operations to consider
	1. using sets can be expensive on write, since removing items and adding items is expensive comparing to flipping a flag
2. Faster time when using arrays to check if number can be placed safe

- [ ] Get this under 20 minutes