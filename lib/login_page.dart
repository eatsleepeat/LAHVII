import 'constants.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
//  final prefs = await SharedPreferences.getInstance();

  Future<String> _handleLogin(
      BuildContext context, String name, String Id) async {
////    SharedPreferences prefs = await SharedPreferences.getInstance();
//    await prefs.setString('name', name);
//    await prefs.setString('Id', Id).then((value) {
//      //navigate to maiin page
//      Navigator.of(context).pushNamed('/HomePage');
//
//    });
//    Navigator.of(context).pushNamed('/HomePage');
//    return "Logged In";
  }

//  _updateLoginPref() async {
//    SharedPreferences prefs = await SharedPreferences.getInstance();
//    String name = (prefs.getString('name'));
//
////    print('Pressed $counter times.');
//    await prefs.setInt('counter', counter);
//  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Constants.themeGreen,
        body: SafeArea(
          child: Stack(
            children: <Widget>[
              FlutterLogin(
                emailValidator: (str) {},
                messages: LoginMessages(
                    usernameHint: "What's your name?",
                    passwordHint: "Password",
                    forgotPasswordButton: 'Forgot ID?'),
                theme: LoginTheme(
                    inputTheme: InputDecorationTheme(),
                    cardTheme: CardTheme(elevation: 5),
                    titleStyle: TextStyle(
                      fontSize: 30,
                    ),
                    primaryColor: Constants.themeLightGreen,
//                    accentColor: Constants.themePurple,
                    pageColorLight: Constants.themeLightGreen),
                title: 'Login',

                logoTag: 'Getting it done',
                onLogin: (data) {
                  Navigator.of(context).pushNamed('/HomePage');
                  _handleLogin(context, data.name, data.password);
                  return null;
                  // ignore: missing_return
                },
                // ignore: missing_return
                onRecoverPassword: (data) {},
                // ignore: missing_return
                onSignup: (data) {},
              ),
              Positioned(
                top: 70,
                child: Center(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: TyperAnimatedTextKit(
                              speed: Duration(milliseconds: 300),
//                    totalRepeatCount: 4,
                              isRepeatingAnimation: true,
                              pause: Duration(milliseconds: 1000),
                              text: ["  Challenge Me!"],
                              textStyle: GoogleFonts.poiretOne(
                                  textStyle: TextStyle(
                                      color: Colors.white,
                                      letterSpacing: 5,
                                      fontSize: 42.72)),
//                      textStyle: TextStyle(
//                          color: Colors.white,
////                          fontStyle: GoogleFonts.playball(),
//                          fontSize: 55.0,
//                          fontWeight: FontWeight.bold),
//                    pa: Duration(milliseconds: 1000),
                              displayFullTextOnTap: true,
                              stopPauseOnTap: false),
                        ),
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
