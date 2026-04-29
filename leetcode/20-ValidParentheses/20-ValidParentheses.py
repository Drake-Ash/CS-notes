# Last updated: 29/04/2026, 23:14:15
class Solution:
    def isValid(self, s: str) -> bool:
        map = {
            ")" : "(",
            "}" : "{",
            "]" : "[" 
            }

        stack = []

        for i in s:
            if stack and i in map and stack[-1] == map[i]:
                stack.pop()
            else:
                stack.append(i)
        return len(stack) == 0