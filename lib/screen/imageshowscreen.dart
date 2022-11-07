import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:new_mahedy_desgin/model/adshelper.dart';
class ImageshowScreen extends StatefulWidget {
  var imagepath;
  ImageshowScreen({Key? key,
  required this.imagepath
  }) : super(key: key);

  @override
  State<ImageshowScreen> createState() => _ImageshowScreenState();
}

class _ImageshowScreenState extends State<ImageshowScreen> {
  late BannerAd _bannerads;
  bool isBannerAdsRady = false;
  @override
  void initState() {
    super.initState();
    _bannerads = BannerAd(
        size: AdSize.banner ,
        adUnitId: AdHelper.bannerAdUnitId,
        listener: BannerAdListener(
            onAdLoaded: (_){
              setState((){
                isBannerAdsRady = true;
              });
            },
            onAdFailedToLoad:(ad,error){
              print('faled to load a banner ads load${error.message}');
              isBannerAdsRady = false;
              ad.dispose();
            }
        ),
        request: AdRequest()
    )..load();
  }
  @override
  void dispose(){
    super.dispose();
    _bannerads.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
    body: SafeArea(
      child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: MediaQuery.of(context).size.height*0.7,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                  image: DecorationImage(
                    image: AssetImage(widget.imagepath),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            if (isBannerAdsRady)
              Container(
                height: _bannerads.size.height.toDouble(),
                width: _bannerads.size.width.toDouble(),
                child: AdWidget(ad: _bannerads),
              )
          ],
        ),
    ),
    );
  }
}
