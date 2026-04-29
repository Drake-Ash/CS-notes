// Last updated: 29/04/2026, 23:02:24
class Solution {
public:
    int findMinimumOperations(string s1, string s2, string s3) {
        int len = min(s1.size(), min(s2.size(), s3.size()));
        int result = s1.size() + s2.size() + s3.size() - 3 * len;

        for (int i = 0; i < len; i++) {
            if (s1[i] == s2[i] && s2[i] == s3[i]) {
                continue;
            } else {
                if (i == 0) return -1;
                else {
                    return s1.size() + s2.size() + s3.size() - 3 * i;
                }
            }
        }
        
        return result;
    }
};