# Last updated: 29/04/2026, 23:12:26
class Solution:
    def longestConsecutive(self, nums: List[int]) -> int:
        seen = set(nums)
        res = 0

        for n in nums:
            if (n-1) not in seen:
                cnt = 0
                while (n+cnt) in seen:
                    cnt += 1
                res = max(res,cnt)
        return res