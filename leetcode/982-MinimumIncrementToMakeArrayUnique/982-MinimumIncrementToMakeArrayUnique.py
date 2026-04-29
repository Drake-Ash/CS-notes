# Last updated: 29/04/2026, 23:08:39
class Solution:
    def minIncrementForUnique(self, nums: List[int]) -> int:
        nums.sort()
        res = 0
        for i in range(1,len(nums)):
            if nums[i-1] >= nums[i]:
                diff = abs(nums[i-1] - nums[i])
                nums[i] += (diff + 1)
                res += (diff + 1)
        return res