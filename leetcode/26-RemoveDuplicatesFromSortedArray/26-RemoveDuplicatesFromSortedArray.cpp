// Last updated: 29/04/2026, 23:14:08
class Solution
{
public:
    int removeDuplicates(vector<int> &nums)
    {
        if (nums.size() == 0)
            return 0;
        int repeated = 0;
        for (int i = 0; i < nums.size() - 1; i++)
            if (nums[i] == nums[i + 1])
            {
                repeated++;
                nums.erase(nums.begin() + i + 1);
                i--;
            }
        return nums.size();
    }
};