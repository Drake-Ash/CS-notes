# Last updated: 29/04/2026, 23:08:08
class Solution:
    def smallestCommonElement(self, mat: List[List[int]]) -> int:
        map = defaultdict(int)

        for i in mat:
            for j in i:
                map[j] += 1
        
        res = inf
        for k,v in map.items():
            if v % len(mat) == 0:
                res = min(res,k)
        if res == inf:
            return -1
        else:
            return res