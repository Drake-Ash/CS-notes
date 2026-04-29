# Last updated: 29/04/2026, 23:06:57
class Solution:
    def minRemoveToMakeValid(self, s: str) -> str:
        cnt = 0
        stack = []
        for i in s:
            if i == "(":
                stack.append(i)
                cnt += 1
            elif i == ")" and cnt > 0:
                stack.append(i)
                cnt -= 1
            elif i != ")":
                stack.append(i)

        res = []

        for i in stack[::-1]:
            if i == "(" and cnt > 0:
                cnt -= 1
            else:
                res.append(i)
        return "".join(res[::-1])
                