# Last updated: 29/04/2026, 23:05:26
class Solution:
    def closeStrings(self, word1: str, word2: str) -> bool:
        m1 = defaultdict(int)
        m2 = defaultdict(int)

        for i in word1:
            m1[i] += 1
        
        for i in word2:
            m2[i] += 1
        
        return sorted(m1.values()) == sorted(m2.values()) and set(m1.keys()) == set(m2.keys())