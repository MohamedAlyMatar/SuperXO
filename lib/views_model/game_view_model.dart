import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_xo/bloc/game_state.dart';
import 'package:super_xo/repositories/game_repo.dart';

class GameViewModel extends Cubit<GameState> {
  final GameRepo gameRepo;

  GameViewModel(this.gameRepo) : super(GameState(game: gameRepo.initialGame()));

  void makeMove(int row, int col) {
    final newGame = gameRepo.makeMove(state.game, row, col);
    emit(GameState(game: newGame));
  }

  void resetGame() {
    final newGame = gameRepo.resetGame();
    emit(GameState(game: newGame));
  }
}
