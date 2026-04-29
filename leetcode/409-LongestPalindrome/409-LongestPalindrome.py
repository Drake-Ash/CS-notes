# Last updated: 29/04/2026, 23:10:21
class Solution:
    def longestPalindrome(self, s: str) -> int:
        hMap = Counter(s)

        oddFound = False
        res = 0

        for cnt in hMap.values():
            if cnt % 2 == 0:
                res += cnt
            else:
                res += (cnt - 1)
                oddFound = True
        
        if oddFound:
            res += 1
        
        return res