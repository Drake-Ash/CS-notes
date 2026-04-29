# Last updated: 29/04/2026, 23:11:03
class Solution:
    def canAttendMeetings(self, intervals: List[List[int]]) -> bool:
        intervals.sort()
        for i in range(1,len(intervals)):
            prev = intervals[i-1]
            curr = intervals[i]

            if curr[0] < prev[1]:
                return False

        return True