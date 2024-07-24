import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_xo/bloc/room_bloc.dart';
import 'package:super_xo/bloc/room_state.dart';
import 'package:super_xo/views/game_view.dart';
import 'package:super_xo/views/meta_game_view.dart';

class CreateRoomScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RoomBloc(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Create Room')),
        body: BlocBuilder<RoomBloc, RoomState>(
          builder: (context, state) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'SuperXO',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  Text('Your room number', style: TextStyle(fontSize: 18)),
                  SizedBox(height: 10),
                  Text(state.roomNumber,
                      style:
                          TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
                  SizedBox(height: 20),
                  Text(
                    state.playerJoined
                        ? 'Player Joined! Press Start'
                        : 'Waiting for a player to join...',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: state.playerJoined ? () {} : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          state.playerJoined ? Colors.black : Colors.grey,
                    ),
                    child: Text('Start'),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
