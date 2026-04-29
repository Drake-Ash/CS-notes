# Last updated: 29/04/2026, 23:13:11
class Solution:
    def climbStairs(self, n: int) -> int:
        dp = [0, 1]
        for i in range(n):
            dp[i%2] = sum(dp)
        return dp[(n-1)%2]