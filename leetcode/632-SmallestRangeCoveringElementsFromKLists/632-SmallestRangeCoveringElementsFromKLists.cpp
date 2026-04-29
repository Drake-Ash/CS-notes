// Last updated: 29/04/2026, 23:09:18
class Solution {
public:
    vector<int> smallestRange(vector<vector<int>>& nums) {
        priority_queue<vector<int>, vector<vector<int>>, greater<vector<int>>> minHeap;
        int maxVal = INT_MIN;
        for (int i = 0; i < nums.size(); i++) {
            minHeap.push({nums[i][0], i, 0});
            maxVal = max(maxVal, nums[i][0]);
        }

        vector<int> result = {-100001, 100001};

        while (true) {
            vector<int> minValData = minHeap.top();
            minHeap.pop();

            cout << minValData[0] << " " << maxVal <<endl;

            if (result[1] - result[0] > maxVal - minValData[0])
                result = {minValData[0], maxVal};

            if (minValData[2] < nums[minValData[1]].size() - 1) {
                minHeap.push({nums[minValData[1]][minValData[2]+1], minValData[1], minValData[2]+1});
                maxVal = max(maxVal, nums[minValData[1]][minValData[2]+1]);
            } else {
                break;
            }
        }

        return result;
    }
};