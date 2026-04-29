# Last updated: 29/04/2026, 23:07:36
class Solution:
    def relativeSortArray(self, arr1: List[int], arr2: List[int]) -> List[int]:
        res = []

        cnt_map = Counter(arr1)

        for i in range(len(arr2)):
            for j in range(cnt_map[arr2[i]]):
                arr1.remove(arr2[i])
                res.append(arr2[i])
        arr1.sort()
        return res + arr1