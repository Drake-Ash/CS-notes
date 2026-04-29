// Last updated: 29/04/2026, 23:03:40

class Solution {
public:
    vector<int> fullBloomFlowers(vector<vector<int>>& flowers, vector<int>& people) {
        vector<int> result;
        map<int, int> flowersMap;

        for (int i = 0; i < flowers.size(); i++) {
            flowersMap[flowers[i][0]]++;
            flowersMap[flowers[i][1] + 1]--;
        }
        vector<int> positions;
        vector<int> prefixSum;
        int curr = 0;
        for (auto& flower: flowersMap) {
            positions.push_back(flower.first);
            curr += flower.second;
            prefixSum.push_back(curr);
        }

        for (int i = 0; i < people.size(); i++) {
            int position = upper_bound(positions.begin(), positions.end(), people[i]) - positions.begin() - 1;
            result.push_back(position != -1 ? prefixSum[position] : 0);
        }

        return result;
    }

    vector<int> fullBloomFlowers1(vector<vector<int>>& flowers, vector<int>& people) {
        unordered_map<long, long> flowerLinear;
        for (long i = 0; i < flowers.size(); i++) {
            vector<int> flower  = flowers[i];
            for (long j = flower[0]; j <= flower[1]; j++) {
                flowerLinear[j]++;
            }
        }

        vector<int> result;
        for (long i = 0; i < people.size(); i++) {
            result.push_back(flowerLinear[people[i]]);
        }

        return result;
    }
};