# Last updated: 29/04/2026, 23:09:15
class Solution:
    def findMaxAverage(self, nums: List[int], k: int) -> float:
        curr = sum(nums[:k])
        res = curr
        for i in range(k,len(nums)):
            curr = curr + nums[i] - nums[i-k]
            res = max(res,curr)
        return res/k