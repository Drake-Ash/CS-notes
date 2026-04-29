# Last updated: 29/04/2026, 23:12:02
class Solution:
    def majorityElement(self, nums: List[int]) -> int:
        cnt = 0
        temp = nums[0]
        
        for i in nums:
            if cnt == 0:
                temp = i
            if i == temp:
                cnt += 1
            else:
                cnt -= 1
        
        return temp