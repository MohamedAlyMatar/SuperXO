import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_xo/bloc/game_bloc.dart';
import 'package:super_xo/bloc/game_event.dart';
import 'package:super_xo/bloc/game_state.dart';
import 'package:super_xo/core/customs/my_appbar.dart';
import 'package:super_xo/repositories/game_repo.dart';

class GameView extends StatelessWidget {
  final int i;
  final int j;

  GameView({required this.i, required this.j});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: "Game", showBackButton: true),
      body: BlocProvider(
        create: (context) => GameBloc(GameRepo()),
        child: BlocBuilder<GameBloc, GameState>(
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
                  for (int row = 0; row < 3; row++)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (int col = 0; col < 3; col++)
                          GestureDetector(
                            onTap: state.game.board[row][col] == '' &&
                                    !state.game.isGameOver
                                ? () {
                                    context
                                        .read<GameBloc>()
                                        .add(MoveMade(row, col));
                                  }
                                : null,
                            child: Container(
                              width: 100,
                              height: 100,
                              margin: EdgeInsets.all(4.0),
                              color: Colors.white70,
                              child: Center(
                                child: Text(
                                  state.game.board[row][col],
                                  style: const TextStyle(
                                      fontSize: 32, color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  if (state.game.isGameOver)
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context, state.game.winner);
                      },
                      child: Text('Winner: ${state.game.winner}'),
                    ),
                  ElevatedButton(
                    onPressed: () {
                      context.read<GameBloc>().add(ResetGame());
                    },
                    child: const Text('Reset Game'),
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
