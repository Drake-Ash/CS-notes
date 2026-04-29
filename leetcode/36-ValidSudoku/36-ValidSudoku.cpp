// Last updated: 29/04/2026, 23:13:52
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