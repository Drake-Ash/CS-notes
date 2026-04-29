# Last updated: 29/04/2026, 23:06:48
class Solution:
    def tictactoe(self, moves: List[List[int]]) -> str:
        ruleBook = [
        [[0, 0], [1, 1], [2, 2]],
        [[0, 0], [0, 1], [0, 2]],
        [[1, 0], [1, 1], [1, 2]],
        [[2, 0], [2, 1], [2, 2]],
        [[0, 0], [1, 0], [2, 0]],
        [[0, 1], [1, 1], [2, 1]],
        [[0, 2], [1, 2], [2, 2]],
        [[0,2], [1, 1], [2, 0]] ]

        player1 = []
        player2 = []
        for i in range(len(moves)):
            if i % 2 == 0:
                player1.append(moves[i])
            else:
                player2.append(moves[i])
        def checkWinner(playerMoves):
            for possibleWin in ruleBook:
                if all(moves in playerMoves for moves in possibleWin):  
                    return True
            return False

        if checkWinner(player1):
            return "A"
        elif checkWinner(player2):
            return "B"
        else:
            if len(moves) < 9:
                return "Pending"
            return "Draw"