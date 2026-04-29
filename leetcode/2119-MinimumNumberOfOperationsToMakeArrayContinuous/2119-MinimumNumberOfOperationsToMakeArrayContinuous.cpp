// Last updated: 29/04/2026, 23:04:14
class Solution {
public:
    int minOperations(vector<int>& nums) {
        int n = nums.size();
        set<int> uniqueNums(nums.begin(), nums.end());
        vector<int> newNums(uniqueNums.begin(), uniqueNums.end());
        
        int r = 0;
        int ops = n;

        for (int l = 0; l < newNums.size(); l++) {
            while (r < newNums.size() && newNums[r] < n + newNums[l]) r++;
            ops = min(ops, n - (r - l));
        }

        return ops;
    }
};