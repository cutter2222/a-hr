import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';

import '/auth/base_auth_user_provider.dart';

import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

import '/index.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? HomeWidget() : OnboardingWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? HomeWidget() : OnboardingWidget(),
        ),
        FFRoute(
          name: HomeWidget.routeName,
          path: HomeWidget.routePath,
          builder: (context, params) => HomeWidget(),
        ),
        FFRoute(
          name: EventsWidget.routeName,
          path: EventsWidget.routePath,
          builder: (context, params) => EventsWidget(),
        ),
        FFRoute(
          name: Registration1Widget.routeName,
          path: Registration1Widget.routePath,
          builder: (context, params) => Registration1Widget(),
        ),
        FFRoute(
          name: LoginWidget.routeName,
          path: LoginWidget.routePath,
          builder: (context, params) => LoginWidget(),
        ),
        FFRoute(
          name: OnboardingWidget.routeName,
          path: OnboardingWidget.routePath,
          builder: (context, params) => OnboardingWidget(),
        ),
        FFRoute(
          name: ProfileWidget.routeName,
          path: ProfileWidget.routePath,
          builder: (context, params) => ProfileWidget(),
        ),
        FFRoute(
          name: MissionDetailsWidget.routeName,
          path: MissionDetailsWidget.routePath,
          builder: (context, params) => MissionDetailsWidget(
            missionId: params.getParam(
              'missionId',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: BranchesWidget.routeName,
          path: BranchesWidget.routePath,
          builder: (context, params) => BranchesWidget(
            viewUsers: params.getParam<ViewUsersRow>(
              'viewUsers',
              ParamType.SupabaseRow,
            ),
          ),
        ),
        FFRoute(
          name: Registration2Widget.routeName,
          path: Registration2Widget.routePath,
          builder: (context, params) => Registration2Widget(),
        ),
        FFRoute(
          name: Registration3Widget.routeName,
          path: Registration3Widget.routePath,
          builder: (context, params) => Registration3Widget(),
        ),
        FFRoute(
          name: RegistrationCandidate1Widget.routeName,
          path: RegistrationCandidate1Widget.routePath,
          builder: (context, params) => RegistrationCandidate1Widget(),
        ),
        FFRoute(
          name: RegistrationCandidate2Widget.routeName,
          path: RegistrationCandidate2Widget.routePath,
          builder: (context, params) => RegistrationCandidate2Widget(),
        ),
        FFRoute(
          name: RegistrationEmployee1Widget.routeName,
          path: RegistrationEmployee1Widget.routePath,
          builder: (context, params) => RegistrationEmployee1Widget(),
        ),
        FFRoute(
          name: RegistrationEmployee2Widget.routeName,
          path: RegistrationEmployee2Widget.routePath,
          builder: (context, params) => RegistrationEmployee2Widget(),
        ),
        FFRoute(
          name: ShopWidget.routeName,
          path: ShopWidget.routePath,
          builder: (context, params) => ShopWidget(),
        ),
        FFRoute(
          name: RankWidget.routeName,
          path: RankWidget.routePath,
          builder: (context, params) => RankWidget(
            viewUsers: params.getParam<ViewUsersRow>(
              'viewUsers',
              ParamType.SupabaseRow,
            ),
          ),
        ),
        FFRoute(
          name: LogbookWidget.routeName,
          path: LogbookWidget.routePath,
          builder: (context, params) => LogbookWidget(),
        ),
        FFRoute(
          name: RatingGlobalWidget.routeName,
          path: RatingGlobalWidget.routePath,
          builder: (context, params) => RatingGlobalWidget(),
        ),
        FFRoute(
          name: SkillsWidget.routeName,
          path: SkillsWidget.routePath,
          builder: (context, params) => SkillsWidget(),
        ),
        FFRoute(
          name: ShopDetailsWidget.routeName,
          path: ShopDetailsWidget.routePath,
          builder: (context, params) => ShopDetailsWidget(
            shopProductId: params.getParam(
              'shopProductId',
              ParamType.int,
            ),
            isPurchased: params.getParam(
              'isPurchased',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: MissionArchiveWidget.routeName,
          path: MissionArchiveWidget.routePath,
          builder: (context, params) => MissionArchiveWidget(),
        ),
        FFRoute(
          name: ProfileEditWidget.routeName,
          path: ProfileEditWidget.routePath,
          builder: (context, params) => ProfileEditWidget(
            usersRow: params.getParam<UsersRow>(
              'usersRow',
              ParamType.SupabaseRow,
            ),
          ),
        ),
        FFRoute(
          name: ProfileAboutWidget.routeName,
          path: ProfileAboutWidget.routePath,
          builder: (context, params) => ProfileAboutWidget(),
        ),
        FFRoute(
          name: ShopMyPurchasesWidget.routeName,
          path: ShopMyPurchasesWidget.routePath,
          builder: (context, params) => ShopMyPurchasesWidget(),
        ),
        FFRoute(
          name: RewardsWidget.routeName,
          path: RewardsWidget.routePath,
          builder: (context, params) => RewardsWidget(),
        ),
        FFRoute(
          name: MissionQuizWidget.routeName,
          path: MissionQuizWidget.routePath,
          builder: (context, params) => MissionQuizWidget(
            viewMissionsRow: params.getParam<ViewMissionsRow>(
              'viewMissionsRow',
              ParamType.SupabaseRow,
            ),
          ),
        ),
        FFRoute(
          name: MissionQuizResultWidget.routeName,
          path: MissionQuizResultWidget.routePath,
          builder: (context, params) => MissionQuizResultWidget(
            userMissionsRow: params.getParam<UserMissionsRow>(
              'userMissionsRow',
              ParamType.SupabaseRow,
            ),
          ),
        ),
        FFRoute(
          name: MissionUploadFileWidget.routeName,
          path: MissionUploadFileWidget.routePath,
          builder: (context, params) => MissionUploadFileWidget(
            viewMissionsRow: params.getParam<ViewMissionsRow>(
              'viewMissionsRow',
              ParamType.SupabaseRow,
            ),
          ),
        ),
        FFRoute(
          name: ProfileDetailsWidget.routeName,
          path: ProfileDetailsWidget.routePath,
          builder: (context, params) => ProfileDetailsWidget(
            userId: params.getParam(
              'userId',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: MissionTakePhotoVideoWidget.routeName,
          path: MissionTakePhotoVideoWidget.routePath,
          builder: (context, params) => MissionTakePhotoVideoWidget(
            viewMissionsRow: params.getParam<ViewMissionsRow>(
              'viewMissionsRow',
              ParamType.SupabaseRow,
            ),
          ),
        ),
        FFRoute(
          name: MissionQuestionnaireWidget.routeName,
          path: MissionQuestionnaireWidget.routePath,
          builder: (context, params) => MissionQuestionnaireWidget(
            viewMissionsRow: params.getParam<ViewMissionsRow>(
              'viewMissionsRow',
              ParamType.SupabaseRow,
            ),
          ),
        ),
        FFRoute(
          name: EventAddWidget.routeName,
          path: EventAddWidget.routePath,
          builder: (context, params) => EventAddWidget(
            eventsRow: params.getParam<EventsRow>(
              'eventsRow',
              ParamType.SupabaseRow,
            ),
          ),
        ),
        FFRoute(
          name: EventDetailsWidget.routeName,
          path: EventDetailsWidget.routePath,
          builder: (context, params) => EventDetailsWidget(
            eventId: params.getParam(
              'eventId',
              ParamType.int,
            ),
            myEvent: params.getParam(
              'myEvent',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: EventCompleteWidget.routeName,
          path: EventCompleteWidget.routePath,
          builder: (context, params) => EventCompleteWidget(
            eventId: params.getParam(
              'eventId',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: MissionGalleryPhotoVideoWidget.routeName,
          path: MissionGalleryPhotoVideoWidget.routePath,
          builder: (context, params) => MissionGalleryPhotoVideoWidget(
            viewMissionsRow: params.getParam<ViewMissionsRow>(
              'viewMissionsRow',
              ParamType.SupabaseRow,
            ),
          ),
        ),
        FFRoute(
          name: MissionFormWidget.routeName,
          path: MissionFormWidget.routePath,
          builder: (context, params) => MissionFormWidget(
            viewMissionsRow: params.getParam<ViewMissionsRow>(
              'viewMissionsRow',
              ParamType.SupabaseRow,
            ),
          ),
        ),
        FFRoute(
          name: ProfileResumeWidget.routeName,
          path: ProfileResumeWidget.routePath,
          builder: (context, params) => ProfileResumeWidget(
            usersRow: params.getParam<UsersRow>(
              'usersRow',
              ParamType.SupabaseRow,
            ),
          ),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      observers: [routeObserver],
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/onboarding';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  child: Center(
                    child: Image.asset(
                      'assets/images/alabuga_splash.jpg',
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
