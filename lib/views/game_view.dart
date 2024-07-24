import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_xo/bloc/game_bloc.dart';
import 'package:super_xo/bloc/game_event.dart';
import 'package:super_xo/bloc/game_state.dart';
import 'package:super_xo/core/customs/my_appbar.dart';

class GameView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: "Game", showBackButton: true),
      body: BlocBuilder<GameBloc, GameState>(
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
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
                              ? () {
                                  BlocProvider.of<GameBloc>(context)
                                      .add(MoveMade(i, j));
                                }
                              : null,
                          child: Container(
                            width: 100,
                            height: 100,
                            margin: EdgeInsets.all(4.0),
                            color: Colors.white,
                            child: Center(
                              child: Text(
                                state.game.board[i][j],
                                style: const TextStyle(fontSize: 32),
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
                    BlocProvider.of<GameBloc>(context).add(ResetGame());
                  },
                  // style: ButtonStyle(
                  //   backgroundColor: WidgetStateColors(
                  //     enabled: Colors.blue,
                  //     disabled: Colors.grey,
                  //   ),
                  // ),
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
