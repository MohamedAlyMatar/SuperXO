import 'package:equatable/equatable.dart';

class RoomState extends Equatable {
  final String roomNumber;
  final bool playerJoined;

  const RoomState({
    required this.roomNumber,
    this.playerJoined = false,
  });

  RoomState copyWith({
    String? roomNumber,
    bool? playerJoined,
  }) {
    return RoomState(
      roomNumber: roomNumber ?? this.roomNumber,
      playerJoined: playerJoined ?? this.playerJoined,
    );
  }

  @override
  List<Object> get props => [roomNumber, playerJoined];
}
