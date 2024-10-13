class Solution {
public:
    void bfs(vector<vector<char>>& grid, int i, int j) {
        if (i < grid.size() && j < grid[0].size() && grid[i][j] == '1') {
            grid[i][j] = '2';
            bfs(grid, i, j + 1);
            bfs(grid, i + 1, j);
            bfs(grid, i, j - 1);
            bfs(grid, i - 1, j);
        }
    }

    int numIslands(vector<vector<char>>& grid) {
        int numIslandsCount = 0;
        for (int i = 0; i < grid.size(); i++) {
            for (int j = 0; j < grid[0].size(); j++) {
                if (grid[i][j] == '1') {
                    bfs(grid, i, j);
                    numIslandsCount++;
                }
            }
        }
        return numIslandsCount;
    }
};