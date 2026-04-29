# Last updated: 29/04/2026, 23:11:43
class Solution:
    def rotate(self, nums: List[int], k: int) -> None:
        """
        Do not return anything, modify nums in-place instead.
        """
        def reverse(s,l,r):
            while l < r:
                s[l],s[r] = s[r],s[l]
                l += 1
                r -= 1
        
        k = k % len(nums)
        reverse(nums,0,len(nums) - 1 - k)
        reverse(nums,len(nums) - k,len(nums)-1)
        reverse(nums,0,len(nums)-1)