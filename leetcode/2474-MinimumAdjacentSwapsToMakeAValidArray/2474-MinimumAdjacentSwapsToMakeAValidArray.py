# Last updated: 29/04/2026, 23:03:14
class Solution:
    def minimumSwaps(self, nums: List[int]) -> int:
        n = len(nums)
        minIndex = maxIndex = 0
        for i in range(n):
            if nums[i] >= nums[maxIndex]:
                maxIndex = i
            if nums[i] < nums[minIndex]:
                minIndex = i

        resp = minIndex + n - 1 - maxIndex
        return resp - 1 if maxIndex < minIndex else resp
