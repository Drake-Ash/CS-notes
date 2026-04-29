// Last updated: 29/04/2026, 23:09:03
class Solution {
public:
    int deleteAndEarn(vector<int>& nums) {
        unordered_map<int, int> numsFreq;
        int maxNum = INT_MIN;
        for (int i = 0; i < nums.size(); i++) {
            numsFreq[nums[i]]++;
            maxNum = max(maxNum, nums[i]);
        }

        vector<int> dp(maxNum + 1, 0);
        dp[0] = 0;
        dp[1] = numsFreq.count(1) != 0 ? numsFreq[1] : 0;

        for (int i = 2; i <= maxNum; i++) {
            if (numsFreq.count(i) != 0) {
                dp[i] = max(dp[i-2] + i * numsFreq[i], dp[i-1]);
            } else {
                dp[i] = max(dp[i-2], dp[i-1]);
            }
        }

        return dp[maxNum];
    }
};