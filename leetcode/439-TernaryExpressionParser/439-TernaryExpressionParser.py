# Last updated: 29/04/2026, 23:10:15
class Solution:
    def parseTernary(self, expression: str) -> str:
        stack = []
        for i in range(len(expression)-1,-1,-1):
            ch = expression[i]
            
            if stack and stack[-1] == '?':
                stack.pop()
                true_val = stack.pop()
                stack.pop()
                false_val = stack.pop()

                if ch == 'T':
                    stack.append(true_val)
                else:
                    stack.append(false_val)
            else:
                stack.append(ch)
        return stack[0]
        

