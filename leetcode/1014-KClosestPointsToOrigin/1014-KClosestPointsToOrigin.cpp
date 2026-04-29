// Last updated: 29/04/2026, 23:08:43
class Solution {
public:
    vector<vector<int>> kClosest(vector<vector<int>>& points, int k) {
        priority_queue<vector<int>, vector<vector<int>>, greater<vector<int>>> minHeap;

        for (int i = 0; i < points.size(); i++) {
            minHeap.push({points[i][0]*points[i][0] + points[i][1]*points[i][1], points[i][0], points[i][1]});
        }

        vector<vector<int>> result;
        while (k > 0) {
            vector<int> point = minHeap.top();
            result.push_back({point[1], point[2]});
            minHeap.pop();
            k--;
        }

        return result;
    }
};