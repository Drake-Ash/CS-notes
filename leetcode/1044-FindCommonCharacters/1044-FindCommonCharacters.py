# Last updated: 29/04/2026, 23:08:29
class Solution:
    def commonChars(self, words: List[str]) -> List[str]:
        # Start with the frequency of each character in the first word
        common_freq = [float('inf')] * 26
        
        for word in words:
            current_freq = [0] * 26
            for ch in word:
                current_freq[ord(ch) - ord('a')] += 1
            
            for i in range(26):
                common_freq[i] = min(common_freq[i], current_freq[i])
        
        res = []
        for i in range(26):
            res.extend([chr(i + ord('a'))] * common_freq[i])
        
        return res