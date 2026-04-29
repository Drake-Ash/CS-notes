// Last updated: 29/04/2026, 23:09:23
class Solution {
public:
    int leastInterval(vector<char>& tasks, int n) {
        vector<int> charCounter(26);

        for (int i = 0; i < tasks.size(); i++) {
            charCounter[tasks[i] - 'A']++;
        }

        priority_queue<int> maxHeap;
        for (int i = 0; i < 26; i++) {
            if (charCounter[i] != 0) maxHeap.push(charCounter[i]);
        }

        queue<vector<int>> waitingQ;
        int time = 0;
        while (!waitingQ.empty() || !maxHeap.empty()) {
            ++time;

            if (!maxHeap.empty()) {
                if (maxHeap.top() - 1 != 0)
                    waitingQ.push({time + n, maxHeap.top() - 1});
                maxHeap.pop();
            }

            if (!waitingQ.empty() && waitingQ.front()[0] == time) {
                maxHeap.push(waitingQ.front()[1]);
                waitingQ.pop();
            }
        }

        return time;
    }
};