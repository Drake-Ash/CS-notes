# Last updated: 29/04/2026, 23:04:59
class Solution:
    def mergeAlternately(self, word1: str, word2: str) -> str:
        minLength = min(len(word1), len(word2))

        result = ''

        for i in range(minLength):
            result = result + word1[i] + word2[i]

        if len(word1) > minLength:
            result += word1[minLength:]

        if len(word2) > minLength:
            result += word2[minLength:]

        return result
