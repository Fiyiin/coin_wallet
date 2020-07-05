import 'package:flutter/material.dart';

class WallletCards extends StatelessWidget {
  const WallletCards({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 32.0),
      height: 224,
      color: Color(0xFF101426),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: Text(
              'Wallets',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                walletCard(
                  'Bitcoin',
                  '3.07261 BTC',
                  '+ \$726 (15%)',
                  'bitcoin.png',
                  Color(
                    0xffFF9F05,
                  ),
                ),
                SizedBox(width: 25),
                walletCard(
                  'Etherium',
                  '1.07261 ETH',
                  '+ \$482 (12%)',
                  'etherium.png',
                  Color(0xff1D86FF),
                ),
                SizedBox(width: 25),
                walletCard(
                  'Litecoin',
                  '2.07261 BTC',
                  '+ \$271 (9%)',
                  'litecoin.png',
                  Color(0xff345D9D),
                ),
                SizedBox(width: 25),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Container walletCard(
    String title, String amount, String gain, String image, Color color) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 17),
    height: 180.0,
    width: 140.0,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19), color: Colors.white),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 3.0, bottom: 27),
          child: SizedBox(
            child: Image.asset('assets/images/$image'),
          ),
        ),
        Text(
          title,
          style: TextStyle(fontSize: 12, color: Colors.black54),
        ),
        SizedBox(height: 9),
        Text(
          amount,
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
        SizedBox(height: 11),
        Text(
          gain,
          style: TextStyle(fontSize: 12, color: color),
        )
      ],
    ),
  );
}
