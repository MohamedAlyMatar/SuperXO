import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_xo/core/utils/app_strings.dart';
import 'package:super_xo/views/home_view.dart';

class Routes {
  static const String initialRoute = "/";
  static const String randomQuoteRoute = "/randomQuote";
}

// Genrated Routes
class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(
          builder: (context) {
            return const HomeView();
          },
        );
      // case Routes.randomQuoteRoute:
      //   return MaterialPageRoute(
      //       builder: (contect) => BlocProvider(
      //           create: (context) => di.sl<RandomQuoteCubit>(),
      //           child: const HomeView()));

      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
        builder: ((context) => const Scaffold(
              body: Center(
                child: Text(AppStrings.noRouteFound),
              ),
            )));
  }
}
