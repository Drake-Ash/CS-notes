# Last updated: 29/04/2026, 23:06:58
class FirstUnique:
    def __init__(self, nums: List[int]):
        self.hm = defaultdict(int)
        self.q = collections.deque()
        for n in nums:
            self.q.append(n)
            self.hm[n]+=1

    def showFirstUnique(self) -> int:
        while self.q:
            first = self.q[0]
            if self.hm[first] < 2:
                return first
            else:
                self.q.popleft()
        return -1

    def add(self, value: int) -> None:
        self.q.append(value)
        self.hm[value]+=1