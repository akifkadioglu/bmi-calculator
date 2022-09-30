import 'package:bmi_calculator/core/constant/ads/admob_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class BaseView<T> extends StatefulWidget {
  final Widget Function(BuildContext context) onPageBuilder;
  final VoidCallback? onDispose;

  const BaseView({Key? key, required this.onPageBuilder, this.onDispose}) : super(key: key);

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T> extends State<BaseView<T>> {
  late InterstitialAd _interstitialAd;
  @override
  void dispose() {
    super.dispose();
    if (widget.onDispose != null) widget.onDispose!();
  }

  @override
  void initState() {
    _loadBannerAd();
    super.initState();
  }

  void _loadBannerAd() {
    InterstitialAd.load(
      adUnitId: AdmobService.interstitialAdUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdFailedToLoad: (error) {},
        onAdLoaded: onAdLoaded,
      ),
    );
  }

  void onAdLoaded(InterstitialAd ad) {
    _interstitialAd = ad;
    _interstitialAd.show();
  }

  @override
  Widget build(BuildContext context) {
    return widget.onPageBuilder(context);
  }
}
