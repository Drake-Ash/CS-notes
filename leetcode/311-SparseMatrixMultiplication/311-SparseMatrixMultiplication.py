# Last updated: 29/04/2026, 23:10:46
from typing import List

class Solution:
    def multiply(self, mat1: List[List[int]], mat2: List[List[int]]) -> List[List[int]]:
        m, k = len(mat1), len(mat1[0])
        k2, n = len(mat2), len(mat2[0])
        
        # The result matrix will have dimensions m x n
        result = [[0] * n for _ in range(m)]
        
        # Loop over the first matrix
        for i in range(m):
            for j in range(k):
                if mat1[i][j] != 0:  # Skip zeros in mat1
                    # Multiply the non-zero element in mat1 with the appropriate row in mat2
                    for l in range(n):
                        if mat2[j][l] != 0:  # Skip zeros in mat2
                            result[i][l] += mat1[i][j] * mat2[j][l]
        
        return result