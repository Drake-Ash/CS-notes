---
tags:
  - dsa
  - tries
To_review: true
Status: Complete | Pending review
Link: "[leetcode](https://leetcode.com/problems/implement-trie-prefix-tree/description/)"
Time_in_minutes: 5
Difficulty: medium
---
# Problem
## Description

## My solution
```cpp
class TrieNode {
public:
    TrieNode* children[26];
    int wordCount = 0;
};

class Trie {
TrieNode* root;
public:
    Trie() {
        root = new TrieNode();
    }
    
    void insert(string word) {
        TrieNode *cp = root;
        int index = 0;
        for (int i = 0; i < word.size(); i++) {
            index = word[i] - 'a';
            if (cp->children[index] == nullptr) {
                cp->children[index] = new TrieNode();
            }
            cp = cp->children[index];
        }
        cp->wordCount++;
    }
    
    bool search(string word) {
        TrieNode *cp = root;

        int index = 0;
        for (int i = 0; i < word.size(); i++) {
            index = word[i] - 'a';
            if (cp->children[index] == nullptr) return false;

            cp = cp->children[index];
        }
        return cp->wordCount != 0;
    }
    
    bool startsWith(string prefix) {
        TrieNode *cp = root;

        int index = 0;
        for (int i = 0; i < prefix.size(); i++) {
            index = prefix[i] - 'a';
            if (cp->children[index] == nullptr) return false;

            cp = cp->children[index];
        }
        return true;
    }
};

/**
 * Your Trie object will be instantiated and called as such:
 * Trie* obj = new Trie();
 * obj->insert(word);
 * bool param_2 = obj->search(word);
 * bool param_3 = obj->startsWith(prefix);
 */
```
## Optimal solution
```cpp
same as above
```
## Notes
#dsa
