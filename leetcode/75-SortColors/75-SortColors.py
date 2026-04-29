# Last updated: 29/04/2026, 23:13:06
class Solution:
    def sortColors(self, nums: List[int]) -> None:
        """
        Do not return anything, modify nums in-place instead.
        """
        l = 0
        r = len(nums) - 1
        k = 0
        while k <= r:
            if nums[k] == 0:
                nums[l],nums[k] = nums[k],nums[l]
                l += 1
            elif nums[k] == 2:
                nums[r],nums[k] = nums[k],nums[r]
                r -= 1
                k -= 1
            k += 1