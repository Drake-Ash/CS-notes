# Last updated: 29/04/2026, 23:10:33
class MovingAverage:

    def __init__(self, size: int):
        self.q = deque([])
        self.size = size

    def next(self, val: int) -> float:
        self.q.appendleft(val)
        while len(self.q) > self.size:
            self.q.pop()
        return sum(self.q)/len(self.q)



# Your MovingAverage object will be instantiated and called as such:
# obj = MovingAverage(size)
# param_1 = obj.next(val)