// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// //import 'package:font_awesome_flutter/fa_icon.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:login/premium.dart';
// import 'package:random_color/random_color.dart';
// import 'existancecheck.dart';
// import 'homeS.dart';
// import 'crud.dart';

// class Signup extends StatefulWidget {
//   @override
//   _SignupState createState() => _SignupState();
// }

// class _SignupState extends State<Signup> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final GoogleSignIn _googleSignIn = GoogleSignIn();
//   String email;
//   String name;
//   //String _email, _pass;
//   //final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     RandomColor _randomColor1 = RandomColor();
//     Color _color1 = _randomColor1.randomColor(
//         colorSaturation: ColorSaturation.highSaturation,
//         colorHue: ColorHue.multiple(colorHues: <ColorHue>[ColorHue.blue]));

//     MyColor _myColor1 = getColorNameFromColor(_color1);
//     print(_myColor1.getName);

//     RandomColor _randomColor2 = RandomColor();
//     Color _color2 = _randomColor2.randomColor(
//         colorSaturation: ColorSaturation.highSaturation,
//         colorHue: ColorHue.multiple(colorHues: <ColorHue>[ColorHue.red]));
//     MyColor _myColor2 = getColorNameFromColor(_color2);
//     print(_myColor2.getName);
//     return Container(
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           begin: Alignment.topRight,
//           end: Alignment.bottomLeft,
//           colors: /*[Colors.orange.shade300, Colors.orange.shade800]*/ [
//             _color1,
//             _color2
//           ],
//         ),
//       ),
//       child: Center(
//         child: ButtonTheme(
//           minWidth: 300,
//           child: OutlineButton(
//             shape: StadiumBorder(),
//             textColor: Colors.white,
//             borderSide: BorderSide(color: Colors.white),
//             onPressed: () {
//               onGoogleSignIn(context);
//             },
//             child: Row(
//               mainAxisSize: MainAxisSize.min,
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 FaIcon(FontAwesomeIcons.googlePlusG),
//                 SizedBox(width: 10),
//                 Text('Sign up with Google'),
//               ],
//             ),
//             //child: Text('Google Sign-up'),
//           ),
//         ),
//       ),
//     );
//   }

//   Future<FirebaseUser> _handleSignIn() async {
//     // hold the instance of the authenticated user
//     FirebaseUser user;
//     // flag to check whether we're signed in already
//     bool isSignedIn = await _googleSignIn.isSignedIn();
//     if (isSignedIn) {
//       // if so, return the current user
//       user = await _auth.currentUser();
//     } else {
//       final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
//       final GoogleSignInAuthentication googleAuth =
//           await googleUser.authentication;
//       // get the credentials to (access / id token)
//       // to sign in via Firebase Authentication
//       final AuthCredential credential = GoogleAuthProvider.getCredential(
//           accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
//       user = (await _auth.signInWithCredential(credential)).user;
//     }

//     return user;
//   }

//   static Future<bool> checkExist(String docID) async {
//     bool exist = false;
//     try {
//       await Firestore.instance
//           .collection('users')
//           .document(docID)
//           .get()
//           .then((doc) {
//         if (doc.exists)
//           exist = true;
//         else
//           exist = false;
//       });
//       print(exist);
//       return exist;
//     } catch (e) {
//       return false;
//     }
//   }

//   void onGoogleSignIn(BuildContext context) async {
//     FirebaseUser user = await _handleSignIn();
//     checkExist(user.uid).then((bool exist) {
//       print(exist);
//       if (exist == true) {
//         Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => ExistanceCheck(),
//             ));
//       } else {
//         Crud().getData().then((val) {
//           if (val.documents.length > 0) {
//             print(val.documents[user.uid].data["admin"]);
//           } else {
//             print("Not Found");
//           }
//         });
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => HomePageS(
// //            builder: (context) => PremiumCode(
//               user,
//               _googleSignIn,
//             ),
//           ),
//         );
//       }
//     });
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:font_awesome_flutter/fa_icon.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'premium.dart';
import 'package:random_color/random_color.dart';
import 'existancecheck.dart';
import 'homeS.dart';
import 'crud.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  String email;
  String name;
  //String _email, _pass;
  //final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    RandomColor _randomColor1 = RandomColor();
    Color _color1 = _randomColor1.randomColor(
        colorSaturation: ColorSaturation.highSaturation,
        colorHue: ColorHue.multiple(colorHues: <ColorHue>[ColorHue.blue]));

    MyColor _myColor1 = getColorNameFromColor(_color1);
    print(_myColor1.getName);

    RandomColor _randomColor2 = RandomColor();
    Color _color2 = _randomColor2.randomColor(
        colorSaturation: ColorSaturation.highSaturation,
        colorHue: ColorHue.multiple(colorHues: <ColorHue>[ColorHue.red]));
    MyColor _myColor2 = getColorNameFromColor(_color2);
    print(_myColor2.getName);
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: /*[Colors.orange.shade300, Colors.orange.shade800]*/ [
            _color1,
            _color2
          ],
        ),
      ),
      child: Center(
        child: ButtonTheme(
          minWidth: 300,
          child: OutlineButton(
            shape: StadiumBorder(),
            textColor: Colors.white,
            borderSide: BorderSide(color: Colors.white),
            onPressed: () {
              onGoogleSignIn(context);
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FaIcon(FontAwesomeIcons.googlePlusG),
                SizedBox(width: 10),
                Text('SignUp with Google'),
              ],
            ),
            //child: Text('Google Sign-up'),
          ),
        ),
      ),
    );
  }

  Future<FirebaseUser> _handleSignIn() async {
    // hold the instance of the authenticated user
    FirebaseUser user;
    // flag to check whether we're signed in already
    bool isSignedIn = await _googleSignIn.isSignedIn();
    if (isSignedIn) {
      // if so, return the current user
      user = await _auth.currentUser();
    } else {
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      // get the credentials to (access / id token)
      // to sign in via Firebase Authentication
      final AuthCredential credential = GoogleAuthProvider.getCredential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
      user = (await _auth.signInWithCredential(credential)).user;
    }

    return user;
  }

  static Future<bool> checkExist(String docID) async {
    bool exist = false;
    try {
      await Firestore.instance
          .collection('users')
          .document(docID)
          .get()
          .then((doc) {
        if (doc.exists)
          exist = true;
        else
          exist = false;
      });
      print(exist);
      return exist;
    } catch (e) {
      return false;
    }
  }

  void onGoogleSignIn(BuildContext context) async {
    FirebaseUser user = await _handleSignIn();
    checkExist(user.uid).then((bool exist) {
      print(exist);
      if (exist == true) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ExistanceCheck(),
            ));
      } else {
        // Crud().getData().then((val) {
        //   if (val.documents.length > 0) {
        //     print(val.documents[user.uid].data["admin"]);
        //   } else {
        //     print("Not Found");
        //   }
        // });
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomePageS(
//            builder: (context) => PremiumCode(
              user,
              _googleSignIn,
            ),
          ),
        );
      }
    });
  }
}
