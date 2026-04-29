# Last updated: 29/04/2026, 23:10:58
from collections import Counter

class Solution:
    def canPermutePalindrome(self, s: str) -> bool:
        char_count = Counter(s)
        odd_count = sum(1 for count in char_count.values() if count % 2 != 0)
        return odd_count <= 1