import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:popular_movies/presentation/utilities/extensions/context_extensions.dart';

class AppLoading {
  AppLoading._();

  static Future<void> showLoading(BuildContext context) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      barrierColor: Theme.of(context).scaffoldBackgroundColor.withAlpha(140),
      builder: (context) {
        return const LoadingScreen();
      },
    );
  }
}

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  bool isSlow = false;
  late Timer timer;

  @override
  void initState() {
    timer = Timer(
      const Duration(seconds: 3),
      () => setState(() => isSlow = true),
    );
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        OverflowBox(
          child: SizedBox(
            height: 150,
            child: Lottie.asset('assets/lottie/loading.json'),
          ),
        ),
        if (isSlow)
          Align(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                context.l10n.takingLong,
                style: context.textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
            ),
          ),
      ],
    );
  }
}
