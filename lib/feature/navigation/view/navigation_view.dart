import 'package:auto_route/auto_route.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:x_im_v00r01/feature/lullabyMiniPlayer/view/MiniAudioPlayer.dart';
import 'package:x_im_v00r01/product/navigation/deeplink/app_router.dart';
import 'package:x_im_v00r01/product/navigation/deeplink/my_route_observer.dart';

@RoutePage()
class NavigationView extends StatelessWidget {
  const NavigationView({super.key});

  Future<bool> hasInternetConnection() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    return !connectivityResult.contains(ConnectivityResult.none);
  }

  @override
  Widget build(BuildContext context) {
    final myRouteObserver = MyRouteObserver();
    return AutoTabsScaffold(
      navigatorObservers: () => [myRouteObserver],
      routes: const [
        LullabyHomeRoute(),
        LullabiesDownloadedListRoute(),
        OnboardingsRoute(),
        FavoritesRoute(),
        SettingsRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return SizedBox(
          height: context.general.mediaSize.height * 0.20,
          child: Column(
            children: [
              const MiniAudioPlayer(),
              SalomonBottomBar(
                key: ValueKey(context.locale),
                currentIndex: tabsRouter.activeIndex,
                onTap: (index) async {
                  final hasInternet = await hasInternetConnection();
                  if (!hasInternet && index != 1) {
                    // İnternet yoksa ve seçilen sekme "Downloaded" değilse engelle
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('İnternet bağlantısı yok')),
                    );
                    return;
                  }
                  // here we switch between tabs
                  tabsRouter.setActiveIndex(index);
                },
                items: <SalomonBottomBarItem>[
                  SalomonBottomBarItem(
                    icon: const Icon(Icons.home_outlined),
                    title: const Text('bottomNavigation.home').tr(),
                    selectedColor: Colors.blue,
                  ),
                  SalomonBottomBarItem(
                    icon: const Icon(Icons.travel_explore),
                    title: const Text('bottomNavigation.discover').tr(),
                    selectedColor: Colors.teal,
                  ),
                  SalomonBottomBarItem(
                    icon: const Icon(Icons.search),
                    title: const Text('bottomNavigation.search').tr(),
                    selectedColor: Colors.orange,
                  ),
                  SalomonBottomBarItem(
                    icon: const Icon(Icons.favorite),
                    title: const Text('bottomNavigation.favorites').tr(),
                    selectedColor: Colors.pinkAccent,
                  ),
                  SalomonBottomBarItem(
                    icon: const Icon(Icons.settings_outlined),
                    title: const Text('settings.title').tr(),
                    selectedColor: Colors.cyan,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
