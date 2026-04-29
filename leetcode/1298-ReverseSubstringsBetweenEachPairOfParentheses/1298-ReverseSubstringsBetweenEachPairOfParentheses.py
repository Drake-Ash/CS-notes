# Last updated: 29/04/2026, 23:07:16
class Solution:
    def reverseParentheses(self, s: str) -> str:
        stack = []
        for i in s:
            if i != ')':
                stack.append(i)
            else:
                temp = []
                while stack[-1] != '(':
                    temp.append(stack.pop())
                stack.pop()
                stack.extend(temp)
        return ''.join(stack)