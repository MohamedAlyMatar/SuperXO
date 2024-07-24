import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_xo/bloc/game_state.dart';
import 'package:super_xo/repositories/game_repo.dart';

class GameViewModel extends Cubit<GameState> {
  final GameRepo gameRepo;

  GameViewModel(this.gameRepo)
      : super(GameState(
            game: gameRepo.initialGame(),
            metaBoard: List.generate(3, (_) => List.filled(3, ''))));

  void makeMove(int row, int col) {
    final newGame = gameRepo.makeMove(state.game, row, col);
    emit(state.copyWith(game: newGame));
  }

  void resetGame() {
    final newGame = gameRepo.resetGame();
    emit(GameState(
        game: newGame, metaBoard: List.generate(3, (_) => List.filled(3, ''))));
  }

  void metaMoveMade(int row, int col, String winnerSymbol) {
    final newMetaBoard = List<List<String>>.from(
        state.metaBoard.map((row) => List<String>.from(row)));
    if (newMetaBoard[row][col] == '') {
      newMetaBoard[row][col] = winnerSymbol;
      final winner = checkWinner(newMetaBoard);
      emit(state.copyWith(
          metaBoard: newMetaBoard, isGameOver: winner != '', winner: winner));
    }
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
