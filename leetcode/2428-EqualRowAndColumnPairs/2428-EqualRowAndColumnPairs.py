# Last updated: 29/04/2026, 23:03:26
class Solution:
    def equalPairs(self, grid: List[List[int]]) -> int:
        row_count = defaultdict(int)
        col_count = defaultdict(int)
        
        # Count rows
        for row in grid:
            row_count[tuple(row)] += 1
        
        # Count columns
        n = len(grid)
        for c in range(n):
            col = tuple(grid[r][c] for r in range(n))
            col_count[col] += 1
        
        # Calculate matching pairs
        res = 0
        for row in row_count:
            if row in col_count:
                res += row_count[row] * col_count[row]
        
        return res