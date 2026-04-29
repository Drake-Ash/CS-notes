// Last updated: 29/04/2026, 23:14:40
class Solution {
public:
    int lengthOfLongestSubstring(string s) {
        int maxLength = 0;
        int i = 0, j = 0;
        unordered_set<char> visited;

        while (j < s.size()) {
            if (visited.find(s[j]) != visited.end()) {
                visited.erase(s[i]);
                i++;
            } else {
                visited.insert(s[j]);
                maxLength = max(maxLength, int(visited.size()));
                j++;
            }
        }
        return maxLength;
    }
};