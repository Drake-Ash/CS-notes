# Last updated: 29/04/2026, 23:10:24
class Solution:
    def decodeString(self, s: str) -> str:
        stack = []
        
        for i in s:
            if i != ']':
                stack.append(i)
            else:
                temp = ''
                while stack[-1] != '[':
                    temp = stack.pop() + temp  # Correct order of characters
                stack.pop()  # Remove the '['
                n = ''
                while stack and stack[-1].isdigit():
                    n = stack.pop() + n
                stack.append(temp * int(n))  # Repeat temp n times and append to stack
        
        return ''.join(stack)