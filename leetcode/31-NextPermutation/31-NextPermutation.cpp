// Last updated: 29/04/2026, 23:13:55
#include<cmath>
using namespace std;
class Solution {
public:
    void nextPermutation(vector<int>& nums) {
        int i = 0;
        int j = 0;
        int temp = 0;
        int n = nums.size();

        for (i = n - 2; i >= 0; i--)
            if (nums[i+1] > nums[i])
                break;

        if (i >= 0) {
            for (j = n - 1; j > i; j--)
                if (nums[j] > nums[i])
                    break;

            temp = nums[i];
            nums[i] = nums[j];
            nums[j] = temp;
        }

        i++;
        for (j = 0; j < floor((n - i)/2); j++) {
            int temp = nums[i+j];
            nums[i+j] = nums[n-1-j];
            nums[n-1-j] = temp;
        }
    }
};
