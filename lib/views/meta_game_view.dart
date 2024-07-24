import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_xo/bloc/meta_game_bloc.dart';
import 'package:super_xo/bloc/meta_game_event.dart';
import 'package:super_xo/bloc/meta_game_state.dart';
import 'package:super_xo/core/customs/my_appbar.dart';
import 'package:super_xo/views/game_view.dart';

class MetaGameView extends StatelessWidget {
  const MetaGameView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: "Meta Game", showBackButton: true),
      body: BlocBuilder<MetaGameBloc, MetaGameState>(
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Player ${state.game.currentPlayer} turn",
                        style: TextStyle(fontSize: 24, color: Colors.black),
                      )
                    ],
                  ),
                ),
                for (int i = 0; i < 3; i++)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int j = 0; j < 3; j++)
                        GestureDetector(
                          onTap: state.game.board[i][j] == '' &&
                                  !state.game.isGameOver
                              ? () async {
                                  final result = await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          GameView(i: i, j: j),
                                    ),
                                  );
                                  if (result != null && result is String) {
                                    context
                                        .read<MetaGameBloc>()
                                        .add(BoxClicked(i, j));
                                  }
                                }
                              : null,
                          child: Container(
                            width: 100,
                            height: 100,
                            margin: EdgeInsets.all(4.0),
                            color: Colors.black87,
                            child: Center(
                              child: Text(
                                state.game.board[i][j],
                                style: const TextStyle(
                                    fontSize: 32, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                if (state.game.isGameOver)
                  Text('Winner: ${state.game.winner}',
                      style: TextStyle(fontSize: 24)),
                ElevatedButton(
                  onPressed: () {
                    context.read<MetaGameBloc>().add(ResetMetaGame());
                  },
                  child: const Text('Reset Game'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
