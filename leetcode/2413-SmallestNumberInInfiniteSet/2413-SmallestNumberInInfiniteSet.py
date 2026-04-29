# Last updated: 29/04/2026, 23:03:28
class SmallestInfiniteSet:

    def __init__(self):
        self.l = [i for i in range(1,1001)]
        heapq.heapify(self.l)

    def popSmallest(self) -> int:
        if len(self.l) > 0:
            return heapq.heappop(self.l)

    def addBack(self, num: int) -> None:
        if num not in self.l:
            heapq.heappush(self.l,num)
        


# Your SmallestInfiniteSet object will be instantiated and called as such:
# obj = SmallestInfiniteSet()
# param_1 = obj.popSmallest()
# obj.addBack(num)