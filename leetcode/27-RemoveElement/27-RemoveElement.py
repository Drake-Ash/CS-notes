# Last updated: 29/04/2026, 23:14:00
class Solution:
    def removeElement(self, nums: List[int], val: int) -> int:
        l = 0
        r = 0
        while l < len(nums) and r < len(nums):
            if nums[r] != val:
                nums[l],nums[r] = nums[r],nums[l]
                l += 1
            r += 1
        return l