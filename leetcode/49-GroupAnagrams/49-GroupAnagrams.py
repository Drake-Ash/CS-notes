# Last updated: 29/04/2026, 23:13:33
class Solution:
    def groupAnagrams(self, strs: List[str]) -> List[List[str]]:
        
        hash_map = defaultdict(list)

        for word in strs:
            sorted_word = sorted(word)
            hash_map[tuple(sorted_word)].append(word)
        
        return hash_map.values()