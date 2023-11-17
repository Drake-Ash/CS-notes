---
tags:
  - dsa
  - backtracking
To_review: true
Status: Complete | Pending review
Link: "[leetcode](https://leetcode.com/problems/letter-combinations-of-a-phone-number/description/)"
Time_in_minutes: 22
Difficulty: medium
---
# Problem
## Description
Given a string containing digits from `2-9` inclusive, return all possible letter combinations that the number could represent. Return the answer in **any order**.

A mapping of digits to letters (just like on the telephone buttons) is given below. Note that 1 does not map to any letters.

![](https://assets.leetcode.com/uploads/2022/03/15/1200px-telephone-keypad2svg.png)

**Example 1:**

**Input:** digits = "23"
**Output:** ["ad","ae","af","bd","be","bf","cd","ce","cf"]

**Example 2:**

**Input:** digits = ""
**Output:** []

**Example 3:**

**Input:** digits = "2"
**Output:** ["a","b","c"]

**Constraints:**

- `0 <= digits.length <= 4`
- `digits[i]` is a digit in the range `['2', '9']`.
## My solution
```cpp
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
```
## Optimal solution
```cpp
same as above
```
## Notes
#dsa
- [ ] Get this under 10 minutes