# Last updated: 29/04/2026, 23:13:18
class Solution:
    def lengthOfLastWord(self, s: str) -> int:
        i = len(s)-1
        res = 0
        while i > -1:
            while i > -1 and s[i] == ' ':
                i -= 1
            while i > -1 and s[i] != ' ':
                res += 1
                i -= 1
            return res