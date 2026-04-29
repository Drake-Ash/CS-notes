# Last updated: 29/04/2026, 23:11:06
class Solution:
    def isStrobogrammatic(self, num: str) -> bool:
        
        MAP = {'0': '0',
               '1': '1',
              '6': '9',
              '8': '8',
              '9': '6'}
        
        n = len(num)
        
        left, right = 0, n-1
        
        while left < right:
            
            if num[left] not in MAP or num[right] not in MAP:
                return False
            
            if num[right] != MAP[num[left]]:
                return False
            
            left += 1
            right -= 1
        
        # if n is odd
        
        if n % 2 == 1:
            if num[left] not in ['0', '1', '8']:
                return False
        
        return True
        