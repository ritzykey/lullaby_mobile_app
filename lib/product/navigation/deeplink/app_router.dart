import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:x_im_v00r01/feature/bos_yeniEkranAcmakIcic/view/name_view.dart';
import 'package:x_im_v00r01/feature/discover/view/discover_view.dart';
import 'package:x_im_v00r01/feature/favorites/view/favorites_view.dart';
import 'package:x_im_v00r01/feature/home/view/home_detail_view.dart';
import 'package:x_im_v00r01/feature/home/view/home_view.dart';
import 'package:x_im_v00r01/feature/homenew/view/homenew_view.dart';
import 'package:x_im_v00r01/feature/loading/view/loading_view.dart';
import 'package:x_im_v00r01/feature/login/view/login_view.dart';
import 'package:x_im_v00r01/feature/lullabiesDownloadedList/view/lullabiesDownloadedList_view.dart';
import 'package:x_im_v00r01/feature/lullabiesList/view/lullabiesList_view.dart';
import 'package:x_im_v00r01/feature/lullabyHome/view/lullabyHomeParent_view.dart';
import 'package:x_im_v00r01/feature/lullabyHome/view/lullabyHome_view.dart';
import 'package:x_im_v00r01/feature/navigation/view/navigation_view.dart';
import 'package:x_im_v00r01/feature/no_connection/view/no_connection.dart';
import 'package:x_im_v00r01/feature/onboardings/view/onboardings_view.dart';
import 'package:x_im_v00r01/feature/settings/view/settings_view.dart';
import 'package:x_im_v00r01/feature/storyy/view/storyy_view.dart';
import 'package:x_im_v00r01/product/navigation/deeplink/autoguard.dart';
import 'package:x_im_v00r01/product/state/container/product_state_items.dart';

part 'app_router.gr.dart';

/* //XDBM AppRouter
@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: NavigationRoute.page,
          path: '/',
          guards: [
            FirstTimeGuard(
              userCacheOperation:
                  ProductStateItems.productCache.userCacheOperation,
            ),
          ],
          children: [
            // ✅ Children ekledik
            CustomRoute<dynamic>(
              page: HomenewRoute.page,
              initial: true,
              path: 'story/:storyId',
              transitionsBuilder: TransitionsBuilders.fadeIn,
              durationInMilliseconds: 500, // 🔹 Animasyon süresi
            ),
            CustomRoute<dynamic>(
              page: DiscoverRoute.page,
              transitionsBuilder: TransitionsBuilders.fadeIn,
              durationInMilliseconds: 500, // 🔹 Animasyon süresi
              path: 'discover',
            ),
            CustomRoute<dynamic>(
              page: OnboardingsRoute.page,
              transitionsBuilder: TransitionsBuilders.fadeIn,
              durationInMilliseconds: 500, // 🔹 Animasyon süresi
              path: 'onboardings',
            ),
            CustomRoute<dynamic>(
              page: FavoritesRoute.page,
              transitionsBuilder: TransitionsBuilders.fadeIn,
              durationInMilliseconds: 500, // 🔹 Animasyon süresi
              path: 'favorites',
            ),
            CustomRoute<dynamic>(
              page: SettingsRoute.page,
              transitionsBuilder: TransitionsBuilders.fadeIn,
              durationInMilliseconds: 500, // 🔹 Animasyon süresi
              path: 'settings',
            ),
          ],
        ),

        AutoRoute(page: HomeRoute.page),

        AutoRoute(page: HomeDetailRoute.page),

        AutoRoute(
          page: LoginRoute.page,
          fullscreenDialog: true,
        ),

        AutoRoute(
          page: LoadingRoute.page,
          initial: true,
        ),

        AutoRoute(page: NoConnectionRoute.page),

        // Add more routes as needed...
      ];
} */

//Lullaby AppRouter
@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: OnboardingsRoute.page),

        AutoRoute(page: HomeDetailRoute.page),

        AutoRoute(
          page: LoginRoute.page,
          fullscreenDialog: true,
        ),

        AutoRoute(
          page: LoadingRoute.page,
          initial: true,
        ),

        AutoRoute(page: NoConnectionRoute.page),

        AutoRoute(
          page: NavigationRoute.page,
          path: '/',
          guards: [
            FirstTimeGuard(
              userCacheOperation:
                  ProductStateItems.productCache.userCacheOperation,
            ),
          ],
          children: [
            CustomRoute<dynamic>(
              page: LullabyHomeParentRoute.page,
              path: 'home',
              transitionsBuilder: TransitionsBuilders.fadeIn,
              durationInMilliseconds: 500, // 🔹 Animasyon süresi
              children: [
                CustomRoute<dynamic>(
                  page: LullabyHomeRoute.page,
                  transitionsBuilder: TransitionsBuilders.fadeIn,
                  durationInMilliseconds: 500, // 🔹 Animasyon süresi
                  path: 'lullabyhome',
                  initial: true,
                ),
                CustomRoute<dynamic>(
                  page: LullabiesListRoute.page,
                  transitionsBuilder: TransitionsBuilders.fadeIn,
                  durationInMilliseconds: 500, // 🔹 Animasyon süresi
                  path: 'lullabylist/:categoryId',
                ),
              ],
            ),
            CustomRoute<dynamic>(
              page: LullabiesDownloadedListRoute.page,
              transitionsBuilder: TransitionsBuilders.fadeIn,
              durationInMilliseconds: 500, // 🔹 Animasyon süresi
              path: 'discover',
            ),
            CustomRoute<dynamic>(
              page: OnboardingsRoute.page,
              transitionsBuilder: TransitionsBuilders.fadeIn,
              durationInMilliseconds: 500, // 🔹 Animasyon süresi
              path: 'onboardings',
            ),
            CustomRoute<dynamic>(
              page: FavoritesRoute.page,
              transitionsBuilder: TransitionsBuilders.fadeIn,
              durationInMilliseconds: 500, // 🔹 Animasyon süresi
              path: 'favorites',
            ),
            CustomRoute<dynamic>(
              page: SettingsRoute.page,
              transitionsBuilder: TransitionsBuilders.fadeIn,
              durationInMilliseconds: 500, // 🔹 Animasyon süresi
              path: 'settings',
            ),
          ],
        ),

        // Add more routes as needed...
      ];
}

/*     List<AutoRoute> get routes => [
        AutoRoute(
          page: HomeRoute.page,
          path: '/home',
          initial: true,
          children: [
            AutoRoute(page: HomeDetailRoute.page, path: 'detail'),
          ],
        ),

        /// routes go here
      ];   */
