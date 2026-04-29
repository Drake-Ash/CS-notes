// Last updated: 29/04/2026, 23:14:22
class Solution {
public:
    vector<vector<int>> threeSum(vector<int>& nums) {
        vector<vector<int>> result;
        sort(nums.begin(), nums.end());
        int n = nums.size();

        for (int i = 0; i < n; i++) {
            if(i > 0 && nums[i] == nums[i-1]) continue;
            int j = i + 1;
            int k = n - 1;

            while (j < k) {
                int threeSum = nums[i] + nums[j] + nums[k];
                if (threeSum > 0) k--;
                else if (threeSum < 0) j++;
                else {
                    result.push_back({nums[i], nums[j], nums[k]});
                    j++;
                    k--;
                    while (j < k && nums[j] == nums[j-1]) j++;
                    while (j < k && nums[k] == nums[k+1]) k--;
                }
            }
        }

        return result;
    }
};