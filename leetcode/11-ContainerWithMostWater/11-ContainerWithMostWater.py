# Last updated: 29/04/2026, 23:14:23
class Solution:
    def maxArea(self, height: List[int]) -> int:
        l = 0
        r = len(height) - 1

        res = 0

        while l < r:
            if height[l] < height[r]:
                res = max(res,(r-l) * height[l])
                l += 1
            else:
                res = max(res,(r-l) * height[r])
                r -= 1
        return res