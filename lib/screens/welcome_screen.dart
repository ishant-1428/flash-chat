import 'package:flash_chat/components/rounded_buttons.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {

  static const String id = 'welcome_screen';

  const WelcomeScreen({Key? key}) : super(key: key);
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin{

  late AnimationController controller;
  late Animation animator;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    controller.forward();
    animator = ColorTween(begin: Colors.blueGrey, end: Colors.white).animate(controller);

    controller.addListener(() {
      setState(() {

      });
    });
  }
  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: SizedBox(
                    child: Image.asset('images/logo.png'),
                    height: 60,
                  ),
                ), const SizedBox(
                  width: 250.0,
                  child: Text(
                      'Flash Chat',
                      style: TextStyle(
                        fontSize: 45.0,
                        fontWeight: FontWeight.w900
                      ),
                  ),
                  // child: DefaultTextStyle(
                  //   style: const TextStyle(
                  //     fontSize: 45.0,
                  //     fontWeight: FontWeight.w900,
                  //   ),
                  //   child: AnimatedTextKit(
                  //
                  //     animatedTexts: [
                  //       TypewriterAnimatedText('Flash Chat'),
                  //     ],
                  //     pause: const Duration(seconds: 5),
                  //     onTap: () {
                  //     },
                  //   ),
                  // ),
                )
              ],
            ),
            const SizedBox(
              height: 48.0,
            ),
            Buttons(text: 'Log In',
            onPressed:  () {
              //Go to login screen.
                Navigator.pushNamed(context, LoginScreen.id);
              },
              color: Colors.lightBlueAccent,
            ),
            Buttons(text: 'Register',
                onPressed: () {
              //Go to registration screen.
                  Navigator.pushNamed(context, RegistrationScreen.id);
                },
                color: Colors.blueAccent),
          ],
        ),
      ),
    );
  }
}


