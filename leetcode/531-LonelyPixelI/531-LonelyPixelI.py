# Last updated: 29/04/2026, 23:10:07
class Solution:
    def findLonelyPixel(self, picture: List[List[str]]) -> int:
        r = [0 for i in range(len(picture))]
        c = [0 for i in range(len(picture[0]))]

        for i in range(len(picture)):
            for j in range(len(picture[0])):
                if picture[i][j] == 'B':
                    r[i] += 1
                    c[j] += 1
        
        lonely_pixel_count = 0
        for i in range(len(picture)):
            for j in range(len(picture[0])):
                if picture[i][j] == 'B' and r[i] == 1 and c[j] == 1:
                    lonely_pixel_count += 1

        return lonely_pixel_count