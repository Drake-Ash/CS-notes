# Last updated: 29/04/2026, 23:09:07
class Solution:
    def pivotIndex(self, nums: List[int]) -> int:
        pre = 0
        post = sum(nums)
        for i in range(len(nums)):
            if pre == post - nums[i]:
                return i
            pre += nums[i]
            post -= nums[i]
        return -1