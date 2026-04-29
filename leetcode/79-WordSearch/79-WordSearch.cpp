// Last updated: 29/04/2026, 23:12:57
class Solution {
public:
vector<vector<int>> directions;
public:
    Solution() {
        directions = {
            {1, 0},
            {0, 1},
            {-1, 0},
            {0, -1}
        };
    }

    bool exist(vector<vector<char>>& board, string word) {
        for (int i = 0; i < board.size(); i++) {
            for (int j = 0; j < board[i].size(); j++) {
                if (backtrack(board, word, i, j, 0)) return true;
            }
        }
        return false;
    }

    bool backtrack(vector<vector<char>>& board, string word, int i, int j, int pos) {
        if (pos >= word.size()) return false;
        if (word[pos] != board[i][j]) return false;
        if (pos == word.size() - 1) return true;

        char temp = board[i][j];
        board[i][j] = '.';
        int newI = i, newJ = j;

        for (int direction = 0; direction < directions.size(); direction++) {
            newI = i + directions[direction][0];
            newJ = j + directions[direction][1];

            if (newI < 0 || newI >= board.size()) continue;
            if (newJ < 0 || newJ >= board[i].size()) continue;
            if (board[newI][newJ] == '.') continue;

            if (backtrack(board, word, newI, newJ, pos + 1)) return true;
        }

        board[i][j] = temp;

        return false;
    }
};