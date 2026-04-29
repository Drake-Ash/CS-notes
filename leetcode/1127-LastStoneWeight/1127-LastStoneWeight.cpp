// Last updated: 29/04/2026, 23:08:15
class Solution {
public:
    int lastStoneWeight(vector<int>& stones) {
        priority_queue<int> maxHeap(stones.begin(), stones.end());
        int result = 0;
        int x, y;

        while(true) {
            if (maxHeap.size() == 1) {
                result = maxHeap.top();
                break;
            }
            if (maxHeap.size() != 0) {
                x = maxHeap.top();
                maxHeap.pop();
            } else break;

            if (maxHeap.size() != 0) {
                y = maxHeap.top();
                maxHeap.pop();
            } else break;

            // cout <<  x << " " << y << endl;

            if (x == y) continue;
            maxHeap.push(x - y);
        }

        return result;
    }
};