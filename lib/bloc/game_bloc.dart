import 'package:bloc/bloc.dart';
import 'package:super_xo/bloc/game_event.dart';
import 'package:super_xo/bloc/game_state.dart';
import 'package:super_xo/repositories/game_repo.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  final GameRepo gameRepo;

  GameBloc(this.gameRepo) : super(GameState(game: gameRepo.initialGame())) {
    on<MoveMade>((event, emit) {
      print('Event received: $event');
      final newGame = gameRepo.makeMove(state.game, event.row, event.col);
      emit(GameState(game: newGame));
      print('State updated: ${GameState(game: newGame)}');
    });

    on<ResetGame>((event, emit) {
      print('Event received: $event');
      final newGame = gameRepo.resetGame();
      emit(GameState(game: newGame));
      print('State updated: ${GameState(game: newGame)}');
    });
  }
}
