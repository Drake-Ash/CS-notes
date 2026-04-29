# Last updated: 29/04/2026, 23:08:56
class Solution:
    def anagramMappings(self, nums1: List[int], nums2: List[int]) -> List[int]:
        idx = defaultdict(int)

        for i,j in enumerate(nums2):
            idx[j] = i

        res = []

        for i in nums1:
            res.append(idx[i])

        return res