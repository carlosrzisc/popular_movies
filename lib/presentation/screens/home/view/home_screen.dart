import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:popular_movies/presentation/screens/home/presenter/home_presenter.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: HomePresenter()));
  }
}
