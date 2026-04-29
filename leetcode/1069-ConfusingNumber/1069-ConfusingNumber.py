# Last updated: 29/04/2026, 23:08:25
class Solution:
    def confusingNumber(self, n: int) -> bool:
        
        confused_nums = {
            '0': '0',
            '1': '1',
            '2': False,
            '3': False,
            '4': False,
            '5': False,
            '6': '9',
            '7': False,
            '8': '8',
            '9': '6',
        }

        rotated_num = []
        for char in str(n)[::-1]:
            rotated_num.append(confused_nums[char])
        
        if False in rotated_num:
            return False
            
        rotated_num = int("".join(rotated_num))

        if n != rotated_num:
            return True
        
        return False