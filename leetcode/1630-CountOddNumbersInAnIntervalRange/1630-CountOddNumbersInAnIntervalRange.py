# Last updated: 29/04/2026, 23:05:56
class Solution:
    def countOdds(self, low: int, high: int) -> int:
        if low==high:
            if low%2==1: return 1
            else: return 0
        if low%2==0: low+=1
        if high%2==0: high-=1
        return (high-low)//2+1