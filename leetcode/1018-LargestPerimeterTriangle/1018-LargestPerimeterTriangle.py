# Last updated: 29/04/2026, 23:08:35
class Solution:
    def largestPerimeter(self, nums: List[int]) -> int:
        nums.sort(reverse=True)
        res = 0
        for i in range(len(nums)-2):
            side1,side2,side3 = nums[i],nums[i+1],nums[i+2]
            if side1 + side2 > side3 and side2 + side3 > side1 and side3 + side1 > side2:
                res = max(res,side1+side2+side3)
        return res
