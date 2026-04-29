# Last updated: 29/04/2026, 23:13:40
class Solution:
    def permute(self, nums: List[int]) -> List[List[int]]:
        res = []
        def perm(i):
            if i == len(nums) - 1:
                res.append(nums[:])
                return 
            for j in range(i,len(nums)):
                nums[i],nums[j] = nums[j],nums[i]
                perm(i+1)
                nums[i],nums[j] = nums[j],nums[i]
        perm(0)
        return res
        
