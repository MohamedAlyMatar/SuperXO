import 'package:bloc/bloc.dart';
import 'package:super_xo/bloc/game_event.dart';
import 'package:super_xo/bloc/meta_game_event.dart';
import 'package:super_xo/bloc/meta_game_state.dart';
import 'package:super_xo/repositories/game_repo.dart';

class MetaGameBloc extends Bloc<MetaGameEvent, MetaGameState> {
  final GameRepo gameRepo;

  MetaGameBloc(this.gameRepo)
      : super(MetaGameState(game: gameRepo.initialGame())) {
    on<BoxClicked>((event, emit) {
      final newGame = gameRepo.makeMove(state.game, event.row, event.col);
      emit(MetaGameState(game: newGame));
    });

    on<ResetMetaGame>((event, emit) {
      final newGame = gameRepo.resetGame();
      emit(MetaGameState(game: newGame));
    });
  }
}
