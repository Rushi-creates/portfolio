import 'package:fp2/MODULES/My_BottomBar_stub/My_BottomBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import 'CreateProfileScreen.dart';

//to change class name = right click on className> Rename symbol
class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // resizeToAvoidBottomInset: false,
      body: myBody(),
    );
  }

/* -------------------------------------------------------------------------- */
/*                                //! Structure                               */
/* -------------------------------------------------------------------------- */

  myBody() {
    var dimVar = MediaQuery.of(context).size;

    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Color(0xff413BD3),
          Color(0xff17145E),
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: SizedBox(
            width: dimVar.width,
            child: Column(
              children: [
                Expanded(
                  child: SizedBox(
                    height: dimVar.height * 0.6,
                    child: pasteImage(),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    // height: 0.5,
                    child: bottomHalf_struc(),
                  ),
                )
              ],
            )

            //  Flex(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   direction: Axis.vertical,
            //   children: [
            //     Flexible(flex: 1, child: pasteImage()),
            //     Flexible(flex: 1, child: bottomHalf_struc())
            //   ],
            // ),
            ));
  }

  bottomHalf_struc() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          welcomeToApp_text(),
          SizedBox(height: 10),
          welcomeDescription_text(),
          SizedBox(height: 75),
          Align(
            alignment: Alignment.center,
            child: authButton(),
          ),

          // SizedBox(height: 10),
          tnC_widget()
        ],
      ),
    );
  }

/* -------------------------------------------------------------------------- */
/*                                //! png image                               */
/* -------------------------------------------------------------------------- */

  pasteImage() {
    var dimVar = MediaQuery.of(context).size;

    return SizedBox(
      width: dimVar.width,
      // height: dimVar.height * 0.55,
      child: Container(
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            image: DecorationImage(
                image: AssetImage('images/welcome_img.png'), fit: BoxFit.fill)),
      ),
    );
  }

/* -------------------------------------------------------------------------- */
/*                           //! image illustrations                          */
/* -------------------------------------------------------------------------- */

  vertical4_imgCols() {
    return Flex(
      mainAxisAlignment: MainAxisAlignment.center,
      direction: Axis.horizontal,
      children: [
        Flexible(child: firstCol()),
        Flexible(child: secondCol()),
        Flexible(child: thirdCol()),
        Flexible(child: fourthCol())
      ],
    );
  }

  firstCol() {
    var dimVar = MediaQuery.of(context).size;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        singleImgCard(),
        singleImgCard(),
        // singleImgCard(),
        SizedBox(
          height: dimVar.height * 0.16,
        )
      ],
    );
  }

  secondCol() {
    var dimVar = MediaQuery.of(context).size;

    return Column(
      children: [
        // singleImgCard(),
        SizedBox(
          height: dimVar.height * 0.16,
        ),
        singleImgCard(),
        singleImgCard(),
      ],
    );
  }

  thirdCol() {
    return Column(
      children: [
        singleImgCard(),
        // singleImgCard(),
        appLogo(),
        singleImgCard(),
      ],
    );
  }

  fourthCol() {
    var dimVar = MediaQuery.of(context).size;

    return Column(
      children: [
        SizedBox(
          height: dimVar.height * 0.16,
        ),
        // singleImgCard(),
        singleImgCard(),
        // singleImgCard(),
        SizedBox(
          height: dimVar.height * 0.16,
        ),
      ],
    );
  }

  singleImgCard() {
    var dimVar = MediaQuery.of(context).size;

    return SizedBox(
      height: dimVar.height * 0.16,
      child: AspectRatio(
          aspectRatio: 10.5 / 16,
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              //
              child: Padding(
                padding: const EdgeInsets.all(1.2),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 2, 42, 75),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
          )),
    );
  }

  appLogo() {
    var dimVar = MediaQuery.of(context).size;

    return SizedBox(
      height: dimVar.height * 0.16,
      child: AspectRatio(
          aspectRatio: 10.5 / 16,
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              child: Center(
                  child: Text(
                'CT',
                // maxLines: 2,
                // overflow: TextOverflow.ellipsis,
                // textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  // decoration: TextDecoration.none,
                  fontStyle: FontStyle.italic,
                  // fontFamily: "FontNameHere" ,
                  fontWeight: FontWeight.bold,
                  // fontWeight: FontWeight.w300,
                  // fontSize: 35.0,
                ),
              )),
            ),
          )),
    );
  }

/* -------------------------------------------------------------------------- */
/*                             //! Welcome texts                              */
/* -------------------------------------------------------------------------- */

  welcomeToApp_text() {
    return Text(
      'Welcome\nto Trendz',
      // maxLines: 2,
      // overflow: TextOverflow.ellipsis,
      // textAlign: TextAlign.center,
      style: TextStyle(
        height: 1.0,
        color: Colors.white,
        // decoration: TextDecoration.none,
        // fontStyle: FontStyle.italic,
        fontFamily: "Poppins",
        // fontWeight: FontWeight.bold,
        fontWeight: FontWeight.w600,
        fontSize: 55.0,
      ),
    );
  }

  welcomeDescription_text() {
    return Text(
      'Find what your friends are upto.\n'
      'Know their weekly content consumpution.',
      // maxLines: 2,
      // overflow: TextOverflow.ellipsis,
      // textAlign: TextAlign.center,
      style: TextStyle(
        color: Color.fromARGB(255, 158, 149, 204),
        // decoration: TextDecoration.none,
        // fontStyle: FontStyle.italic,
        // fontFamily: "FontNameHere" ,
        // fontWeight: FontWeight.bold,
        fontWeight: FontWeight.w600,
        fontSize: 14.0,
      ),
    );
  }

/* -------------------------------------------------------------------------- */
/*                                 //! Button                                 */
/* -------------------------------------------------------------------------- */

  authButton() {
    var dimVar = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return CreateProfileScreen();
        }));
      },
      child: Container(
        // width: dimVar.width * 0.8,
        // height: dimVar.height * 0.07,
        height: 65,
        width: 380,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.white,
        ),
        child: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
              width: 20,
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(50),
                    image: DecorationImage(
                        image: AssetImage('images/google.png'),
                        fit: BoxFit.fill)),
              ),
            ),
            SizedBox(width: 10),
            Text(
              "Continue with google",
              style: TextStyle(
                  fontSize: 17.0,
                  color: Color(0xff1A1665),
                  fontWeight: FontWeight.w800),
            ),
          ],
        )),
      ),
    );
  }

/* -------------------------------------------------------------------------- */
/*                                //! T&C line                                */
/* -------------------------------------------------------------------------- */
  tnC_widget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        tnC_text(),
        Row(
          children: [
            tnC_link(),
            tnC_AND_text(),
            privacyPolicy_link(),
          ],
        )
      ],
    );
  }

  tnC_text() {
    return Text(
      'By creating an account, you agree to our',
      // maxLines: 2,
      // overflow: TextOverflow.ellipsis,
      // textAlign: TextAlign.center,
      style: TextStyle(
        color: Color.fromARGB(255, 158, 149, 204),
        // decoration: TextDecoration.none,
        // fontStyle: FontStyle.italic,
        // fontFamily: "FontNameHere" ,
        fontWeight: FontWeight.w500,
        // fontWeight: FontWeight.w300,
        fontSize: 14.0,
      ),
    );
  }

  tnC_AND_text() {
    return Text(
      ' and ',
      // maxLines: 2,
      // overflow: TextOverflow.ellipsis,
      // textAlign: TextAlign.center,
      style: TextStyle(
        color: Color.fromARGB(255, 158, 149, 204),
        // decoration: TextDecoration.none,
        // fontStyle: FontStyle.italic,
        // fontFamily: "FontNameHere" ,
        // fontWeight: FontWeight.bold,
        fontWeight: FontWeight.w500,
        fontSize: 14.0,
      ),
    );
  }

  tnC_link() {
    return InkWell(
      onTap: () => launchUrl(Uri.parse('https://www.google.com')),
      child: Text('Terms of Use',
          style: TextStyle(
            decoration: TextDecoration.underline,
            color: Color.fromARGB(255, 158, 149, 204),
            fontSize: 14.0,
            fontWeight: FontWeight.w600,
          )),
    );
  }

  privacyPolicy_link() {
    return InkWell(
      onTap: () => launchUrl(Uri.parse('https://www.google.com')),
      child: Text('Privacy Policy',
          style: TextStyle(
            decoration: TextDecoration.underline,
            color: Color.fromARGB(255, 158, 149, 204),
            fontSize: 14.0,
            fontWeight: FontWeight.w600,
          )),
    );
  }
}
