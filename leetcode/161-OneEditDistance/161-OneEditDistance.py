# Last updated: 29/04/2026, 23:12:05
class Solution:
    def isOneEditDistance(self, s: str, t: str) -> bool:
        m, n = len(s), len(t)
        
        # If length difference is more than 1, return False
        if abs(m - n) > 1:
            return False
        
        # Iterate through the strings
        for i in range(min(m, n)):
            if s[i] != t[i]:
                # If lengths are the same, check if the rest of the strings are the same after this point
                if m == n:
                    return s[i+1:] == t[i+1:]
                # If s is longer, check if deleting s[i] makes the strings equal
                elif m > n:
                    return s[i+1:] == t[i:]
                # If t is longer, check if deleting t[i] makes the strings equal
                else:
                    return s[i:] == t[i+1:]
        
        # If all previous characters were the same, then the only possible one edit is adding/deleting the last character
        return abs(m - n) == 1