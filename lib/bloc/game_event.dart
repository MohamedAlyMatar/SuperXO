import 'package:equatable/equatable.dart';

abstract class GameEvent extends Equatable {
  const GameEvent();

  @override
  List<Object> get props => [];
}

class MoveMade extends GameEvent {
  final int row;
  final int col;

  const MoveMade(this.row, this.col);

  @override
  List<Object> get props => [row, col];
}

class MetaMoveMade extends GameEvent {
  final int row;
  final int col;
  final String winnerSymbol;

  const MetaMoveMade(this.row, this.col, this.winnerSymbol);

  @override
  List<Object> get props => [row, col, winnerSymbol];
}

class ResetGame extends GameEvent {}
