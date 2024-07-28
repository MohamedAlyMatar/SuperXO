import 'package:equatable/equatable.dart';

abstract class MetaGameEvent extends Equatable {
  const MetaGameEvent();

  @override
  List<Object> get props => [];
}

class BoxClicked extends MetaGameEvent {
  final int row;
  final int col;
  final String winner;

  const BoxClicked(this.row, this.col, this.winner);

  @override
  List<Object> get props => [row, col, winner];
}

class ResetMetaGame extends MetaGameEvent {}

// meta_game_event.dart
class UpdateWinnerSymbol extends MetaGameEvent {
  final int row;
  final int col;
  final String winnerSymbol;

  const UpdateWinnerSymbol(this.row, this.col, this.winnerSymbol);

  @override
  List<Object> get props => [row, col, winnerSymbol];
}
