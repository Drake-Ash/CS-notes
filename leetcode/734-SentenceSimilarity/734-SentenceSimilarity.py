# Last updated: 29/04/2026, 23:09:06
class Solution:
    def areSentencesSimilar(self, sentence1: List[str], sentence2: List[str], similarPairs: List[List[str]]) -> bool:
        if len(sentence1) != len(sentence2):
            return False
        
        map = defaultdict(set)

        for w1,w2 in similarPairs:
            map[w1].add(w2)
            map[w2].add(w1)

        for word1, word2 in zip(sentence1, sentence2):
            if word1 != word2 and word2 not in map[word1]:
                return False

        return True
