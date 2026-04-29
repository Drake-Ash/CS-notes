# Last updated: 29/04/2026, 23:10:13
class Solution:
    def compress(self, chars: List[str]) -> int:
        if len(chars) <= 1:
            return len(chars)
        i = j = 0

        while i < len(chars):
            cnt = 1
            while i < len(chars) - 1 and chars[i] == chars[i+1]:
                cnt += 1
                i += 1

            chars[j] = chars[i]
            j += 1

            if cnt > 1:
                for k in str(cnt):
                    chars[j] = k
                    j += 1
            i += 1
        return j
            

