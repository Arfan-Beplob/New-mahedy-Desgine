import 'package:flutter/material.dart';
import 'package:new_mahedy_desgin/model/adshelper.dart';
import 'imageshowscreen.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
class DeaatileScreen extends StatefulWidget {
  var Titel;
  var imagepath;
  var image;
  var itemCount;
  DeaatileScreen({Key? key,
  required this.Titel,
  required this.imagepath,
    required this.image,
    required this.itemCount
  }) : super(key: key);
  @override
  State<DeaatileScreen> createState() => _DeaatileScreenState();
}
class _DeaatileScreenState extends State<DeaatileScreen> {

  late InterstitialAd  _interstitialAd;
  bool isInterstitialAdisRady = false;
  @override
  void initState() {
    super.initState();
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
    _interstitialAd.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            Text(
             widget.Titel,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
                color: Colors.white,
                fontFamily: 'BungeeSpice'
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 40,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 30,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                  ),
                  itemBuilder: (context, index) {
                    return RawMaterialButton(
                      onPressed: () {
                        if (isInterstitialAdisRady)
                          _interstitialAd.show();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ImageshowScreen(
                              imagepath:widget.imagepath[index],
                            ),
                          ),
                        );
                      },
                      child: Hero(
                        tag: 'logo$index',
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              image: AssetImage(widget.image[index]),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: widget.itemCount
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

