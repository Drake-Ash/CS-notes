# Last updated: 29/04/2026, 23:08:22
class Solution:
    def numKLenSubstrNoRepeats(self, s: str, k: int) -> int:
        res = 0
        l = 0
        seen = {}

        for r in range(len(s)):
            seen[s[r]] = 1 + seen.get(s[r], 0)
            
            # If the window size exceeds k, shrink the window from the left
            if r - l + 1 > k:
                if seen[s[l]] == 1:
                    del seen[s[l]]
                else:
                    seen[s[l]] -= 1
                l += 1
            
            # Check if the window size is exactly k and all characters are unique
            if r - l + 1 == k and len(seen) == k:
                res += 1
        
        return res