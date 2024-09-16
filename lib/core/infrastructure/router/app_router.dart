
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../features/home/presentation/pages/home_page.dart';
import '../../../features/pokemons/presentation/pages/pokemons_page.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: HomePage(),
          transitionDuration: const Duration(milliseconds: 500),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(-1.0, 0.0);
            const end = Offset.zero;
            const curve = Curves.easeInOut;

            var tween = Tween(begin: begin, end: end);
            var offsetAnimation = animation.drive(tween.chain(CurveTween(curve: curve)));

            return SlideTransition(position: offsetAnimation, child: child);
          },
        )
      ),
      GoRoute(
        path: '/pokemons',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: PokemonsPage(),
          transitionDuration: const Duration(milliseconds: 500),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(0.0, 1.0);
            const end = Offset.zero;
            const curve = Curves.easeInOut;

            var tween = Tween(begin: begin, end: end);
            var offsetAnimation = animation.drive(tween.chain(CurveTween(curve: curve)));

            return SlideTransition(position: offsetAnimation, child: child);
          },
        ),
      ),
    ],
  );
}
