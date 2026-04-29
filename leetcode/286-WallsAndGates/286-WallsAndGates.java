// Last updated: 29/04/2026, 23:10:49
class Solution {
    private int WALL = -1;
    private int GATE = 0;
    private int EMPTY_ROOM = Integer.MAX_VALUE;

    private List<int[]> DIRECTIONS = Arrays.asList(
            new int[]{0, 1},
            new int[]{0, -1},
            new int[]{1, 0},
            new int[]{-1, 0}
    );

    private boolean isGate(int val) {
        return val == GATE;
    }

    private boolean isValidCell(int[][] rooms, int row, int col) {
        int rowCount = rooms.length;
        int colCount = rooms[0].length;
        return row < 0 || col < 0 || row >= rowCount || col >= colCount || rooms[row][col] != EMPTY_ROOM;

    }

    public void bfs(int[][] rooms, Queue<int[]> queue) {
        while (!queue.isEmpty()) {
            int[] currQueueElement = queue.poll();
            int r = currQueueElement[0];
            int c = currQueueElement[1];
            for(int[] dir: DIRECTIONS) {
                int nr = r + dir[0];
                int nc = c + dir[1];
                if(isValidCell(rooms, nr, nc)) {
                    continue;
                }
                rooms[nr][nc] = rooms[r][c] + 1;
                queue.add(new int[] {nr, nc});
            }
        }
    }

    public void wallsAndGates(int[][] rooms) {
        if (rooms.length == 0) {
            return;
        }
        Queue<int[]> queue = new LinkedList<>();
        for (int i = 0; i < rooms.length; i++) {
            for (int j = 0; j < rooms[0].length; j++) {
                if (isGate(rooms[i][j])) {
                    queue.add(new int[] {i, j});
                }
            }
        }
        bfs(rooms, queue);
    }
}