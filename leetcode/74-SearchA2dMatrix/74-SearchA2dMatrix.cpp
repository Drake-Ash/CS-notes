// Last updated: 29/04/2026, 23:13:07
class Solution {
public:
    bool searchMatrix(vector<vector<int>>& matrix, int target) {
        int l = 0;
        int h = matrix.size() * matrix[0].size() - 1;
        int m = 0;
        int i = 0;
        int j = 0;
        int n = matrix[0].size();
        while (l <= h) {
            m = l + (h-l)/2;
            i = m / n;
            j = m % n;
            if (matrix[i][j] == target)
                return true;
            else if (matrix[i][j] > target)
                h = m - 1;
            else
                l = m + 1;
        }
        return false;
    }
};