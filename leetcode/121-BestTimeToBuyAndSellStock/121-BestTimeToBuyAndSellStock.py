# Last updated: 29/04/2026, 23:12:40
class Solution:
    def maxProfit(self, prices: List[int]) -> int:
        l = 0
        res = 0
        for r in range(len(prices)):
            if prices[l] < prices[r]:
                res = max(res,prices[r]-prices[l])
            else:
                l = r
        return res