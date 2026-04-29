// Last updated: 29/04/2026, 23:10:55
class Solution {
public:
    int findDuplicate(vector<int>& nums) {
        int i = 0;
        for (i = 0; i < nums.size(); i++)
            nums[i]--;
        
        for (i = 0; i < nums.size(); i++)
            nums[nums[i]%nums.size()] += nums.size();

        for (i = 0; i < nums.size() && nums[i]/nums.size() < 2; i++);
        return i + 1;
    }
};