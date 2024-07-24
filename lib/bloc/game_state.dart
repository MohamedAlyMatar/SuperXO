import 'package:equatable/equatable.dart';
import 'package:super_xo/models/game_model.dart';

class GameState extends Equatable {
  final GameModel game;
  final List<List<String>> metaBoard;
  final bool isGameOver;
  final String winner;

  GameState(
      {required this.game,
      required this.metaBoard,
      this.isGameOver = false,
      this.winner = ''});

  GameState copyWith(
      {GameModel? game,
      List<List<String>>? metaBoard,
      bool? isGameOver,
      String? winner}) {
    return GameState(
      game: game ?? this.game,
      metaBoard: metaBoard ?? this.metaBoard,
      isGameOver: isGameOver ?? this.isGameOver,
      winner: winner ?? this.winner,
    );
  }

  @override
  List<Object?> get props => [game, metaBoard, isGameOver, winner];
}
