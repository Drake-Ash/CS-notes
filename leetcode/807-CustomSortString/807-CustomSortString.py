# Last updated: 29/04/2026, 23:08:52
class Solution:
    def customSortString(self, order: str, s: str) -> str:
        order_map = {}
        start = 0
        for i in order:
            order_map[i] = start
            start += 1
        
        res = []

        for i in s:
            if i in order_map:
                res.append([i,order_map[i]])
            else:
                res.append([i,inf])

        res.sort(key = lambda x : x[1])
        
        return "".join([k for k,v in res])