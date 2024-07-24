import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:super_xo/bloc/game_bloc.dart";
import "package:super_xo/repositories/game_repo.dart";
import "package:super_xo/views/home_view.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GameBloc(GameRepo()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Super XO',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeView(),
      ),
    );
  }
}
