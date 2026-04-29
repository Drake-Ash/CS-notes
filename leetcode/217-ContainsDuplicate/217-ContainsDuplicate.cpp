// Last updated: 29/04/2026, 23:11:32
class Solution {
public:
    bool containsDuplicate(vector<int>& nums) {
        unordered_set<int> duplicateChecker;

        for (int i = 0 ; i< nums.size(); i++) {
            if (duplicateChecker.find(nums[i]) != duplicateChecker.end()) {
                return true;
            }
            duplicateChecker.insert(nums[i]);
        }
        return false;
    }
};