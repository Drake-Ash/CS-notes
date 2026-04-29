// Last updated: 29/04/2026, 23:10:38
class Solution {
public:
    vector<int> topKFrequent(vector<int>& nums, int k) {
        vector<int> result;
        unordered_map<int, int> counter;

        for (int i = 0; i < nums.size(); i++) {
            counter[nums[i]]++;
        }

        map<int, vector<int>> occurenceCounter;
        for (auto x: counter) {
            occurenceCounter[x.second].push_back(x.first);
        }

        k = counter.size() - k;
        for (auto x: occurenceCounter) {
            for (int i = 0; i < x.second.size() && k >= 0; i++) {
                if (k == 0) {
                    result.push_back(x.second[i]);
                } else {
                    k--;
                }
            }
        }

        return result;
    }
};