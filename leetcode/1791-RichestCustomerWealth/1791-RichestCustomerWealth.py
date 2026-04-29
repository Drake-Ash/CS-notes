# Last updated: 29/04/2026, 23:05:21
class Solution:
    def maximumWealth(self, accounts: List[List[int]]) -> int:
        max_wealth = 0
        
        for i in accounts:
            max_wealth = max(max_wealth,sum(i))

        return max_wealth
