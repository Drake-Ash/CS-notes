# Last updated: 29/04/2026, 23:14:36
class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        seen = {}

        for i in range(len(nums)):
            if nums[i] not in seen:
                seen[nums[i]] = i
            
            if target - nums[i] in seen and i != seen[target-nums[i]]:
                return [i,seen[target-nums[i]]]
        