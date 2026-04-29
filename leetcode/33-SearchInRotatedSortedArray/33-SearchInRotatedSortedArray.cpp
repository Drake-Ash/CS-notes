// Last updated: 29/04/2026, 23:14:01
class Solution {
public:
    int search(vector<int>& nums, int target) {
        int left = 0, right = nums.size() - 1;
        int mid = 0;

        while (left <= right) {
            mid = left + (right-left)/2;
            cout << left << " " << mid << " " << right << endl;

            if (nums[mid] == target) {
                return mid;
            }
            if (nums[left] <= nums[mid]) {
                // Left sorted portion
                if (nums[left] <= target && target <= nums[mid]) right = mid - 1;
                else left = mid + 1;
            } else {
                // Right sorted portion
                if (nums[mid] <= target && target <= nums[right]) left = mid + 1;
                else right = mid - 1;
            }
        }

        return -1;
    }
};