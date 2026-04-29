// Last updated: 29/04/2026, 23:13:01
class Solution {
public:
    vector<vector<int>> combine(int n, int k) {
        vector<vector<int>> result;
        vector<int> subResult;
        backtrack(n, k, result, subResult, 0);
        return result;
    }

    void backtrack(int n, int k, vector<vector<int>> &result, vector<int> subResult, int currNum) {
        if (k == 0) {
            result.push_back(subResult);
            return;
        }
        for (int i = currNum + 1; i <= n; i++) {
            subResult.push_back(i);
            backtrack(n, k - 1, result, subResult, i);
            subResult.pop_back();
        }
    }
};