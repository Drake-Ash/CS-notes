# Last updated: 29/04/2026, 23:08:27
class Solution:
    def shortestWay(self, source: str, target: str) -> int:
        source_set = set(source)
        
        # Step 1: Check if target is possible
        for char in target:
            if char not in source_set:
                return -1
        
        subsequence_count = 0
        target_index = 0
        
        while target_index < len(target):
            subsequence_count += 1
            source_index = 0
            
            # Step 2: Try to match the target with subsequence in source
            while target_index < len(target) and source_index < len(source):
                if target[target_index] == source[source_index]:
                    target_index += 1
                source_index += 1
        
        return subsequence_count