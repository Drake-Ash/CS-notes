// Last updated: 29/04/2026, 23:14:21
class Solution {
public:
    bool isValid(string s) {
        stack<char> t;
        for (int i = 0; i < s.size(); i++) {
            if (s[i] == '[') {
                t.push(']');
            } else if (s[i] == '{') {
                t.push('}');
            } else if (s[i] == '(') {
                t.push(')');
            } else if (!t.empty()) {
                if (s[i] != t.top()) {
                    return false;
                }
                t.pop();
            } else {
                return false;
            }
        }
        if (!t.empty()) return false;
        return true;
    }
};