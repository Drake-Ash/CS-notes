# Last updated: 29/04/2026, 23:05:18
class Solution:
    def maxOperations(self, nums: List[int], k: int) -> int:
        nums.sort()
        res = 0
        l = 0
        r = len(nums) - 1

        while l < r:
            if nums[l] + nums[r] == k:
                res += 1
                l += 1
                r -= 1
            elif nums[l] + nums[r] > k:
                r -= 1
            else:
                l += 1
        return res