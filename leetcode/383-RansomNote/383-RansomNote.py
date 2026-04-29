# Last updated: 29/04/2026, 23:10:28
class Solution:
    def canConstruct(self, ransomNote: str, magazine: str) -> bool:
        map = Counter(magazine)

        for i in ransomNote:
            if i not in map:
                return False
            else:
                if map[i] > 0:
                    map[i] -= 1
                else:
                    return False
        return True