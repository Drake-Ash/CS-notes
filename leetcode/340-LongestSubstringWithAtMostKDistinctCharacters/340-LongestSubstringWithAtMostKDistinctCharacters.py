# Last updated: 29/04/2026, 23:10:40
class Solution:
    def lengthOfLongestSubstringKDistinct(self, s: str, k: int) -> int:
        res = l = 0
        seen = {}

        if len(s) == 1 and k == 0:
            return 0
        elif len(s) == 1 and k != 0:
            return 1

        for i in range(len(s)):
            seen[s[i]] = 1 + seen.get(s[i],0)
            if len(seen) <= k:
                res = max(res,i - l + 1)
            while len(seen) > k:
                if seen[s[l]] > 1:
                    seen[s[l]] -= 1
                elif seen[s[l]] == 1:
                    del seen[s[l]]
                l += 1
        return res