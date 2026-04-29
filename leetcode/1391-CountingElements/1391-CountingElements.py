# Last updated: 29/04/2026, 23:06:52
class Solution:
    def countElements(self, arr: List[int]) -> int:
        cnt = 0
        for i in arr:
            if i + 1 in arr:
                cnt += 1
        return cnt