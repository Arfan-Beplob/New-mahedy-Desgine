import 'package:flutter/material.dart';
class PrivacyPolicyScreen extends StatefulWidget {
  String PrivacyPolicy;
   PrivacyPolicyScreen({Key? key,
   required this.PrivacyPolicy
   }) : super(key: key);

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyState();
}


class _PrivacyPolicyState extends State<PrivacyPolicyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height:  MediaQuery.of(context).size.height*1,
              width:  MediaQuery.of(context).size.width*1,
              color: Colors.white,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    color: Colors.white,
                    child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(widget.PrivacyPolicy,
                      style:const TextStyle(
                          fontSize: 15
                      ),),
                        ))
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
