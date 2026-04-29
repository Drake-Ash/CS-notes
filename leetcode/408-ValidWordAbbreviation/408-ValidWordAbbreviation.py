# Last updated: 29/04/2026, 23:10:22
class Solution:
    def validWordAbbreviation(self, word: str, abbr: str) -> bool:
        n = len(word)
        m = len(abbr)
        i = 0
        j = 0

        while i < n and j < m:
            if abbr[j].isdigit():
                if abbr[j] == '0':  # leading zero is invalid
                    return False
                num = 0
                while j < m and abbr[j].isdigit():
                    num = num * 10 + int(abbr[j])
                    j += 1
                i += num
            else:
                if word[i] != abbr[j]:
                    return False
                i += 1
                j += 1

        return i == n and j == m