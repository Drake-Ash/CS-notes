// Last updated: 29/04/2026, 23:14:05
class Solution
{
public:
    int removeElement(vector<int> &nums, int val)
    {
        int swapper = 0;
        int pointer = 0;
        int temp = 0;
        int len = nums.size();
        while (pointer < len)
        {
            if (nums[swapper] == val)
            {
                if (nums[pointer] != val)
                {
                    // swap pointer and swapper
                    temp = nums[swapper];
                    nums[swapper] = nums[pointer];
                    nums[pointer] = temp;
                    swapper++;
                }
            }
            else
            {
                swapper++;
            }
            pointer++;
        }
        return swapper;
    }
};