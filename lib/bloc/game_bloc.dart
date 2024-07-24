import 'package:bloc/bloc.dart';
import 'package:super_xo/bloc/game_event.dart';
import 'package:super_xo/bloc/game_state.dart';
import 'package:super_xo/repositories/game_repo.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  final GameRepo gameRepo;

  GameBloc(this.gameRepo)
      : super(GameState(
            game: gameRepo.initialGame(),
            metaBoard: List.generate(3, (_) => List.filled(3, '')))) {
    on<MoveMade>((event, emit) {
      final newGame = gameRepo.makeMove(state.game, event.row, event.col);
      emit(state.copyWith(game: newGame));
    });

    on<MetaMoveMade>((event, emit) {
      final newMetaBoard = List<List<String>>.from(
          state.metaBoard.map((row) => List<String>.from(row)));
      if (newMetaBoard[event.row][event.col] == '') {
        newMetaBoard[event.row][event.col] = event.winnerSymbol;
        final winner = checkWinner(newMetaBoard);
        emit(state.copyWith(
            metaBoard: newMetaBoard, isGameOver: winner != '', winner: winner));
      }
    });

    on<ResetGame>((event, emit) {
      final newGame = gameRepo.resetGame();
      emit(GameState(
          game: newGame,
          metaBoard: List.generate(3, (_) => List.filled(3, ''))));
    });
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
