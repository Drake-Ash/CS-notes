// Last updated: 29/04/2026, 23:13:48
class Solution {
public:
    vector<vector<int>> combinationSum(vector<int>& candidates, int target) {
        vector<vector<int>> result;
        vector<int> subResult;
        backtrack(candidates, target, 0, result, subResult);
        return result;
    }

    void backtrack(vector<int> &candidates, int target, int pos, vector<vector<int>> &result, vector<int> subResult) {
        if (target == 0) {
            result.push_back(subResult);
            return;
        }
        if (target < 0) return;
        for (int i = pos; i < candidates.size(); i++) {
            subResult.push_back(candidates[i]);
            backtrack(candidates, target - candidates[i], i, result, subResult);
            subResult.pop_back();
        }
    }
};