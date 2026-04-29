# Last updated: 29/04/2026, 23:10:16
class Solution:
    def eraseOverlapIntervals(self, intervals: List[List[int]]) -> int:
        if not intervals:
            return 0

        # Step 1: Sort the intervals based on their end time
        intervals.sort(key=lambda x: x[1])
        
        # Step 2: Initialize the end time of the last added interval
        end = intervals[0][1]
        count = 0
        
        # Step 3: Iterate through the intervals starting from the second interval
        for i in range(1, len(intervals)):
            # If the current interval starts before the end of the last added interval, it overlaps
            if intervals[i][0] < end:
                count += 1
            else:
                # Update the end time to the end of the current interval
                end = intervals[i][1]
        
        return count