// Last updated: 29/04/2026, 23:13:51
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