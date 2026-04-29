# Last updated: 29/04/2026, 23:09:05
class Solution:
    def asteroidCollision(self, asteroids: List[int]) -> List[int]:
        stack = []

        for i in asteroids:
            while stack and stack[-1] > 0 and i < 0:
                if abs(stack[-1]) < abs(i):
                    stack.pop()
                    continue
                elif abs(stack[-1]) == abs(i):
                    stack.pop()
                break
            else:
                stack.append(i)
        return stack
