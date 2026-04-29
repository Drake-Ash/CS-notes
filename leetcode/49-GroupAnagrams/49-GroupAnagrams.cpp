// Last updated: 29/04/2026, 23:13:43
class Solution {
public:
    vector<vector<string>> groupAnagrams(vector<string>& strs) {
        unordered_map<string, vector<string>> groups;
        for (int i = 0; i < strs.size(); i++) {
            string copy(strs[i]);
            sort(copy.begin(), copy.end());
            groups[copy].push_back(strs[i]);
        }

        vector<vector<string>> result;
        for (auto x: groups) {
            result.push_back(x.second);
        }
        return result;
    }
};