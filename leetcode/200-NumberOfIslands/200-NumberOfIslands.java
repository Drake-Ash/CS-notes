// Last updated: 29/04/2026, 23:11:45
class Solution {
    private void dfs(char[][] grid, int r, int c) {
        if(r<0 || c<0 || r>=grid.length || c>=grid[0].length ||  grid[r][c]=='0') {
            return;
        }
        grid[r][c] = '0';
        // visited[r][c] = true;
        dfs(grid, r+1, c);
        dfs(grid, r-1 , c);
        dfs(grid, r, c+1);
        dfs(grid, r, c-1);
    }

    public int numIslands(char[][] grid) {
        int nRows = grid.length;
        int nCols = grid[0].length;
        int nIslands = 0;
        if(nRows==0) {
            return 0;
        }
        for(int i=0; i<nRows; i++) {
            for(int j=0; j<nCols; j++) {
                if(grid[i][j]=='1'){
                    dfs(grid, i, j);
                    nIslands+=1;
                }
            }
        }
        return nIslands;
    }
}