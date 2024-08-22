import 'package:auto_route/auto_route.dart';
import 'package:test_sample/presentation/routers/router.gr.dart';
export 'router_path.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/login',
          page: LoginRoute.page,
          initial: true,
        ),
        AutoRoute(
          path: '/dashboard',
          page: DashboardRoute.page,
          children: [
            AutoRoute(path: 'home', page: HomeRoute.page),
            AutoRoute(path: 'notice', page: NoticeRoute.page),
            AutoRoute(
              path: 'user',
              page: UserTab.page,
              children: [
                AutoRoute(
                  path: '',
                  page: UserRoute.page,
                ),
                CustomRoute(
                  path: 'settings',
                  page: SettingsRoute.page,
                  transitionsBuilder: TransitionsBuilders.slideLeft,
                ),
              ],
            ),
          ],
        ),
      ];

  @override
  List<AutoRouteGuard> get guards => [
        // optionally add root guards here
      ];
}

@RoutePage(name: 'UserTab')
class UserTabPage extends AutoRouter {
  const UserTabPage({super.key});
}

@RoutePage(name: 'HomeTab')
class HomeTabPage extends AutoRouter {
  const HomeTabPage({super.key});
}

@RoutePage(name: 'NoticeTab')
class NoticeTabPage extends AutoRouter {
  const NoticeTabPage({super.key});
}
