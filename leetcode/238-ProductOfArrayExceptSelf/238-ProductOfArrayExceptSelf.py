# Last updated: 29/04/2026, 23:11:12
class Solution:
    def productExceptSelf(self, nums: List[int]) -> List[int]:
        res = [0] * len(nums) 
        pre = 1
        for i in range(len(nums)):
            temp = nums[i]
            res[i] = pre
            pre = temp * pre
        
        post = 1
        for i in range(len(nums)-1,-1,-1):
            temp = nums[i]
            res[i] = post * res[i]
            post = temp * post
        return res