# Last updated: 29/04/2026, 23:05:58
class Solution:
    def canMakeArithmeticProgression(self, arr: List[int]) -> bool:
        arr.sort()
        diff = arr[1] - arr[0]
        for i in range(2,len(arr)):
            if diff != arr[i] - arr[i-1]:
                return False

        return True
            