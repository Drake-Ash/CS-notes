---
tags:
  - dsa
  - arrays
To_review: true
Status: Complete | Pending review
Link: "[leetcode](https://leetcode.com/problems/valid-sudoku/)"
Difficulty: medium
Time_in_minutes: 22
---
# Problem
## Description
Determine if a `9 x 9` Sudoku board is valid. Only the filled cells need to be validated **according to the following rules**:

1. Each row must contain the digits `1-9` without repetition.
2. Each column must contain the digits `1-9` without repetition.
3. Each of the nine `3 x 3` sub-boxes of the grid must contain the digits `1-9` without repetition.

**Note:**

- A Sudoku board (partially filled) could be valid but is not necessarily solvable.
- Only the filled cells need to be validated according to the mentioned rules.

**Example 1:**

![](https://upload.wikimedia.org/wikipedia/commons/thumb/f/ff/Sudoku-by-L2G-20050714.svg/250px-Sudoku-by-L2G-20050714.svg.png)

**Input:** board = 
[["5","3",".",".","7",".",".",".","."]
,["6",".",".","1","9","5",".",".","."]
,[".","9","8",".",".",".",".","6","."]
,["8",".",".",".","6",".",".",".","3"]
,["4",".",".","8",".","3",".",".","1"]
,["7",".",".",".","2",".",".",".","6"]
,[".","6",".",".",".",".","2","8","."]
,[".",".",".","4","1","9",".",".","5"]
,[".",".",".",".","8",".",".","7","9"]]
**Output:** true

**Example 2:**

**Input:** board = 
[["8","3",".",".","7",".",".",".","."]
,["6",".",".","1","9","5",".",".","."]
,[".","9","8",".",".",".",".","6","."]
,["8",".",".",".","6",".",".",".","3"]
,["4",".",".","8",".","3",".",".","1"]
,["7",".",".",".","2",".",".",".","6"]
,[".","6",".",".",".",".","2","8","."]
,[".",".",".","4","1","9",".",".","5"]
,[".",".",".",".","8",".",".","7","9"]]
**Output:** false
**Explanation:** Same as Example 1, except with the **5** in the top left corner being modified to **8**. Since there are two 8's in the top left 3x3 sub-box, it is invalid.

**Constraints:**

- `board.length == 9`
- `board[i].length == 9`
- `board[i][j]` is a digit `1-9` or `'.'`.
## My solution
```cpp
class Solution {

public:

    bool isValidSudoku(vector<vector<char>>& board) {

        for (int i = 0; i < 9; i++) {

            unordered_set<char> rowValues;

            for (int j = 0; j < 9; j++) {

                if (board[i][j] == '.') continue;

                if (rowValues.find(board[i][j]) != rowValues.end()) {

                    cout << "row" << i << j << endl;

                    return false;

                }

                rowValues.insert(board[i][j]);

            }

        }

  

        for (int i = 0; i < 9; i++) {

            unordered_set<char> colValues;

            for (int j = 0; j < 9; j++) {

                if (board[j][i] == '.') continue;

                if (colValues.find(board[j][i]) != colValues.end()) {

                    cout << "col" << j << i << endl;

                    return false;

                }

                colValues.insert(board[j][i]);

            }

        }

  

        for (int i = 0; i < 9; i+=3) {

            for (int j = 0; j < 9; j+=3) {

                unordered_set<char> cellValues;

                for (int k = i; k < i+3; k++) {

                    for (int l = j; l < j+3; l++) {

                        if (board[k][l] == '.') continue;

                        if (cellValues.find(board[k][l]) != cellValues.end()) {

                            cout << "cell" << k << l << endl;

                            return false;

                        }

                        cellValues.insert(board[k][l]);

                    }

                }

            }

        }

        return true;

    }

};
```
## Optimal solution
```cpp
// Same as above
```
## Notes
1. Do not panic when you see such problems
2. Understand the question correctly and then solve it
- [ ] Get this under 10 minutes
