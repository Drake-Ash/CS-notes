# Last updated: 29/04/2026, 23:10:42
class Solution:
    def countBits(self, n: int) -> List[int]:
        res = []

        def cnt(x):
            return sum([1 for c in x if c == '1'])

        for i in range(n+1):
            x = bin(i)[2:]
            res.append(cnt(x))
            
        return res