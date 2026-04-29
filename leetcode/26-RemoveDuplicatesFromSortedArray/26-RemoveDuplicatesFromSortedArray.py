# Last updated: 29/04/2026, 23:14:03
class Solution:
    def removeDuplicates(self, nums: List[int]) -> int:
        l = 0
        r = 0
        while l < len(nums) and r < len(nums):
            if nums[l] != nums[r]:
                nums[l+1] = nums[r]
                l += 1
            r += 1
        return l + 1