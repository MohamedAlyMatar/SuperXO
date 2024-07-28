import 'package:bloc/bloc.dart';
import 'package:super_xo/bloc/meta_game_event.dart';
import 'package:super_xo/bloc/meta_game_state.dart';
import 'package:super_xo/repositories/game_repo.dart';

class MetaGameBloc extends Bloc<MetaGameEvent, MetaGameState> {
  final GameRepo gameRepo;

  MetaGameBloc(this.gameRepo)
      : super(MetaGameState(game: gameRepo.initialGame())) {
    on<BoxClicked>((event, emit) {
      print('Event received: $event');
      final newGame = gameRepo.makeMove(state.game, event.row, event.col);

      emit(MetaGameState(game: newGame));
      print('State updated: ${MetaGameState(game: newGame)}');
    });

    on<UpdateWinnerSymbol>((event, emit) {
      print('Event received: $event');

      final newBoard = List<List<String>>.from(state.game.board);
      newBoard[event.row][event.col] = event.winnerSymbol;

      // Check for a winner after updating the board
      final winner = gameRepo.checkWinner(newBoard);
      final newGame = state.game.copyWith(
        board: newBoard,
        isGameOver: winner != '',
        winner: winner,
      );

      emit(MetaGameState(game: newGame));
      print('State updated: ${MetaGameState(game: newGame)}');
    });

    on<ResetMetaGame>((event, emit) {
      print('Event received: $event');
      final newGame = gameRepo.resetGame();
      emit(MetaGameState(game: newGame));
      print(
          'State updated: ${MetaGameState(game: newGame)}'); // Verify state update
    });
  }
}
