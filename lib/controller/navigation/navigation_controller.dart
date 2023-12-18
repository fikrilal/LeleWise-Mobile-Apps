import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:lelewise_mobile_apps/view/page/air/suhu_air_dashboard.dart';
import 'package:lelewise_mobile_apps/view/page/auth/login_page.dart';
import 'package:lelewise_mobile_apps/view/page/deteksi/deteksi_dashboard.dart';
import 'package:lelewise_mobile_apps/view/page/home/homepage.dart';
import 'package:lelewise_mobile_apps/view/page/pH/pH_dashboard.dart';

import '../../view/component/button/bottom_navigation_bar.dart';
import '../../view/page/pakan/pakan_dashboard.dart';
import '../../view/page/pakan/pakan_new_schedule.dart';

class NavigationController {
  NavigationController._();

  static String initR = '/HomePage';

  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _rootNavigatorHome = GlobalKey<NavigatorState>(debugLabel: 'shellHome');
  static final _rootNavigatorPakan = GlobalKey<NavigatorState>(debugLabel: 'shellPakan');
  static final _rootNavigatorDeteksi = GlobalKey<NavigatorState>(debugLabel: 'shellDeteksi');
  static final _rootNavigatorSuhu = GlobalKey<NavigatorState>(debugLabel: 'shellSuhu');
  static final _rootNavigatorPH = GlobalKey<NavigatorState>(debugLabel: 'shellPH');

  static final GoRouter router = GoRouter(
    initialLocation: initR,
    navigatorKey: _rootNavigatorKey,
    routes: <RouteBase>[
      GoRoute(
        path: '/LoginPage',
        name: 'LoginPage',
        builder: (context, state) {
          return LoginPage(
            key: state.pageKey,
          );
        },
      ),

      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainWrapper(navigationShell: navigationShell);
        },
        branches: <StatefulShellBranch>
        [
          StatefulShellBranch(
            navigatorKey: _rootNavigatorHome,
            routes: [
              GoRoute(path: '/HomePage',
                name: 'HomePage',
                builder: (context, state) {
                  return HomePage(
                    key: state.pageKey,
                  );
                },
                // routes:
              )
            ],
          ),

          StatefulShellBranch(
            navigatorKey: _rootNavigatorPakan,
            routes: [
              GoRoute(path: '/PakanDashboard',
                  name: 'PakanDashboard',
                  builder: (context, state) {
                    return PakanDashboard(
                      key: state.pageKey,
                    );
                  },
                  routes: [
                    GoRoute(path: 'NewSchedulePage',
                        name: 'NewSchedulePage',
                        builder: (context, state) {
                          return NewSchedulePage(
                            key: state.pageKey,
                          );
                        })
                  ]
              )
            ],
          ),

          StatefulShellBranch(
            navigatorKey: _rootNavigatorDeteksi,
            routes: [
              GoRoute(path: '/DeteksiPage',
                name: 'DeteksiPage',
                builder: (context, state) {
                  return DeteksiPage(
                    key: state.pageKey,
                  );
                },
              )
            ],
          ),

          StatefulShellBranch(
            navigatorKey: _rootNavigatorSuhu,
            routes: [
              GoRoute(path: '/SuhuAirPage',
                name: 'SuhuAirPage',
                builder: (context, state) {
                  return SuhuAirPage(
                    key: state.pageKey,
                  );
                },
              )
            ],
          ),

          StatefulShellBranch(
            navigatorKey: _rootNavigatorPH,
            routes: [
              GoRoute(path: '/PHPage',
                name: 'PHPage',
                builder: (context, state) {
                  return PHPage(
                    key: state.pageKey,
                  );
                },
              )
            ],
          ),
        ],
      )
    ],
  );
}