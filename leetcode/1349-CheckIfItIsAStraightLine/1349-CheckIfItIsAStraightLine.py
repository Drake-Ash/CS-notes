# Last updated: 29/04/2026, 23:07:01
class Solution:
    def checkStraightLine(self, coordinates: List[List[int]]) -> bool:
        n=len(coordinates)        
        if n <= 2:
            return True
        x0, y0 = coordinates[0]
        x1, y1 = coordinates[1]
        dx = x1 - x0
        dy = y1 - y0
        
        for i in range(2, n):
            x, y = coordinates[i]
            if dx * (y - y0) != dy * (x - x0):
                return False
        
        return True