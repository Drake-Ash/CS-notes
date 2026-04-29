# Last updated: 29/04/2026, 23:08:24
class Solution:
    def highFive(self, items: List[List[int]]) -> List[List[int]]:
        map = {}

        for id,marks in items:
            if id not in map:
                map[id] = [marks]
            else:
                map[id].append(marks)

        res = []

        for k,v in map.items():
            res.append([k,sum(sorted(v,reverse=True)[:5])//5])
        
        return sorted(res)