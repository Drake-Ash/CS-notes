# Last updated: 29/04/2026, 23:14:27
class Solution:
    def longestPalindrome(self, s: str) -> str:
        res = ""
        cnt = 0

        for i in range(len(s)):
            l, r = i,i

            while l >= 0 and r < len(s) and s[l] == s[r]:
                if r - l + 1 > cnt:
                    res = s[l:r+1]
                    cnt = r - l + 1
                l -= 1
                r += 1
            
            l, r = i,i + 1

            while l >= 0 and r < len(s) and s[l] == s[r]:
                if r - l + 1 > cnt:
                    res = s[l:r+1]
                    cnt = r - l + 1
                l -= 1
                r += 1
        return res