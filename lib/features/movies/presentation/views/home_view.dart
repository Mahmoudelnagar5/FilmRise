import 'package:flimrize/core/utils/service_locator.dart';
import 'package:flimrize/features/movies/presentation/controller/favorite_movies_bloc/favorite_movies_bloc.dart';
import 'package:flimrize/features/movies/presentation/views/watchlist_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:gradient_mask/gradient_mask.dart';

import '../../domain/usecases/get_favorite_movies_use_case.dart';
import '../../domain/usecases/get_search_movies_use_case.dart';
import '../controller/search_bloc/search_bloc.dart';
import 'movie_view.dart';
import 'search_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;
  void changeBottomNavBar(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  Widget getCurrentScreen() {
    return screens[currentIndex];
  }

  final List<Widget> screens = [
    const MovieView(),
    BlocProvider(
      create: (context) => SearchBloc(
        sl<GetSearchMoviesUseCase>(),
      ),
      child: const SearchView(),
    ),
    BlocProvider(
      create: (context) => FavoriteMoviesBloc(
        sl<GetFavoriteMoviesUseCase>(),
      ),
      child: const WatchlistView(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: GradientMask(
          gradient: const LinearGradient(
            colors: [
              Colors.white,
              Colors.white,
              Colors.red,
              Colors.red,
            ],
            stops: [0.0, 0.5, 0.5, 1.0],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          child: Image.asset(
            // 'assets/images/FilmRise.gif',
            'assets/images/filmrise-logo.png',
            width: 120,
            color: Colors.white,
          ),
        ),
        toolbarHeight: 65,
        centerTitle: true,
      ),
      body: getCurrentScreen(),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
        child: GNav(
          backgroundColor: Colors.black,
          activeColor: Colors.white,
          padding: const EdgeInsets.all(5),
          tabBackgroundGradient: LinearGradient(
            colors: [
              Colors.red,
              Colors.grey.shade900,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          color: Colors.white,
          gap: 8,
          iconSize: 28,
          tabBackgroundColor: Colors.black,
          duration: const Duration(milliseconds: 800),
          curve: Easing.emphasizedAccelerate,
          tabs: const [
            GButton(
              icon: Icons.home,
              text: 'Home',
            ),
            GButton(
              icon: Icons.search,
              text: 'Search',
            ),
            GButton(
              icon: Icons.bookmark,
              text: 'Watchlist',
            ),
          ],
          selectedIndex: currentIndex,
          onTabChange: changeBottomNavBar,
        ),
      ),
    );
  }
}
