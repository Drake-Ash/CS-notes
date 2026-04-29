# Last updated: 29/04/2026, 23:10:26
class Solution:
    def findTheDifference(self, s: str, t: str) -> str:
        s_tot = t_tot = 0

        for i in s:
            s_tot += ord(i)
        
        for i in t:
            t_tot += ord(i)

        return chr(t_tot - s_tot)
