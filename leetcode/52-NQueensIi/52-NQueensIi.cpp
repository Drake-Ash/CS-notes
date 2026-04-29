// Last updated: 29/04/2026, 23:13:26
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