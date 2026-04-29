# Last updated: 29/04/2026, 23:09:09
from typing import List

class Solution:
    def candyCrush(self, board: List[List[int]]) -> List[List[int]]:
        m, n = len(board), len(board[0])
        
        while True:
            crush = False
            # Mark the candies to be crushed
            to_crush = [[False] * n for _ in range(m)]
            
            # Mark horizontal crushes
            for i in range(m):
                for j in range(n - 2):
                    if board[i][j] != 0 and board[i][j] == board[i][j + 1] == board[i][j + 2]:
                        to_crush[i][j] = to_crush[i][j + 1] = to_crush[i][j + 2] = True
                        crush = True
            
            # Mark vertical crushes
            for i in range(m - 2):
                for j in range(n):
                    if board[i][j] != 0 and board[i][j] == board[i + 1][j] == board[i + 2][j]:
                        to_crush[i][j] = to_crush[i + 1][j] = to_crush[i + 2][j] = True
                        crush = True
            
            # If no candies to crush, return the board
            if not crush:
                break
            
            # Crush candies
            for i in range(m):
                for j in range(n):
                    if to_crush[i][j]:
                        board[i][j] = 0
            
            # Drop the candies
            for j in range(n):
                write_row = m - 1
                for i in range(m - 1, -1, -1):
                    if board[i][j] != 0:
                        board[write_row][j] = board[i][j]
                        write_row -= 1
                for i in range(write_row, -1, -1):
                    board[i][j] = 0
        
        return board