# Last updated: 29/04/2026, 23:13:15
class Solution:
    def plusOne(self, digits: List[int]) -> List[int]:
        n = len(digits)
        
        for i in range(n - 1, -1, -1):
            if digits[i] < 9:
                digits[i] += 1
                return digits
            digits[i] = 0
        
        return [1] + digits