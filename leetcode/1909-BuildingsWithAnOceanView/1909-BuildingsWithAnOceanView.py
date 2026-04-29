# Last updated: 29/04/2026, 23:04:55
class Solution:
    def findBuildings(self, heights: List[int]) -> List[int]:
        stack = []
        res = []
        for i in range(len(heights)-1,-1,-1):
            if not stack or (stack and stack[-1] < heights[i]):
                res.append(i)
                stack.append(heights[i])
        return res[::-1]