# Last updated: 29/04/2026, 23:04:46
class Solution:
    def arraySign(self, nums: List[int]) -> int:
        res = 1
        for i in nums:
            if i == 0:
                return 0
            elif i < 0:
                res = res * -1
        return res