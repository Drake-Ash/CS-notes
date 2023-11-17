---
tags:
  - dsa
  - tries
To_review: true
Status: Complete | Pending review
Link: "[leetcode](https://leetcode.com/problems/design-add-and-search-words-data-structure/description/)"
Time_in_minutes: 10
Difficulty: medium
---
# Problem
## Description
Design a data structure that supports adding new words and finding if a string matches any previously added string.

Implement the `WordDictionary` class:

- `WordDictionary()` Initializes the object.
- `void addWord(word)` Adds `word` to the data structure, it can be matched later.
- `bool search(word)` Returns `true` if there is any string in the data structure that matches `word` or `false` otherwise. `word` may contain dots `'.'` where dots can be matched with any letter.

**Example:**

**Input**
["WordDictionary","addWord","addWord","addWord","search","search","search","search"]
[[],["bad"],["dad"],["mad"],["pad"],["bad"],[".ad"],["b.."]]
**Output**
[null,null,null,null,false,true,true,true]

**Explanation**
WordDictionary wordDictionary = new WordDictionary();
wordDictionary.addWord("bad");
wordDictionary.addWord("dad");
wordDictionary.addWord("mad");
wordDictionary.search("pad"); // return False
wordDictionary.search("bad"); // return True
wordDictionary.search(".ad"); // return True
wordDictionary.search("b.."); // return True

**Constraints:**

- `1 <= word.length <= 25`
- `word` in `addWord` consists of lowercase English letters.
- `word` in `search` consist of `'.'` or lowercase English letters.
- There will be at most `2` dots in `word` for `search` queries.
- At most `104` calls will be made to `addWord` and `search`.
## My solution
```cpp
class TrieNode {
public:
    TrieNode *children[26];
    int wordCount = 0;
};

class WordDictionary {
TrieNode *root;
public:
    WordDictionary() {
        root = new TrieNode();
    }
    ~WordDictionary() {delete root;}

    void addWord(string word) {
        int index = 0;
        TrieNode *cp = root;
        for (int i = 0; i < word.size(); i++) {
            index = word[i] - 'a';
            if (cp->children[index] == nullptr) cp->children[index] = new TrieNode();
            cp = cp->children[index];
        }
        cp->wordCount++;
    }
    
    bool search(string word) {
        return search(word, 0, root);
    }

    bool search(string word, int position, TrieNode *node) {
        if (position == word.size())
            return node->wordCount != 0;

        if (word[position] != '.') {
            int index = word[position] - 'a';
            if (node->children[index] != nullptr) {
                return search(word, position + 1, node->children[index]);
            }
        } else {
            for (int i = 0; i < 26; i++) {
                if (node->children[i] != nullptr) {
                    if (search(word, position + 1, node->children[i]))
                        return true;
                }
            }
        }
        return false;
    }
};

/**
 * Your WordDictionary object will be instantiated and called as such:
 * WordDictionary* obj = new WordDictionary();
 * obj->addWord(word);
 * bool param_2 = obj->search(word);
 */
```
## Optimal solution
```cpp
same as above
```
## Notes
#dsa
1. Even though time complexities might be same, think how you allocate memory as well.
2. This problem got memory limit exceeded flag because
	1. I was using iterative approach for search without proper memory handling
		1. Create search space for every iteration
		2. Expand search space when `.` this character comes.
		3. Set current search space to new search space based on the iteration completion.
- [ ] Get this under 5 minutes