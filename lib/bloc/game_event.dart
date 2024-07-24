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

class ResetGame extends GameEvent {}
