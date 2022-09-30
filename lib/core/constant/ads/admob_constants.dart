import 'dart:io';

class AdmobService {
  static AdmobService? _instace;

  static AdmobService get instance => _instace ??= AdmobService._init();
  AdmobService._init();
  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3543901658351927/1059017648'; //ca-app-pub-3940256099942544/6300978111
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/2934735716';
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }
}