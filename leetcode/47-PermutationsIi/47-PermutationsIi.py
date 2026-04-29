# Last updated: 29/04/2026, 23:13:35
class Solution:
    def permuteUnique(self, nums: List[int]) -> List[List[int]]:
        res = []
        def perm(i):
            if i == len(nums) - 1:
                res.append(nums[:])
                return 
            seen = set()
            for j in range(i,len(nums)):
                if nums[j] not in seen:
                    seen.add(nums[j])
                    nums[i],nums[j] = nums[j],nums[i]
                    perm(i+1)
                    nums[i],nums[j] = nums[j],nums[i]
        perm(0)
        return res