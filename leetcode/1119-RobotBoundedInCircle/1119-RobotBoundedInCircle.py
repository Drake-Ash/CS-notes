# Last updated: 29/04/2026, 23:08:18
class Solution:
    def isRobotBounded(self, instructions: str) -> bool:
        dirs = {
            "N" : ["W","E",0,1],
            "W" : ["S","N",-1,0],
            "S" : ["E","W",0,-1],
            "E" : ["N","S",1,0]
        }
        x = 0
        y = 0
        start = 'N'

        for i in instructions:
            if i == 'G':
                x += dirs[start][2]
                y += dirs[start][3]
            elif i == 'L':
                start = dirs[start][0]
            else:
                start = dirs[start][1]
            
        # Check if the robot is back at the origin or facing any direction but north
        return (x == 0 and y == 0) or start != 'N'