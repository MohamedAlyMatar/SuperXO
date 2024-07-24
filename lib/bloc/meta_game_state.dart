import 'package:equatable/equatable.dart';
import 'package:super_xo/models/game_model.dart';

class MetaGameState extends Equatable {
  final GameModel game;

  const MetaGameState({required this.game});

  MetaGameState copyWith({
    GameModel? game,
  }) {
    return MetaGameState(
      game: game ?? this.game,
    );
  }

  @override
  List<Object> get props => [game];
}
