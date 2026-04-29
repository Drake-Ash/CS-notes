// Last updated: 29/04/2026, 23:13:45
class Solution {
public:
    vector<vector<int>> combinationSum2(vector<int>& candidates, int target) {
        vector<vector<int>> result;
        vector<int> subResult;
        sort(candidates.begin(), candidates.end());
        backtrack(candidates, result, subResult, 0, target);
        return result;
    }

    void backtrack(vector<int> nums, vector<vector<int>> &result, vector<int> &subResult, int pos, int target) {
        if (target < 0) return;
        if (target == 0) {
            result.push_back(subResult);
            return;
        }

        for (int i = pos; i < nums.size(); i++) {
            if (i != pos && nums[i] == nums[i - 1]) continue;
            subResult.push_back(nums[i]);
            backtrack(nums, result, subResult, i + 1, target - nums[i]);
            subResult.pop_back();
        }
    }
};