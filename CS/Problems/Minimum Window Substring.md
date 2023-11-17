---
tags:
  - dsa
  - sliding-window
To_review: true
Status: Review again
Link: "[leetcode](https://leetcode.com/problems/minimum-window-substring/description/)"
Time_in_minutes: 60
Difficulty: hard
---
# Problem
## Description
Given two strings `s` and `t` of lengths `m` and `n` respectively, return _the **minimum window**_ 

**_substring_**

 _of_ `s` _such that every character in_ `t` _(**including duplicates**) is included in the window_. If there is no such substring, return _the empty string_ `""`.

The testcases will be generated such that the answer is **unique**.

**Example 1:**

**Input:** s = "ADOBECODEBANC", t = "ABC"
**Output:** "BANC"
**Explanation:** The minimum window substring "BANC" includes 'A', 'B', and 'C' from string t.

**Example 2:**

**Input:** s = "a", t = "a"
**Output:** "a"
**Explanation:** The entire string s is the minimum window.

**Example 3:**

**Input:** s = "a", t = "aa"
**Output:** ""
**Explanation:** Both 'a's from t must be included in the window.
Since the largest window of s only has one 'a', return empty string.

**Constraints:**

- `m == s.length`
- `n == t.length`
- `1 <= m, n <= 105`
- `s` and `t` consist of uppercase and lowercase English letters.
## My solution
```cpp
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
```
## Optimal solution
```cpp
same as above
```
## Notes
- [ ] Get this under 15 minutes