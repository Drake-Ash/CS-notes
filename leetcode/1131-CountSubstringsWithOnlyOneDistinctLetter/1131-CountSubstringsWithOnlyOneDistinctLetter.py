# Last updated: 29/04/2026, 23:08:14
class Solution:
    def countLetters(self, s: str) -> int:
        unq = []
        s += '_'
        start = 0
        for i in range(1,len(s)):
            if s[i-1] != s[i]:
                unq.append(s[start:i])
                start = i
        
        res = 0
        for i in unq:
            n = len(i)
            res += n * (n+1)//2

        return res