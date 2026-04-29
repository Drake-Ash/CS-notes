# Last updated: 29/04/2026, 23:12:03
from typing import List

class Solution:
    def findMissingRanges(self, nums: List[int], lower: int, upper: int) -> List[List[int]]:        
        res = []
        nums = [lower - 1] + nums + [upper + 1]
        
        for i in range(1, len(nums)):
            if nums[i] - nums[i - 1] > 1:
                start = nums[i - 1] + 1
                end = nums[i] - 1
                res.append([start, end])
        
        return res