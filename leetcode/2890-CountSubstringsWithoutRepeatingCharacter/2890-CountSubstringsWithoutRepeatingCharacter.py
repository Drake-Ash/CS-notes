# Last updated: 29/04/2026, 23:02:39
class Solution:
    def numberOfSpecialSubstrings(self, s: str) -> int:
        window = set()
        res = 0
        l = 0

        for r in range(len(s)):
            while s[r] in window:
                window.remove(s[l])
                l += 1
            window.add(s[r])
            res += r-l+1

        return res
                