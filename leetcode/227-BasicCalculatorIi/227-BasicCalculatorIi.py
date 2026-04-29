# Last updated: 29/04/2026, 23:11:20
class Solution:
    def calculate(self, s: str) -> int:
        # Initialize a stack to store intermediate results
        stack = []
        # Initialize current number and operation variables
        current_number = 0
        operation = '+'
        s = s.replace(" ", "")  # Remove any spaces in the string

        # Iterate over the string
        for i, char in enumerate(s):
            if char.isdigit():
                current_number = current_number * 10 + int(char)
            
            if not char.isdigit() or i == len(s) - 1:
                if operation == '+':
                    stack.append(current_number)
                elif operation == '-':
                    stack.append(-current_number)
                elif operation == '*':
                    stack[-1] = stack[-1] * current_number
                elif operation == '/':
                    # Perform integer division (truncated towards zero)
                    stack[-1] = int(stack[-1] / current_number)
                
                # Update operation and reset current number
                operation = char
                current_number = 0
        
        # The result is the sum of all values in the stack
        return sum(stack)