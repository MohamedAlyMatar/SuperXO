import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math';
import 'room_event.dart';
import 'room_state.dart';

class RoomBloc extends Bloc<RoomEvent, RoomState> {
  RoomBloc() : super(RoomState(roomNumber: _generateRoomNumber())) {
    on<CreateRoom>((event, emit) {
      emit(RoomState(roomNumber: _generateRoomNumber()));
    });

    on<PlayerJoined>((event, emit) {
      emit(state.copyWith(playerJoined: true));
    });
  }

  static String _generateRoomNumber() {
    final random = Random();
    return List.generate(6, (_) => random.nextInt(10).toString()).join();
  }
}
