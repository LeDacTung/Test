import 'package:flutter/material.dart';
class ScreenOffers extends StatefulWidget {
  const ScreenOffers({Key? key}) : super(key: key);

  @override
  _ScreenOffersState createState() => _ScreenOffersState();
}

class _ScreenOffersState extends State<ScreenOffers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.grey.shade100,
      body: Center(
        child: Text(
          "Offers",
        ),
      ),
    );
  }
}
