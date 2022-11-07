import 'dart:io';
class AdHelper {
  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-4755095809144297/1712745455';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-4755095809144297/1712745455';
    } else {
      throw UnsupportedError("unsupported Platform");
    }
  }

  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-4755095809144297/7735513730';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-4755095809144297/7735513730';
    } else {
      throw UnsupportedError("unsupported Platform");
    }
  }

  static String get rewardedAdUnitId {
    if (Platform.isAndroid) {
      return '';
    } else if (Platform.isIOS) {
      return '';
    } else {
      throw new UnsupportedError('Unsupported platform');
    }
  }
}
