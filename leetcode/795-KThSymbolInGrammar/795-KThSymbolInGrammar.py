# Last updated: 29/04/2026, 23:08:53
class Solution:
    def kthGrammar(self, n: int, k: int) -> int:
        if n == 1:
            return 0
        l = 2**(n - 1)
        half = l // 2
        if k <= half:
            return self.kthGrammar(n-1,k)
        else:
            return 1 - self.kthGrammar(n-1,k - half)
        