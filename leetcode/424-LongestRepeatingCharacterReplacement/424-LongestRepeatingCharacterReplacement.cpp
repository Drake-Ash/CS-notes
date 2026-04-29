// Last updated: 29/04/2026, 23:10:18
class Solution {
public:
    int characterReplacement(string s, int k) {
        if (s.size() < 2) return s.size();

        int maxCounter = 0;
        int maxLength = 0;
        unordered_map<char, int> counter;
        for (int left = 0, right = 0; right < s.size(); right++) {
            int length = right - left + 1;
            counter[s[right]]++;
            maxCounter = max(counter[s[right]], maxCounter);
            if (length - maxCounter <= k) {
                maxLength = max(maxLength, length);
            } else {
                counter[s[left]]--;
                left++;
            }
        }
        return maxLength;
    }
};