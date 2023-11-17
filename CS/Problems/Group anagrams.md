---
tags:
  - dsa
  - arrays
  - important
To_review: true
Status: Complete
Link: "[leetcode](https://leetcode.com/problems/group-anagrams/)"
Difficulty: medium
Time_in_minutes: 60
---
# Problem
## Description
Given an array of strings `strs`, group **the anagrams** together. You can return the answer in **any order**.

An **Anagram** is a word or phrase formed by rearranging the letters of a different word or phrase, typically using all the original letters exactly once.

**Example 1:**

**Input:** strs = ["eat","tea","tan","ate","nat","bat"]
**Output:** ["bat"],["nat","tan"],["ate","eat","tea"]

**Example 2:**

**Input:** strs = [""]
**Output:** [[""]]

**Example 3:**

**Input:** strs = ["a"]
**Output:** [["a"]]

**Constraints:**

- `1 <= strs.length <= 104`
- `0 <= strs[i].length <= 100`
- `strs[i]` consists of lowercase English letters.
## My solution
1. Solution timed out though
```cpp
class Solution {

public:

    bool checkIfAnagram(unordered_map<char, int> charCount, string str) {

        for (auto x: str) {

            charCount[x]--;

        }

  

        for (auto x: charCount) {

            if (x.second != 0) {

                return false;

            }

        }

        return true;

    }

  

    vector<vector<string>> groupAnagrams(vector<string>& strs) {

        vector<vector<string>> result;

        unordered_set<int> visited;

        for (int i = 0; i < strs.size(); i++) {

            if (visited.find(i) != visited.end()) continue;

            visited.insert(i);

  

            vector<string> subResult;

            subResult.push_back(strs[i]);

            unordered_map<char, int> charCounter;

            for(auto x: strs[i]) {

                charCounter[x]++;

            }

  

            for (int j = i+1; j < strs.size(); j++) {

                if (visited.find(j) != visited.end()) continue;

  

                if (checkIfAnagram(charCounter, strs[j])) {

                    visited.insert(j);

                    subResult.push_back(strs[j]);

                }

            }

            result.push_back(subResult);

        }

  

        return result;

    }

};
```

## Optimal solution
```cpp
class Solution {
public:
    vector<vector<string>> groupAnagrams(vector<string>& strs) {
        unordered_map<string, vector<string>> mp;
        
        for(auto x: strs){
            string word = x;
            sort(word.begin(), word.end());
            mp[word].push_back(x);
        }
        
        vector<vector<string>> ans;
        for(auto x: mp){
            ans.push_back(x.second);
        }
        return ans;
    }
};
```
## Notes
1. Think through solution complexities before implementing them
	1. My older solution was brute force based with memoization to help with speeding up things, this does not work good for worst case scenario
	2. Optimal solution is based on sorting and works better and consistent
- [ ] Get this under 10 minutes