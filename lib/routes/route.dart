import 'package:go_router/go_router.dart';
import '../model/product_model.dart';
import '../view/view.dart';
import 'routes_name.dart';

GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: RoutesName.splashScreen,
      builder: (context, state) {
        return const SplashScreen();
      },
    ),
    // its Routes defines to reduce the stack of screen in login and signup screen
    GoRoute(
      path: RoutesName.loginScreen,
      builder: (context, state) {
        return const LoginScreen();
      },
      routes: [
        GoRoute(
          name: RoutesName.signupName,
          path: RoutesName.signupScreen,
          builder: (context, state) {
            return const SignUpScreen();
          },
        ),
      ],
    ),
    GoRoute(
      path: RoutesName.dashboardScreen,
      builder: (context, state) {
        return DashboardScreen();
      },
    ),
    GoRoute(
      path: RoutesName.productDetailsScreen,
      builder: (context, state) {
        return ProductDetailsScreen(
          productDetails: state.extra as ProductList,
        );
      },
    ),
  ],
);
