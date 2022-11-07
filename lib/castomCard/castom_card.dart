import 'package:flutter/material.dart';
class CastomCard extends StatefulWidget {
  var image;
  var titel;
  var numberofdesgine;
  var onTap;
   CastomCard({Key? key,
   required this.image,
     required this.titel,
     required this.numberofdesgine,
     required this.onTap
   }) : super(key: key);
  @override
  State<CastomCard> createState() => _CastomCardState();
}
class _CastomCardState extends State<CastomCard> {
  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: widget.onTap,
      child: Card(
        color: Colors.indigo,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            color: Colors.cyanAccent.shade700,
            height:MediaQuery.of(context).size.height*0.2,
            width: MediaQuery.of(context).size.width*1,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 40.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height*0.30,
                        width: MediaQuery.of(context).size.width*0.30,
                        child: Image.asset(widget.image,fit: BoxFit.fill,)),
                  ),
                  SizedBox(width: 20,),
                  Container(
                    child: Column(
                      children: [
                        //titel
                         Text(widget.titel,
                            style:  TextStyle(
                                fontSize:MediaQuery.of(context).size.shortestSide*0.0600,
                                color: Colors.white70,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        Text('Top',
                          style:  TextStyle(
                            fontSize: 40,
                            fontFamily: 'BungeeSpice',
                          ),
                        ),
                        Text(widget.numberofdesgine,
                          style:  TextStyle(
                              fontSize: MediaQuery.of(context).size.shortestSide*0.090,
                              color: Colors.pink,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
