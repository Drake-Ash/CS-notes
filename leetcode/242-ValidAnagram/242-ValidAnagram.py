# Last updated: 29/04/2026, 23:11:09
class Solution:
    def isAnagram(self, s: str, t: str) -> bool:
        return sorted(s) == sorted(t)