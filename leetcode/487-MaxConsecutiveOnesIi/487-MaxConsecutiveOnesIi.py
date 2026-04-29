# Last updated: 29/04/2026, 23:10:09
class Solution:
    def findMaxConsecutiveOnes(self, nums: List[int]) -> int:
        l = 0 
        k = 0
        res = 0
        for r in range(len(nums)):
            if nums[r] == 0:
                k += 1
            if k <= 1:
                res = max(res,r - l + 1)
            while k > 1:
                if nums[l] == 0:
                    k -= 1
                l += 1
        return res