// Last updated: 29/04/2026, 23:11:24
class Solution {
public:
    vector<int> productExceptSelf(vector<int>& nums) {
        vector<int> leftProduct(nums.size());
        vector<int> rightProduct(nums.size());
        vector<int> result(nums.size());
        
        leftProduct[0] = 1;
        for (int i = 1; i < nums.size(); i++) {
            leftProduct[i] = leftProduct[i-1] * nums[i-1];
        }

        rightProduct[nums.size()-1] = 1;
        for (int i = nums.size() - 2; i != -1; i--) {
            rightProduct[i] = rightProduct[i+1] * nums[i+1];
        }

        for (int i = 0; i<leftProduct.size(); i++) {
            result[i] = leftProduct[i] * rightProduct[i];
        }
        return result;
    }
};