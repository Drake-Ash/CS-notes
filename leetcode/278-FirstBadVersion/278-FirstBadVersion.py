# Last updated: 29/04/2026, 23:10:56
# The isBadVersion API is already defined for you.
# def isBadVersion(version: int) -> bool:

class Solution:
    def firstBadVersion(self, n: int) -> int:
        l = 0
        r = n - 1

        while l <= r:
            mid = (l + r) // 2

            if isBadVersion(mid):
                r = mid - 1
            elif isBadVersion(mid) is False:
                l = mid + 1
            
        return l 
        