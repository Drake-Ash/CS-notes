// Last updated: 29/04/2026, 23:14:38
class Solution {
public:
    vector<int> twoSum(vector<int>& nums, int target) {
        vector<int> result;
        unordered_map<int, vector<int>> idVsNums;
        for(int i = 0; i < nums.size(); i++) {
            idVsNums[nums[i]].push_back(i);
        }

        for(auto x: idVsNums) {
            int otherPair = target - x.first;
            if (idVsNums.find(otherPair) == idVsNums.end()) {
                continue;
            }

            if (otherPair == x.first) {
                if (x.second.size() >= 2) {
                    result.push_back(x.second[0]);
                    result.push_back(x.second[1]);
                    return result;
                }
                continue;
            }

            result.push_back(x.second[0]);
            result.push_back(idVsNums[otherPair][0]);
            return result;
        }
        return result;
    }
};