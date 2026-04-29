// Last updated: 29/04/2026, 23:13:37
#include <vector>
#include <climits>
using namespace std;

class Solution
{
public:
    int maxSubArray(vector<int> &nums)
    {
//         [-2,1,-3,4,-1,2,1,-5,4]

//         1. sumSoFar = a[0], result = a[0]
//         2. for i 1 to n:
//         3. sumSoFar += a[i]
//         4. if a[i] > sumSoFar:
//         5. sumSoFar = a[i]
//         6. result = max(sumSoFar, result)
        int result = nums[0];
        int sumSoFar = nums[0];
        
        for (int i = 1; i < nums.size(); i++) {
            sumSoFar += nums[i];
            sumSoFar = max(sumSoFar, nums[i]);
            result = max(sumSoFar, result);
        }
        return result;
    }
};
