// Last updated: 29/04/2026, 23:13:14
class Solution {
public:
    void setZeroes(vector<vector<int>>& matrix) {
        vector<int> colZero(matrix[0].size());
        vector<int> rowZero(matrix.size());
        
        for (int i = 0; i < matrix.size(); i++) {
            for (int j = 0; j < matrix[0].size(); j++) {
                if (matrix[i][j] == 0) {
                    colZero[j] = 1;
                    rowZero[i] = 1;
                }
            }
        }
        for (int i = 0; i < colZero.size(); i++) {
            if (colZero[i] == 1)
                for (int j = 0; j < matrix.size(); j++)
                    matrix[j][i] = 0;
        }
        for (int i = 0; i < rowZero.size(); i++) {
            if (rowZero[i] == 1)
                for (int j = 0; j < matrix[0].size(); j++)
                    matrix[i][j] = 0;
        }
    }
};