import 'package:equatable/equatable.dart';
import 'package:super_xo/models/game_model.dart';

class GameState extends Equatable {
  final GameModel game;

  const GameState({required this.game});

  GameState copyWith({
    GameModel? game,
  }) {
    return GameState(
      game: game ?? this.game,
    );
  }

  @override
  List<Object> get props => [game];
}
