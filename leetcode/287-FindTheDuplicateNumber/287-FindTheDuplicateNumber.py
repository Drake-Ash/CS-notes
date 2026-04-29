# Last updated: 29/04/2026, 23:10:51
class Solution:
    def findDuplicate(self, nums: List[int]) -> int:
        cnt = Counter(nums)

        for k,v in cnt.items():
            if v > 1:
                return k