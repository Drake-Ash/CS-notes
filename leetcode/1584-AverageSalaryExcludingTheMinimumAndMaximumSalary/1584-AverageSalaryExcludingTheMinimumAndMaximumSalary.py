# Last updated: 29/04/2026, 23:06:07
class Solution:
    def average(self, salary: List[int]) -> float:
        # Sort the list
        sortedSalary = sorted(salary)

        # Create a window excluding the lowest and highest
        newSalary = sortedSalary[1:-1]

        # Return calculated mean of the new list
        return mean(newSalary)

        