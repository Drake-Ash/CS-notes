// Last updated: 29/04/2026, 23:11:30
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