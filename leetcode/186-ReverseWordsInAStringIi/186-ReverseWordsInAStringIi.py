# Last updated: 29/04/2026, 23:11:46
class Solution:
    def reverseWords(self, s: List[str]) -> None:
        """
        Do not return anything, modify s in-place instead.
        """
        s.reverse()
        def reverse_str(s,l,r):
            while l < r:
                s[l],s[r] = s[r],s[l]
                l += 1
                r -= 1

        start = 0
        for end in range(len(s)):
            if s[end] == ' ':
                reverse_str(s,start,end-1)
                start = end+1
            elif end == len(s) - 1:
                reverse_str(s,start,end)
        
        return s