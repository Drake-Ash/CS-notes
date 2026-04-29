# Last updated: 29/04/2026, 23:08:21
class Solution:
    def isArmstrong(self, n: int) -> bool:
        k = len(str(n))

        temp = n
        res = 0
        while temp > 0:
            res += (temp % 10) ** k
            temp = temp // 10
        
        return res == n