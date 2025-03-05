import 'package:auto_route/auto_route.dart';
import 'package:popular_movies/presentation/screens/screens.dart';

/// Important: If you are passing typed arguments to any screen, you need to manually add the dependency
/// where the type is defined. Otherwise the auto_route_generator will not generate the required code

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: SplashRoute.page, path: '/'),
    AutoRoute(page: HomeRoute.page),
  ];
}
