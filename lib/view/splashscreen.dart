import 'dart:async';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jitta_ranking/utils/style_custom.dart';
import 'package:jitta_ranking/view/stock_page.dart';


class SplashScreen extends StatefulWidget {

  final int seconds;
  final Text title;
  final Color backgroundColor;
  final TextStyle styleTextUnderTheLoader;
  final double photoSize;
  final dynamic onClick;
  final Color loaderColor;
  final Text loadingText;
  final bool useLoader;
  final String routeName;
  // final Future<dynamic> navigateAfterFuture;
  // final Gradient gradientBackground;
  // final Image image;
  // final ImageProvider imageBackground;

  const SplashScreen({Key? key,
    // this.navigateAfterFuture,
    this.onClick,
    // this.navigateAfterSeconds = const HomePage(),
    // this.navigateAfterSeconds = const LoginPage(),
    // this.navigateAfterSeconds = const NewsFeedPage(),
    // this.navigateAfterSeconds = const ToggleButtonsExampleApp(),
    this.title = const Text(''),
    this.backgroundColor = Colors.indigo,
    this.styleTextUnderTheLoader =
    const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black),
    this.loadingText = const Text(""),
    this.useLoader = true,
    this.loaderColor = const Color.fromRGBO(250, 255, 255, 1),
    this.seconds = 1,
    this.photoSize = 100.0,
    this.routeName = "",}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    initData();
    // It is safer to call native code using addPostFrameCallback after the widget has been fully built and initialized.
    // Directly calling native code from initState may result in errors due to the widget tree not being fully built at that point.
    // WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((_) => initPlugin());

  }
  // // Platform messages are asynchronous, so we initialize in an async method.
  // Future<void> initPlugin() async {
  //   final TrackingStatus status =
  //   await AppTrackingTransparency.trackingAuthorizationStatus;
  //   setState(() => _authStatus = '$status');
  //   // If the system can show an authorization request dialog
  //   if (status == TrackingStatus.notDetermined) {
  //     // Show a custom explainer dialog before the system dialog
  //     await showCustomTrackingDialog(context);
  //     // Wait for dialog popping animation
  //     await Future.delayed(const Duration(milliseconds: 200));
  //     // Request system's tracking authorization dialog
  //     final TrackingStatus status =
  //     await AppTrackingTransparency.requestTrackingAuthorization();
  //     setState(() => _authStatus = '$status');
  //   }
  // }

  // Future<void> showCustomTrackingDialog(BuildContext context) async =>
  //     await showDialog<void>(
  //       context: context,
  //       builder: (context) => AlertDialog(
  //         title: const Text('Dear User'),
  //         content: const Text(
  //           'We care about your privacy and data security. We keep this app free by showing ads. '
  //               'Can we continue to use your data to tailor ads for you?\n\nYou can change your choice anytime in the app settings. '
  //               'Our partners will collect data and use a unique identifier on your device to show you ads.',
  //         ),
  //         actions: [
  //           TextButton(
  //             onPressed: () => Navigator.pop(context),
  //             child: const Text('Continue'),
  //           ),
  //         ],
  //       ),
  //     );

  void initData() async {
    dynamic navigateAfterSeconds = const StocksPage();

    Timer(Duration(seconds: widget.seconds), (){
      if (navigateAfterSeconds is String) {
        // It's fairly safe to assume this is using the in-built material
        // named route component
        Navigator.of(context).pushReplacementNamed(navigateAfterSeconds);
      } else if (navigateAfterSeconds is Widget) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            settings:
            widget.routeName != null ? RouteSettings(name: "${widget.routeName}") : null,
            builder: (BuildContext context) => navigateAfterSeconds));
      } else {
        throw ArgumentError('widget.navigateAfterSeconds must either be a String or Widget');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: widget.onClick,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: null,
                color: StyleCustom.baseColor,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          CircleAvatar(
                            backgroundColor: Colors.transparent,
                            radius: widget.photoSize,
                            child: Hero(
                              tag: "splashscreenImage",
                              child: Image.asset('assets/images/trend.png'),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 10.0),
                          ),
                          widget.title
                        ],
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
