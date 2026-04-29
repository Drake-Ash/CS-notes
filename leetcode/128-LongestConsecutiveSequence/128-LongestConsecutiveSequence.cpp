// Last updated: 29/04/2026, 23:12:31
class Solution {
public:
    int longestConsecutive(vector<int>& nums) {
        unordered_set<int> uniqueNums;
        for (int i = 0; i< nums.size(); i++) {
            uniqueNums.insert(nums[i]);
        }

        int maxSeq = 0;
        int currentSeq = 0;
        for (int i = 0; i< nums.size(); i++) {
            int j = 0;
            if (uniqueNums.find(nums[i] - 1) == uniqueNums.end()) {
                while (uniqueNums.find(nums[i] + j) != uniqueNums.end()) {
                    j++;
                    currentSeq++;
                }
                maxSeq = max(maxSeq, currentSeq);
                currentSeq = 0;
            }
        }

        return maxSeq;
    }
};