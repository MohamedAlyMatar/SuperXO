import 'package:super_xo/models/game_model.dart';

class GameRepo {
  GameModel initialGame() {
    return GameModel(
      board: List.generate(3, (_) => List.filled(3, '')),
      currentPlayer: 'X',
    );
  }

  GameModel makeMove(GameModel game, int row, int col) {
    final newBoard = List<List<String>>.from(
        game.board.map((row) => List<String>.from(row)));
    if (newBoard[row][col] == '' && !game.isGameOver) {
      newBoard[row][col] = game.currentPlayer;
      final winner = checkWinner(newBoard);
      return game.copyWith(
        board: newBoard,
        currentPlayer: game.currentPlayer == 'X' ? 'O' : 'X',
        isGameOver: winner != '',
        winner: winner,
      );
    }
    return game;
  }

  GameModel resetGame() {
    return GameModel(
      board: List.generate(3, (_) => List.filled(3, '')),
      currentPlayer: 'X',
    );
  }

  String checkWinner(List<List<String>> board) {
    // Check rows
    for (int i = 0; i < 3; i++) {
      if (board[i][0] == board[i][1] &&
          board[i][1] == board[i][2] &&
          board[i][0] != '') {
        return board[i][0];
      }
    }
    // Check columns
    for (int i = 0; i < 3; i++) {
      if (board[0][i] == board[1][i] &&
          board[1][i] == board[2][i] &&
          board[0][i] != '') {
        return board[0][i];
      }
    }
    // Check diagonals
    if (board[0][0] == board[1][1] &&
        board[1][1] == board[2][2] &&
        board[0][0] != '') {
      return board[0][0];
    }
    if (board[0][2] == board[1][1] &&
        board[1][1] == board[2][0] &&
        board[0][2] != '') {
      return board[0][2];
    }
    // No winner
    return '';
  }
}
