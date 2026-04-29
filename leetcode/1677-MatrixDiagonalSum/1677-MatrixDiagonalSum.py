# Last updated: 29/04/2026, 23:05:45
class Solution:
    def diagonalSum(self, mat: List[List[int]]) -> int:
        c = 0
        res = 0
        size = len(mat)
        for r in range(size):
            res += mat[r][c] + mat[r][size-c-1]
            c += 1

        if size % 2 != 0:
            res -= mat[size//2][size//2]
            return res
        else:
            return res
            