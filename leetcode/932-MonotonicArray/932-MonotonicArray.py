# Last updated: 29/04/2026, 23:08:44
class Solution:
    def isMonotonic(self, nums: List[int]) -> bool:
        if nums[0] < nums[-1]:
            inc = True
        else:
            inc = False

        for i in range(1,len(nums)):
            if inc and nums[i] < nums[i-1]:
                return False
            elif not inc and nums[i] > nums[i-1]:
                return False
        return True
        
