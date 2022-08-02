import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/provider/user_provider.dart';
import 'package:food_delivery/screens/home_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  UserProvider? userProvider;
  _googleSignUp() async {
    try {
      final GoogleSignIn _googleSignIn = GoogleSignIn(
        scopes: ['email'],
      );
      final FirebaseAuth _auth = FirebaseAuth.instance;

      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      final User? user = (await _auth.signInWithCredential(credential)).user;
      // ignore: avoid_print
      print("signed in " + user!.displayName.toString());

      userProvider!.addUserData(
        userName: user.displayName,
        userEmail: user.email,
        userImage: user.photoURL,
        currentUser: user,
      );

      return user;
      // ignore: empty_catches
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      // body: Center(
      //   child: TextButton(
      //     style: ButtonStyle(
      //         backgroundColor: MaterialStateProperty.all(Colors.amber)),
      //     onPressed: () {
      //       _googleSignUp().then(
      //         (value) => Navigator.pushReplacement(
      //           context,
      //           MaterialPageRoute(
      //             builder: (context) => const HomeScreen(),
      //           ),
      //         ),
      //       );
      //     },
      //     child: 'Google Login'.text.make(),
      //   ),
      // ),

      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/organic.jpeg',
              width: 300,
              height: 200,
            ),
            "Fresh Vegetables".text.xl2.green700.make(),
            40.heightBox,
            "Login with google".text.xl.make(),
            10.heightBox,
            VxCircle(
              radius: 60,
              backgroundColor: const Color(0xfff0f0f0),
              child: IconButton(
                onPressed: () {
                  _googleSignUp().then(
                    (value) => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    ),
                  );
                },
                icon: Image.asset('assets/images/google.png').p4(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
