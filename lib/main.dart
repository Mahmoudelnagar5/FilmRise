import 'package:flimrize/core/routing/app_router.dart';
import 'package:flimrize/core/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'core/utils/constants.dart';
import 'features/movies/domain/entities/movie_details.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(MovieDetailsAdapter());
  await Hive.openBox<MovieDetails>(kMoviesBox);
  setupServiceLocator();
  runApp(const Flimrize());
}

class Flimrize extends StatelessWidget {
  const Flimrize({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          appBarTheme: const AppBarTheme(
            backgroundColor: Color.fromARGB(255, 0, 0, 0),
            elevation: 0,
            iconTheme: IconThemeData(
              color: Colors.white,
            ),
          ),
          scaffoldBackgroundColor: const Color.fromARGB(255, 0, 0, 0)),
      title: 'Flimrize',
    );
  }
}
