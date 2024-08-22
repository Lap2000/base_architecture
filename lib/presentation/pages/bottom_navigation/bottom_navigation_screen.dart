import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:test_sample/presentation/routers/router.dart';
import 'package:test_sample/presentation/routers/router.gr.dart';

@RoutePage()
class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        HomeRoute(),
        NoticeRoute(),
        UserRoute(),
      ],
      transitionBuilder: (context, child, animation) => FadeTransition(
        opacity: animation,
        child: child,
      ),
      bottomNavigationBuilder: (_, tabsRouter) {
        if (tabsRouter.currentPath.contains(RouterPath.settings)) {
          return const SizedBox.shrink();
        }
        return BottomNavigationBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: const [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: 'Notice',
              icon: Icon(Icons.notifications),
            ),
            BottomNavigationBarItem(
              label: 'User',
              icon: Icon(Icons.person),
            ),
          ],
        );
      },
    );
  }
}
