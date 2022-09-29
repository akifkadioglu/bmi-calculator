import 'package:bmi_calculator/core/base/state/base_state.dart';
import 'package:bmi_calculator/core/constant/ads/admob_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdsInterstitialComponent extends StatefulWidget {
  const AdsInterstitialComponent({Key? key}) : super(key: key);

  @override
  State<AdsInterstitialComponent> createState() => _AdsInterstitialComponentState();
}

class _AdsInterstitialComponentState extends BaseState<AdsInterstitialComponent> {
  late BannerAd _bannerAd;
  bool _isBannerAdReady = false;
  @override
  void initState() {
    _loadBannerAd();
    super.initState();
  }

  void _loadBannerAd() {
    _bannerAd = BannerAd(
      adUnitId: AdmobService.bannerAdUnitId,
      request: const AdRequest(),
      size: AdSize.fullBanner,
      listener: BannerAdListener(
        onAdLoaded: (_) {
          setState(() {
            _isBannerAdReady = true;
          });
        },
        onAdFailedToLoad: (ad, err) {
          _isBannerAdReady = false;
          ad.dispose();
        },
      ),
    );

    _bannerAd.load();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 7, bottom: 7),
      color: Get.isDarkMode ? const Color.fromARGB(255, 58, 58, 58) : const Color.fromARGB(255, 238, 238, 238),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (_isBannerAdReady)
            SizedBox(
              height: _bannerAd.size.height.toDouble(),
              width: _bannerAd.size.width.toDouble(),
              child: AdWidget(ad: _bannerAd),
            ),
        ],
      ),
    );
  }
}
