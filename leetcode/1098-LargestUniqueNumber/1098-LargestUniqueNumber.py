# Last updated: 29/04/2026, 23:08:19
class Solution:
    def largestUniqueNumber(self, nums: List[int]) -> int:
        map = Counter(nums)

        res = -1

        for k,v in map.items():
            if v == 1:
                res = max(res,k)

        return res