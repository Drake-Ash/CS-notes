---
tags:
  - dsa
  - arrays
To_review: true
Status: Complete
Link: "[leetcode](https://leetcode.com/problems/valid-anagram/)"
Difficulty: easy
Time_in_minutes: 14
---
# Problem
## Description
Given two strings `s` and `t`, return `true` _if_ `t` _is an anagram of_ `s`_, and_ `false` _otherwise_.

An **Anagram** is a word or phrase formed by rearranging the letters of a different word or phrase, typically using all the original letters exactly once.

**Example 1:**

**Input:** s = "anagram", t = "nagaram"
**Output:** true

**Example 2:**

**Input:** s = "rat", t = "car"
**Output:** false

**Constraints:**

- `1 <= s.length, t.length <= 5 * 104`
- `s` and `t` consist of lowercase English letters.
## My solution
```cpp
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
```
## Optimal solution
```cpp
class Solution {
public:
    bool isAnagram(string s, string t) {
        unordered_map<char, int> count;
        
        // Count the frequency of characters in string s
        for (auto x : s) {
            count[x]++;
        }
        
        // Decrement the frequency of characters in string t
        for (auto x : t) {
            count[x]--;
        }
        
        // Check if any character has non-zero frequency
        for (auto x : count) {
            if (x.second != 0) {
                return false;
            }
        }
        
        return true;
    }
};
```
## Notes
1. Understand syntax of things which I am using to solve the problem before I run the program - Caused the largest time gap for me
2. Instead of jumping right into the solution think about how to solve it, even a minute of thinking here can help with solving this better and faster
3. Possible solutions
	1. Sorting and compare - O(nlogn) time and O(1) space
	2. Counting using hashmaps - O(n) time and O(n) space
4. 