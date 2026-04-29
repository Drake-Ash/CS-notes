// Last updated: 29/04/2026, 23:13:03
class Solution {
public:
    string minWindow(string s, string t) {
        if (t.size() == 0 || t.size() > s.size()) return "";

        unordered_map<char, int> tCounter;
        for (int i = 0; i < t.size(); i++) {
            tCounter[t[i]]++;
        }

        unordered_map<char, int> sCounter;
        int have = 0;
        vector<int> results;
        for (int left = 0, right = 0; right < s.size(); right++) {
            char c = s[right];
            sCounter[c]++;

            if (tCounter.count(c) != 0 && sCounter[c] <= tCounter[c]) {
                have++;
            }

            while (have == t.size()) {
                if (results.size() == 0 || right - left + 1 < results[1] - results[0] + 1) {
                    results = {left, right};
                }
                sCounter[s[left]]--;
                if (tCounter.count(s[left]) != 0 && sCounter[s[left]] < tCounter[s[left]]) {
                    have--;
                }
                left++;
            }
        }

        if (results.size() == 0) return "";

        return s.substr(results[0], results[1] - results[0] + 1);
    }
};