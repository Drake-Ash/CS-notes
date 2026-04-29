// Last updated: 29/04/2026, 23:11:21
class Solution {
public:
    bool isAnagram(string s, string t) {
        unordered_map<char, int> stringS;
        unordered_map<char, int> stringT;

        for (int i = 0; i < s.size(); i++) {
            if (stringS.find(s[i]) == stringS.end())
                stringS[s[i]] = 1;
            else
                stringS[s[i]] ++;
        }
        for (int i = 0; i < t.size(); i++) {
            if (stringS.find(t[i]) == stringS.end())
                return false;

            if (stringT.find(t[i]) == stringT.end())
                stringT[t[i]] = 1;
            else
                stringT[t[i]] ++;
        }

        if (stringS.size() != stringT.size())
            return false;
        
        for (auto x: stringS) {
            if (stringS[x.first] != stringT[x.first])
                return false;
        }
        return true;
    }
};
