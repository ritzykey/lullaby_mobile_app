// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [DiscoverView]
class DiscoverRoute extends PageRouteInfo<void> {
  const DiscoverRoute({List<PageRouteInfo>? children})
      : super(
          DiscoverRoute.name,
          initialChildren: children,
        );

  static const String name = 'DiscoverRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const DiscoverView();
    },
  );
}

/// generated route for
/// [FavoritesView]
class FavoritesRoute extends PageRouteInfo<void> {
  const FavoritesRoute({List<PageRouteInfo>? children})
      : super(
          FavoritesRoute.name,
          initialChildren: children,
        );

  static const String name = 'FavoritesRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const FavoritesView();
    },
  );
}

/// generated route for
/// [HomeDetailView]
class HomeDetailRoute extends PageRouteInfo<HomeDetailRouteArgs> {
  HomeDetailRoute({
    required String id,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          HomeDetailRoute.name,
          args: HomeDetailRouteArgs(
            id: id,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'HomeDetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<HomeDetailRouteArgs>();
      return HomeDetailView(
        id: args.id,
        key: args.key,
      );
    },
  );
}

class HomeDetailRouteArgs {
  const HomeDetailRouteArgs({
    required this.id,
    this.key,
  });

  final String id;

  final Key? key;

  @override
  String toString() {
    return 'HomeDetailRouteArgs{id: $id, key: $key}';
  }
}

/// generated route for
/// [HomeView]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomeView();
    },
  );
}

/// generated route for
/// [HomenewView]
class HomenewRoute extends PageRouteInfo<HomenewRouteArgs> {
  HomenewRoute({
    Key? key,
    dynamic storyId,
    List<PageRouteInfo>? children,
  }) : super(
          HomenewRoute.name,
          args: HomenewRouteArgs(
            key: key,
            storyId: storyId,
          ),
          rawPathParams: {'storyId': storyId},
          initialChildren: children,
        );

  static const String name = 'HomenewRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<HomenewRouteArgs>(
          orElse: () => HomenewRouteArgs(storyId: pathParams.get('storyId')));
      return HomenewView(
        key: args.key,
        storyId: args.storyId,
      );
    },
  );
}

class HomenewRouteArgs {
  const HomenewRouteArgs({
    this.key,
    this.storyId,
  });

  final Key? key;

  final dynamic storyId;

  @override
  String toString() {
    return 'HomenewRouteArgs{key: $key, storyId: $storyId}';
  }
}

/// generated route for
/// [LoadingView]
class LoadingRoute extends PageRouteInfo<void> {
  const LoadingRoute({List<PageRouteInfo>? children})
      : super(
          LoadingRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoadingRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LoadingView();
    },
  );
}

/// generated route for
/// [LoginView]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LoginView();
    },
  );
}

/// generated route for
/// [LullabiesDownloadedListView]
class LullabiesDownloadedListRoute extends PageRouteInfo<void> {
  const LullabiesDownloadedListRoute({List<PageRouteInfo>? children})
      : super(
          LullabiesDownloadedListRoute.name,
          initialChildren: children,
        );

  static const String name = 'LullabiesDownloadedListRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LullabiesDownloadedListView();
    },
  );
}

/// generated route for
/// [LullabiesListView]
class LullabiesListRoute extends PageRouteInfo<LullabiesListRouteArgs> {
  LullabiesListRoute({
    required String title,
    Key? key,
    int? path,
    List<PageRouteInfo>? children,
  }) : super(
          LullabiesListRoute.name,
          args: LullabiesListRouteArgs(
            title: title,
            key: key,
            path: path,
          ),
          rawPathParams: {'categoryId': path},
          initialChildren: children,
        );

  static const String name = 'LullabiesListRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LullabiesListRouteArgs>();
      return LullabiesListView(
        title: args.title,
        key: args.key,
        path: args.path,
      );
    },
  );
}

class LullabiesListRouteArgs {
  const LullabiesListRouteArgs({
    required this.title,
    this.key,
    this.path,
  });

  final String title;

  final Key? key;

  final int? path;

  @override
  String toString() {
    return 'LullabiesListRouteArgs{title: $title, key: $key, path: $path}';
  }
}

/// generated route for
/// [LullabyHomeParentView]
class LullabyHomeParentRoute extends PageRouteInfo<void> {
  const LullabyHomeParentRoute({List<PageRouteInfo>? children})
      : super(
          LullabyHomeParentRoute.name,
          initialChildren: children,
        );

  static const String name = 'LullabyHomeParentRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LullabyHomeParentView();
    },
  );
}

/// generated route for
/// [LullabyHomeView]
class LullabyHomeRoute extends PageRouteInfo<void> {
  const LullabyHomeRoute({List<PageRouteInfo>? children})
      : super(
          LullabyHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'LullabyHomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LullabyHomeView();
    },
  );
}

/// generated route for
/// [NameView]
class NameRoute extends PageRouteInfo<void> {
  const NameRoute({List<PageRouteInfo>? children})
      : super(
          NameRoute.name,
          initialChildren: children,
        );

  static const String name = 'NameRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const NameView();
    },
  );
}

/// generated route for
/// [NavigationView]
class NavigationRoute extends PageRouteInfo<void> {
  const NavigationRoute({List<PageRouteInfo>? children})
      : super(
          NavigationRoute.name,
          initialChildren: children,
        );

  static const String name = 'NavigationRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const NavigationView();
    },
  );
}

/// generated route for
/// [NoConnectionView]
class NoConnectionRoute extends PageRouteInfo<void> {
  const NoConnectionRoute({List<PageRouteInfo>? children})
      : super(
          NoConnectionRoute.name,
          initialChildren: children,
        );

  static const String name = 'NoConnectionRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const NoConnectionView();
    },
  );
}

/// generated route for
/// [OnboardingsView]
class OnboardingsRoute extends PageRouteInfo<void> {
  const OnboardingsRoute({List<PageRouteInfo>? children})
      : super(
          OnboardingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const OnboardingsView();
    },
  );
}

/// generated route for
/// [SettingsView]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SettingsView();
    },
  );
}

/// generated route for
/// [StoryyView]
class StoryyRoute extends PageRouteInfo<void> {
  const StoryyRoute({List<PageRouteInfo>? children})
      : super(
          StoryyRoute.name,
          initialChildren: children,
        );

  static const String name = 'StoryyRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const StoryyView();
    },
  );
}
