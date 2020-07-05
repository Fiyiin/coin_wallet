import 'package:flutter/material.dart';

import 'widgets/chart.dart';
import 'widgets/wallet_card.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Coin Wallet',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'SF-Pro-Display-Regular',
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF101426),
      body: Padding(
        padding: const EdgeInsets.only(top: 24.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        CircleAvatar(
                          radius: 22.5,
                          backgroundImage:
                              AssetImage('assets/images/avatar.png'),
                        ),
                        Text(
                          'Total Balance',
                          style: TextStyle(
                              fontFamily: 'SF-UI-Display-Semibold',
                              fontSize: 16,
                              color: Colors.white),
                        ),
                        Icon(
                          Icons.more_horiz,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 7.0,
                  ),
                  Text(
                    '\$84,927.83',
                    style: TextStyle(fontSize: 35, color: Colors.white),
                  ),
                  SizedBox(
                    height: 13.0,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        WidgetSpan(
                          child: Icon(
                            Icons.arrow_drop_up,
                            size: 20,
                            color: Color(0xff00E096),
                          ),
                          alignment: PlaceholderAlignment.middle,
                        ),
                        TextSpan(
                          text: '\$726 (15%) ',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xff00E096),
                          ),
                        ),
                        TextSpan(
                          text: ('today'),
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 48),
                  WallletCards(),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32, 56, 30, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Statistics',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            RichText(
                              text: TextSpan(
                                children: [
                                  WidgetSpan(
                                    child: CircleAvatar(
                                      radius: 3.5,
                                      backgroundColor: Color(0xffFF2D55),
                                    ),
                                    alignment: PlaceholderAlignment.middle,
                                  ),
                                  TextSpan(
                                    text: '    Bitcoin',
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 26),
                            RichText(
                              text: TextSpan(
                                children: [
                                  WidgetSpan(
                                    child: CircleAvatar(
                                      radius: 3.5,
                                      backgroundColor: Color(0xff30BC96),
                                    ),
                                    alignment: PlaceholderAlignment.middle,
                                  ),
                                  TextSpan(
                                    text: '    Ripple',
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Charts()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
