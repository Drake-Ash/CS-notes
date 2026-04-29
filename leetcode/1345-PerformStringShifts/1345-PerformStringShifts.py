# Last updated: 29/04/2026, 23:07:03
class Solution:
    def stringShift(self, s: str, shift: List[List[int]]) -> str:
        def shift_str(s,dir,k):
            if dir == 0:
                return s[k:] + s[:k]
            else:
                return s[-k:] + s[:-k]
        
        for dir,k in shift:
            s = shift_str(s,dir,k % len(s))
        
        return s