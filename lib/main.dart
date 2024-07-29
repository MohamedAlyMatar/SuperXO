import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_xo/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await di.init();
  // Bloc.observer = AppBlocObserver();
  runApp(
    const MyApp(),
  );
}
