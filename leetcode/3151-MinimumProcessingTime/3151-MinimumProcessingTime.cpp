// Last updated: 29/04/2026, 23:02:32
class Solution {
public:
    int minProcessingTime(vector<int>& processorTime, vector<int>& tasks) {
        priority_queue<int, vector<int>, greater<int>> processorMinHeap(processorTime.begin(), processorTime.end());
        priority_queue<int> taskMaxHeap(tasks.begin(), tasks.end());

        int maxTime = 0;
        int currentProcessorTime = 0;
        int currentTaskTime = 0;
        
        while (!processorMinHeap.empty()) {
            currentProcessorTime = processorMinHeap.top();
            for (int i = 0; i < 4; i++) {
                currentTaskTime = taskMaxHeap.top();
                maxTime = max(maxTime, currentProcessorTime + currentTaskTime);
                taskMaxHeap.pop();
            }
            processorMinHeap.pop();
        }

        return maxTime;
    }
};