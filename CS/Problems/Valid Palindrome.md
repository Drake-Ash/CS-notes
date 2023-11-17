---
tags:
  - dsa
  - two-pointers
To_review: true
Status: Complete
Link: "[leetcode](https://leetcode.com/problems/valid-palindrome/)"
Difficulty: easy
Time_in_minutes: 11
---
# Problem
## Description
A phrase is a **palindrome** if, after converting all uppercase letters into lowercase letters and removing all non-alphanumeric characters, it reads the same forward and backward. Alphanumeric characters include letters and numbers.

Given a string `s`, return `true` _if it is a **palindrome**, or_ `false` _otherwise_.

**Example 1:**

**Input:** s = "A man, a plan, a canal: Panama"
**Output:** true
**Explanation:** "amanaplanacanalpanama" is a palindrome.

**Example 2:**

**Input:** s = "race a car"
**Output:** false
**Explanation:** "raceacar" is not a palindrome.

**Example 3:**

**Input:** s = " "
**Output:** true
**Explanation:** s is an empty string "" after removing non-alphanumeric characters.
Since an empty string reads the same forward and backward, it is a palindrome.

**Constraints:**

- `1 <= s.length <= 2 * 105`
- `s` consists only of printable ASCII characters.
## My solution
```cpp
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
```
## Optimal solution
```cpp
same as above
```
## Notes
1. Remember to use isalpha, isdigit and tolower for this. makes life easier
- [ ] Get this under 5 minutes