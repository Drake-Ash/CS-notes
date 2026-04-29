# Last updated: 29/04/2026, 23:09:16
class Solution:
    def judgeSquareSum(self, c: int) -> bool:
        roots = set()

        for i in range(0,int(math.sqrt(c))+1):
            roots.add(i*i)

        a = 0
        while a * a <= c:
            target = c - (a * a)
            if target in roots:
                return True
            a += 1
        return False
