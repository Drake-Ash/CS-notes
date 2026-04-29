// Last updated: 29/04/2026, 23:14:14
class Solution {
public:
    unordered_map<char, vector<char>> t9char;

    Solution() {
        t9char['2'] = {'a', 'b', 'c'};
        t9char['3'] = {'d', 'e', 'f'};
        t9char['4'] = {'g', 'h', 'i'};
        t9char['5'] = {'j', 'k', 'l'};
        t9char['6'] = {'m', 'n', 'o'};
        t9char['7'] = {'p', 'q', 'r', 's'};
        t9char['8'] = {'t', 'u', 'v'};
        t9char['9'] = {'w', 'x', 'y', 'z'};
    }

    vector<string> letterCombinations(string digits) {
        vector<string> result;
        backtrack(result, "", digits, 0);
        return result;
    }

    void backtrack(vector<string> &result, string subResult, string digits, int pos) {
        if (pos == digits.size() && !subResult.empty()) {
            result.push_back(subResult);
            return;
        }

        for (int i = 0; i < t9char[digits[pos]].size(); i++) {
            subResult.push_back(t9char[digits[pos]][i]);
            backtrack(result, subResult, digits, pos + 1);
            subResult.pop_back();
        }
    }
};