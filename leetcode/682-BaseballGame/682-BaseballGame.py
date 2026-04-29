# Last updated: 29/04/2026, 23:09:11
class Solution:
    def calPoints(self, operations: List[str]) -> int:

        output = list()

        for char in operations:
            if char == "C":
                output.pop()

            elif char == "D":
                output.append(output[-1] * 2 )

            elif char == "+":
                output.append(output[-1] + output[-2])

            else:
                output.append(int(char))

        return sum(output)  
        