# Last updated: 29/04/2026, 23:05:11
class Solution:
    def largestAltitude(self, gain: List[int]) -> int:
        res = [0]
        for i in gain:
            res.append(res[-1]+i)
        return max(res)