// Last updated: 29/04/2026, 23:13:47
class Solution {
public:
    vector<vector<int>> permute(vector<int>& nums) {
        vector<vector<int>> result;
        vector<int> subResult;
        unordered_set<int> used;
        backtrack(nums, result, subResult, used);
        return result;
    }

    void backtrack(vector<int> nums, vector<vector<int>> &result, vector<int> subResult, unordered_set<int> used) {
        if (subResult.size() == nums.size()) {
            result.push_back(subResult);
            return;
        }
        for (int i = 0; i < nums.size(); i++) {
            if (used.count(nums[i]) == 0) {
                used.insert(nums[i]);
                subResult.push_back(nums[i]);
                backtrack(nums, result, subResult, used);
                used.erase(nums[i]);
                subResult.pop_back();
            }
        }
    }
};