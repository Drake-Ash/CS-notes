# Last updated: 29/04/2026, 23:08:17
class Solution:
    def calculateTime(self, keyboard: str, word: str) -> int:
        word = keyboard[0] + word
        
        map = defaultdict(int)

        start = 0
        for ch in keyboard:
            map[ch] = start
            start += 1
        
        res = 0

        for i in range(1,len(word)):
            res += abs(map[word[i]] - map[word[i-1]])

        return res


        