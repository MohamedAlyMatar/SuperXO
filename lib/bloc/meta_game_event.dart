import 'package:equatable/equatable.dart';

abstract class MetaGameEvent extends Equatable {
  const MetaGameEvent();

  @override
  List<Object> get props => [];
}

class MoveMade extends MetaGameEvent {
  final int row;
  final int col;

  const MoveMade(this.row, this.col);

  @override
  List<Object> get props => [row, col];
}

class ResetGame extends MetaGameEvent {}
