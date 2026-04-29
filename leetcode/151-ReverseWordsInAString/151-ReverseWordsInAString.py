# Last updated: 29/04/2026, 23:12:13
class Solution:
    def reverseWords(self, s: str) -> str:
        def rev(word):
            l = 0
            r = len(word) - 1
            while l < r:
                word[l],word[r] = word[r],word[l]
                l += 1
                r -= 1
            return " ".join(word)
        
        res = []
        i = 0

        while i < len(s):
            while i < len(s) and s[i] == " ":
                i += 1
            if i >= len(s):
                break
            temp = ""
            while i < len(s) and s[i] != " ":
                temp += s[i]
                i += 1
            res.append(temp)

        return rev(res)