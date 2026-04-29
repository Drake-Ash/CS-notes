# Last updated: 29/04/2026, 23:14:25
class Solution:
    def isPalindrome(self, x: int) -> bool:
        if x < 0:
            return False
        else:
            temp = x
            res = 0
            while temp > 0:
                rem = temp % 10
                res = res * 10 + rem
                temp = temp // 10
            return res == x