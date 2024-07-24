import 'package:equatable/equatable.dart';

abstract class MetaGameEvent extends Equatable {
  const MetaGameEvent();

  @override
  List<Object> get props => [];
}

class BoxClicked extends MetaGameEvent {
  final int row;
  final int col;

  const BoxClicked(this.row, this.col);

  @override
  List<Object> get props => [row, col];
}

class ResetMetaGame extends MetaGameEvent {}
