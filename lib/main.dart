import 'package:new_mahedy_desgin/model/image_path.dart';
import 'package:new_mahedy_desgin/screen/privacy_policy.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:new_mahedy_desgin/screen/home_screen.dart';
import 'package:launch_review/launch_review.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'model/adshelper.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'new_mahedy_desgin',
      home:  ScreenOne(),
    );
  }
}
class ScreenOne extends StatefulWidget {
  const ScreenOne({Key? key}) : super(key: key);
  @override
  State<ScreenOne> createState() => _ScreenOneState();
}
class _ScreenOneState extends State<ScreenOne> {
  late BannerAd _bannerads;
  bool isBannerAdsRady = false;
  late InterstitialAd  _interstitialAd;
  bool isInterstitialAdisRady = false;
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
      request: const AdRequest()
    )..load();
    InterstitialAd.load(
        adUnitId: AdHelper.interstitialAdUnitId,
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
            onAdLoaded: (ad){
              this._interstitialAd = ad;
              isInterstitialAdisRady = true;
            },
            onAdFailedToLoad: (error){
              print('faled to load Interstial Ads load ${error.message}');
            }));
  }
@override
void dispose(){
    super.dispose();
    _bannerads.dispose();
    _interstitialAd.dispose();
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade200,
      body: Center(
        child: Container(
          child: Column(
            children: [
              const SizedBox(height: 120,),
              const Text(" New Mahedy ",
              style:  TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 50,
                color: Colors.blue,
              ),
              ),
              const Text("Desgine"
              ,style: TextStyle(
                  fontSize: 40,
                   fontWeight: FontWeight.w500,
                  color: Colors.pink
                ),
              ),
              const SizedBox(height: 50,),
              Image.asset("assets/ScreenOne.png"),
              const SizedBox(height: 50,),
              // ignore: deprecated_member_use
              ElevatedButton(
                child: const Text('Start',
                style: TextStyle(
                  fontSize: 40,
                    color: Colors.white
                ),
                ),
                  // color: Colors.teal.shade400,
                  onPressed: (){
                    if (isInterstitialAdisRady)
                      _interstitialAd.show();
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context)=>const Homescreen())
                    );
                  }
              ),
              const SizedBox(height: 10,),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    color: Colors.transparent,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              FloatingActionButton(
                                heroTag: 'Folotingbtn 1',
                                  onPressed: () {
                                    // ignore: deprecated_member_use
                                    launch('https://m.facebook.com/profile.php?id=100084999112010&eav=AfbjZ1jJXTOqiT3T_ld2uhIS0tardl6Bt4yOUDizZ7e5cNzaVC5tKtCzhYRakZG72fU&paipv=0');
                                  },
                                  child: const Center(child: Icon(Icons.facebook,size: 50,)),
                                  ),
                              FloatingActionButton(
                                  heroTag: 'Folotingbtn 2',
                                  child: const Icon(Icons.subscriptions,size: 50),
                                  onPressed: (){
                                    // ignore: deprecated_member_use
                                    launch('https://www.youtube.com/channel/UCIWC9dsmrD2bFQakpI11fLg');
                                  }),
                              FloatingActionButton(
                                  heroTag: 'Folotingbtn 3',
                                  child: const Icon(Icons.rate_review_outlined,size: 50),
                                  onPressed: (){
                                    LaunchReview.launch(
                                      androidAppId: "com.example.new_mahedy_desgin"
                                    );
                                  }),
                              FloatingActionButton(
                                  heroTag: 'Folotingbtn 4',
                                  child: const Icon(Icons.privacy_tip_outlined,size: 50),
                                  onPressed: (){
                                    Navigator.push(context, MaterialPageRoute(
                                        builder: (context)=> PrivacyPolicyScreen(
                                          PrivacyPolicy: PrivacyPolicyText.first+TermsAndCondition.first,
                                        )));
                                  }),
                            ],
                          ),
                          const SizedBox(height: 20,),
                          if (isBannerAdsRady)
                            Container(
                              height: _bannerads.size.height.toDouble(),
                              width: _bannerads.size.width.toDouble(),
                              child: AdWidget(ad: _bannerads),
                            )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
