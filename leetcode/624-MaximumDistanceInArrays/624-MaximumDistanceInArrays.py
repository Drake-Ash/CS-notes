# Last updated: 29/04/2026, 23:09:22
class Solution:
    def maxDistance(self, arrays: List[List[int]]) -> int:
        # Initialize the minimum and maximum values with the first array's values
        min_val = arrays[0][0]
        max_val = arrays[0][-1]
        max_distance = 0

        # Iterate through the rest of the arrays
        for i in range(1, len(arrays)):
            current_min = arrays[i][0]
            current_max = arrays[i][-1]

            # Calculate the distance using the current array's values with previously recorded min and max
            max_distance = max(max_distance, abs(current_max - min_val), abs(max_val - current_min))

            # Update the global min and max for subsequent arrays
            min_val = min(min_val, current_min)
            max_val = max(max_val, current_max)

        return max_distance