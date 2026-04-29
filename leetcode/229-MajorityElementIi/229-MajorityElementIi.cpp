// Last updated: 29/04/2026, 23:11:16
class Solution {
public:
    vector<int> majorityElement(vector<int>& nums) {
        int x = 0, y = 0, cx = 0, cy = 0;
        for (int i = 0; i < nums.size(); i++) {
            if (x == nums[i]) {
                cx++;
            } else if (y == nums[i]) {
                cy++;
            } else if (cx == 0) {
                x = nums[i];
                cx++;
            } else if (cy == 0) {
                y = nums[i];
                cy++;
            } else {
                cx--;
                cy--;
            }
            // cout << x << " " << cx << " " << y << " " << cy << endl;
        }

        cx = 0;
        cy = 0;

        for (int i = 0; i < nums.size(); i++) {
            if (x == nums[i]) cx++;
            else if (y == nums[i]) cy++;
        }
        vector<int> result;
        if (cx > nums.size()/3) result.push_back(x);
        if (cy > nums.size()/3) result.push_back(y);
        return result;
    }
};