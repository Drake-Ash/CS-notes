// Last updated: 29/04/2026, 23:12:33
class Solution {
public:
    bool isPalindrome(string s) {
        string t;
        for (auto x: s) {
            if (isalpha(x) || isdigit(x))
                t += tolower(x);
        }
        cout << t << endl;

        int i = 0;
        int j = t.size() - 1;
        while (i < j) {
            cout << t[i] << t[j] << endl;
            if (t[i] == t[j]) {
                i++;
                j--;
            } else {
                return false;
            }
        }
        return true;
    }
};