# Last updated: 29/04/2026, 23:07:56
class Solution:
    def minAvailableDuration(self, slots1: List[List[int]], slots2: List[List[int]], duration: int) -> List[int]:
        s1, s2 = 0, 0
        res = []
        slots1.sort(key = lambda i:i[0])
        slots2.sort(key = lambda i:i[0])

        while s1 < len(slots1) and s2 < len(slots2):
            start = max(slots1[s1][0], slots2[s2][0])
            end = min(slots1[s1][1], slots2[s2][1])

            adjustedStart = start + duration

            if adjustedStart <= end:
                res = [start, adjustedStart]
                break

            if slots1[s1][1] < slots2[s2][1]:
                s1 += 1

            else:
                s2 += 1

        return res