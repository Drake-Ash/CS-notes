---
tags:
  - dsa
  - stacks
To_review: true
Status: Complete | Pending review
Link: "[leetcode](https://leetcode.com/problems/valid-parentheses/description/)"
Time_in_minutes: 13
Difficulty: easy
---
# Problem
## Description
Given a string `s` containing just the characters `'('`, `')'`, `'{'`, `'}'`, `'['` and `']'`, determine if the input string is valid.

An input string is valid if:

1. Open brackets must be closed by the same type of brackets.
2. Open brackets must be closed in the correct order.
3. Every close bracket has a corresponding open bracket of the same type.

**Example 1:**

**Input:** s = "()"
**Output:** true

**Example 2:**

**Input:** s = "()[]{}"
**Output:** true

**Example 3:**

**Input:** s = "(]"
**Output:** false

**Constraints:**

- `1 <= s.length <= 104`
- `s` consists of parentheses only `'()[]{}'`.
## My solution
```cpp
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
```
## Optimal solution
```cpp
same as above
```
## Notes
#dsa
