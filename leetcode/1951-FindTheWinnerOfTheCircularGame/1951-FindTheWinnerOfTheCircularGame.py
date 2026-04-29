# Last updated: 29/04/2026, 23:04:45
class Solution:
    def findTheWinner(self, n: int, k: int) -> int:
        arr = [i for i in range(1,n+1)]
        def loop(arr,idx):
            if len(arr) == 1:
                return arr[0]
            
            r = (idx + k - 1) % len(arr)
            del arr[r]
            return loop(arr,r)
        return loop(arr,0)
        
        
