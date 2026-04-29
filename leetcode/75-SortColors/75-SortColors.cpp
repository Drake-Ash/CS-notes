// Last updated: 29/04/2026, 23:13:10
class Solution {
public:
    
    void swap(int& x, int& y) {
        int temp;
        temp = y;
        y = x;
        x = temp;
    }
    
    void sortColors(vector<int>& nums) {
        int low = 0;
        int med = 0;
        int high = nums.size() - 1;
        while (med <= high) {
            if (nums[med] == 0) {
                swap(nums[med], nums[low]);
                med ++;
                low ++;
            } else if (nums[med] == 1) {
                med ++;
            } else if (nums[med] == 2) {
                swap(nums[med], nums[high]);
                high --;
            }
        }
    }
};
