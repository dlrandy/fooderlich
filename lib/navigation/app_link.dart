class AppLink {
// 1
  static const String kHomePath = '/home';
  static const String kOnboardingPath = '/onboarding';
  static const String kLoginPath = '/login';
  static const String kProfilePath = '/profile';
  static const String kItemPath = '/item';
// 2
  static const String kTabParam = 'tab';
  static const String kIdParam = 'id';
// 3
  String? location;
// 4
  int? currentTab;
// 5
  String? itemId;
// 6
  AppLink({this.location, this.currentTab, this.itemId});
  static AppLink fromLocation(String? location) {
    location = Uri.decodeFull(location ?? '');
    final uri = Uri.parse(location);
    final params = uri.queryParameters;
    void trySet(String key, void Function(String) setter) {
      if (params.containsKey(key)) {
        setter.call(params[key] ?? '');
      }
    }

    final link = AppLink()..location = uri.path;
    trySet(AppLink.kTabParam, (s) {
      link.currentTab = int.tryParse(s);
    });
    trySet(AppLink.kIdParam, (p0) {
      link.itemId = p0;
    });
    return link;
  }

  String toLocation() {
    String addKeyValPair({required String key, required String value}) =>
        value == null ? '' : '${key}=$value&';
    switch (location) {
      case kLoginPath:
        return kLoginPath;
      case kOnboardingPath:
        return kOnboardingPath;
      case kProfilePath:
        return kProfilePath;
      case kItemPath:
        var loc = '$kItemPath?';
        loc += addKeyValPair(key: kIdParam, value: itemId ?? '');
        return Uri.encodeFull(loc);
      default:
        var loc = '$kHomePath?';
        loc += addKeyValPair(key: kTabParam, value: currentTab.toString());
        return Uri.encodeFull(loc);
    }
  }
}
