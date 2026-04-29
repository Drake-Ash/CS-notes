# Last updated: 29/04/2026, 23:12:30
class Solution:
    def maxProfit(self, prices: List[int]) -> int:
        res = 0
        for i in range(1,len(prices)):
            if prices[i-1] < prices[i]:
                res += (prices[i]-prices[i-1])
        return res