---
tags:
  - dsa
  - sliding-window
  - important
To_review: true
Status: Review again
Link: "[leetcode](https://leetcode.com/problems/longest-repeating-character-replacement/description/)"
Time_in_minutes: 32
Difficulty: medium
---
# Problem
## Description
You are given a string `s` and an integer `k`. You can choose any character of the string and change it to any other uppercase English character. You can perform this operation at most `k` times.

Return _the length of the longest substring containing the same letter you can get after performing the above operations_.

**Example 1:**

**Input:** s = "ABAB", k = 2
**Output:** 4
**Explanation:** Replace the two 'A's with two 'B's or vice versa.

**Example 2:**

**Input:** s = "AABABBA", k = 1
**Output:** 4
**Explanation:** Replace the one 'A' in the middle with 'B' and form "AABBBBA".
The substring "BBBB" has the longest repeating letters, which is 4.
There may exists other ways to achive this answer too.

**Constraints:**

- `1 <= s.length <= 105`
- `s` consists of only uppercase English letters.
- `0 <= k <= s.length`
## My solution
```cpp
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

            // cout << length << " " << maxCounter << " " << maxLength << endl;

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
```
## Optimal solution
```cpp
same as above
```
## Notes
1. Sometimes things might appear to be difficult, certain problems have multiple subproblems and each subproblem might feel too much. Instead of giving up, try solving it, you'll be surprised how far you can come towards solving it
2. Think through the problem sub parts properly, don't neglect on how to build certain things
- [ ] Get this under 10 minutes

Sliding window has 3 types of movements
1. Expand window
2. Shrink window
3. Slide window