# Last updated: 29/04/2026, 23:08:07
class Solution:
    def gcdOfStrings(self, str1: str, str2: str) -> str:
        m = len(str1)
        n = len(str2)
        for i in range(min(m,n),0,-1):
            if m % i == 0 and n % i == 0:
                if str1[:i] * (m // i) == str1 and str1[:i] * (n // i) == str2:
                    return str1[:i]
        return ""