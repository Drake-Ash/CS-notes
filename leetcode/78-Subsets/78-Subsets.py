# Last updated: 29/04/2026, 23:13:00
class Solution:
    def subsets(self, nums: List[int]) -> List[List[int]]:
        res = []
        def back(start,path):
            res.append(path)

            for i in range(start,len(nums)):
                back(i+1,path + [nums[i]])
        back(0,[])
        return res
