# Last updated: 29/04/2026, 23:07:42
class Solution:
    def removeInterval(self, intervals: List[List[int]], toBeRemoved: List[int]) -> List[List[int]]:
        res = []
        s,e = toBeRemoved

        for start,end in intervals:
            if start < s:
                res.append([start,min(end,s)])
            if end > e:
                res.append([max(start,e),end])
        
        return res