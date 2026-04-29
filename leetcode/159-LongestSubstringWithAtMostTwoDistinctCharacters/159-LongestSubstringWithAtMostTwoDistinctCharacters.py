# Last updated: 29/04/2026, 23:12:09
class Solution:
    def lengthOfLongestSubstringTwoDistinct(self, s: str) -> int:
        res = l = 0
        seen = {}

        if len(s) == 1:
            return 1

        for i in range(len(s)):
            seen[s[i]] = 1 + seen.get(s[i],0)
            if len(seen) <= 2:
                res = max(res,i - l + 1)
            while len(seen) > 2:
                if seen[s[l]] > 1:
                    seen[s[l]] -= 1
                elif seen[s[l]] == 1:
                    del seen[s[l]]
                l += 1
        return res        