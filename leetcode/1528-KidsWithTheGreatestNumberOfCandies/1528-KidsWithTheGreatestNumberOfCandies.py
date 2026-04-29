# Last updated: 29/04/2026, 23:06:21
class Solution:
    def kidsWithCandies(self, candies: List[int], extraCandies: int) -> List[bool]:
        maxCandy = max(candies)
        result = []
        for i in range(len(candies)):
            result.append(True if candies[i] + extraCandies >= maxCandy else False)
        return result