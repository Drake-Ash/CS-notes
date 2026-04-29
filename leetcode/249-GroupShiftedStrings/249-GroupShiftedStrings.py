# Last updated: 29/04/2026, 23:11:05
from collections import defaultdict
from typing import List

class Solution:
    def groupStrings(self, strings: List[str]) -> List[List[str]]:
        shift_map = defaultdict(list)

        for s in strings:
            # Calculate the difference between consecutive characters
            key = []
            for i in range(1, len(s)):
                # Calculate the circular difference
                diff = (ord(s[i]) - ord(s[i - 1])) % 26
                key.append(diff)
            # Convert the list to a tuple to use as a hashable key
            shift_map[tuple(key)].append(s)

        # Return the grouped strings as a list of lists
        return list(shift_map.values())