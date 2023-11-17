---
tags:
  - dsa
  - sliding-window
  - important
To_review: true
Status: Complete | Pending review
Link: "[leetcode](https://leetcode.com/problems/longest-substring-without-repeating-characters/description/)"
Time_in_minutes: 18
Difficulty: medium
---
# Problem
## Description
Given a string `s`, find the length of the **longest** 

**substring**

 without repeating characters.

**Example 1:**

**Input:** s = "abcabcbb"
**Output:** 3
**Explanation:** The answer is "abc", with the length of 3.

**Example 2:**

**Input:** s = "bbbbb"
**Output:** 1
**Explanation:** The answer is "b", with the length of 1.

**Example 3:**

**Input:** s = "pwwkew"
**Output:** 3
**Explanation:** The answer is "wke", with the length of 3.
Notice that the answer must be a substring, "pwke" is a subsequence and not a substring.

**Constraints:**

- `0 <= s.length <= 5 * 104`
- `s` consists of English letters, digits, symbols and spaces.
## My solution
```cpp
class Solution {

public:

    int lengthOfLongestSubstring(string s) {

        if (s.size() < 2) {

            return s.size();

        }

  

        int maxLength = 0;

        int i = 0, j = 1;

        unordered_set<char> visited;

        visited.insert(s[i]);

  

        while (j < s.size()) {

            if (visited.find(s[j]) != visited.end()) {

                maxLength = max(maxLength, int(visited.size()));

                visited.erase(s[i]);

                i++;

            } else {

                visited.insert(s[j]);

                j++;

            }

        }

        maxLength = max(maxLength, int(visited.size()));

        return maxLength;

    }

};
```
## Optimal solution
```cpp
same as above
```
## Notes
1. don't rush into the solution
2. think of other test cases too, this will help solve problem better
3. Solution intuition
	1. if we don't need repeating characters in substring, we just need to add and subtract items from a set
- [ ] Get this under 5 minutes