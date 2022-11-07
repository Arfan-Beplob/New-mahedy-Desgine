import 'package:flutter/material.dart';
import 'package:new_mahedy_desgin/castomCard/castom_card.dart';
import 'package:new_mahedy_desgin/model/adshelper.dart';
import 'package:new_mahedy_desgin/model/image_path.dart';
import 'package:new_mahedy_desgin/screen/detale_screen.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);
  @override
  State<Homescreen> createState() => _HomescreenState();
}
class _HomescreenState extends State<Homescreen> {

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
        request: AdRequest()
    )..load();
    InterstitialAd.load(
        adUnitId: AdHelper.interstitialAdUnitId,
        request: AdRequest(),
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
      appBar:  AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.teal,
        title: Text('New Degine Collection - 2022'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 5,),
            CastomCard(
              onTap: (){
                if (isInterstitialAdisRady)
                  _interstitialAd.show();
                Navigator.push(context, MaterialPageRoute(
                    builder: (context)=>DeaatileScreen(
                      itemCount: ArabicDesgin.length,
                      image: ArabicDesgin,
                      Titel:'Arabic Mehndi  Designs' ,
                      imagepath: ArabicDesgin,
                      // imageList: ArabicDesgin.length,
                    )));
              },
              titel: 'Arabic Mehndi\nDesigns',
              image: "assets/Arabic desgine/images1.jpg",
              numberofdesgine: '20 Designs',
            ),
            SizedBox(height: 5,),
            CastomCard(
              onTap: (){
                if (isInterstitialAdisRady)
                  _interstitialAd.show();
                Navigator.push(context, MaterialPageRoute(
                    builder: (context)=>DeaatileScreen(
                      itemCount: AttrattivDesgine.length,
                      image: AttrattivDesgine,
                        Titel: 'Attractive Mehndi \nDesign',
                        imagepath: AttrattivDesgine
                    )
                ));
              },
              numberofdesgine: '20 Designs',
              titel: 'Attractive\n Mehndi Design',
              image: "assets/attrattive desgine/eleven.jpg",
            ),
            SizedBox(height: 5,),
            CastomCard(
              onTap: (){
                if (isInterstitialAdisRady)
                  _interstitialAd.show();
                Navigator.push(context, MaterialPageRoute(
                    builder: (context)=>DeaatileScreen(
                      itemCount: PanjabRoylForntHand.length,
                      image: PanjabRoylForntHand,
                      Titel:'PanjabRoylForntHand' ,
                      imagepath: PanjabRoylForntHand,
                      // imageList: ArabicDesgin.length,
                    )));
              },
              numberofdesgine: '20 Designs',
              titel: 'Punjabi Royal\n  Mehndi Design',
              image: "assets/desplayImage/Punjabi.jpg",
            ),
            SizedBox(height: 5,),
            CastomCard(
              onTap: (){
                if (isInterstitialAdisRady)
                  _interstitialAd.show();
                Navigator.push(context, MaterialPageRoute(
                    builder: (context)=>DeaatileScreen(
                      itemCount: FingerMehndinDesign.length,
                      image: FingerMehndinDesign,
                      Titel:'PanjabRoylForntHand' ,
                      imagepath: FingerMehndinDesign,
                      // imageList: ArabicDesgin.length,
                    )));},
              numberofdesgine: '30',
              titel: 'Finger Mehndi  \nDesign',
              image: "assets/Finger Mehndi n Design/therty.jpg",
            ),
            SizedBox(height: 5,),
            CastomCard(
              onTap: (){
                if (isInterstitialAdisRady)
                  _interstitialAd.show();
                Navigator.push(context, MaterialPageRoute(
                  builder: (context)=>DeaatileScreen(
                    itemCount: SimpleMehndiDesignsForLeftHand.length,
                    image: SimpleMehndiDesignsForLeftHand,
                    Titel:'PanjabRoylForntHand' ,
                    imagepath: SimpleMehndiDesignsForLeftHand,
                  )));},
              numberofdesgine: '20 Designs',
              titel: 'Simple Mehndi \nDesigns',
              image: "assets/Simple Mehndi Designs nFor Left Hand/seven.jpg",
            ),
            SizedBox(height: 5,),
          ],
        ),
      ),
    );
  }
}
