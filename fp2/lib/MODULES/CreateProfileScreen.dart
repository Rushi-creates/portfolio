import 'package:fp2/MODULES/My_BottomBar_stub/My_BottomBar.dart';
import 'package:flutter/material.dart';

import 'myComponents.dart';

class CreateProfileScreen extends StatefulWidget {
  final isFromProfileScreen;
  const CreateProfileScreen({Key? key, this.isFromProfileScreen})
      : super(key: key);
  const CreateProfileScreen.fromProfileScreen(
      {required this.isFromProfileScreen});

  @override
  _CreateProfileScreenState createState() => _CreateProfileScreenState();
}

class _CreateProfileScreenState extends State<CreateProfileScreen> {
/* -------------------------------------------------------------------------- */
/*                               //! controllers                              */
/* -------------------------------------------------------------------------- */
  final _createFormKey = GlobalKey<FormState>();

  /* -------------------------------------------------------------------------- */
/*                               //@ controllers                              */
/* -------------------------------------------------------------------------- */

  TextEditingController userName_Controller = TextEditingController();
  TextEditingController bio_Controller = TextEditingController();

/* -------------------------------------------------------------------------- */
/*                            //! lifcycle methods                            */
/* -------------------------------------------------------------------------- */

  // @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myHeader(),
      backgroundColor: Colors.white,
      // resizeToAvoidBottomInset: false,
      body: myBody(),
    );
  }

  myBody() {
    var dimVar = MediaQuery.of(context).size;

//height : dimVar.height*0.5    //to access height
//width : dimVar.width*0.5       //acces width
    return SafeArea(
        child: SingleChildScrollView(
      child: Form(
        key: _createFormKey,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: dimVar.height * 0.01),
            //
            Align(
              alignment: AlignmentDirectional.topStart,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(45.0, 1, 8.0, 1),
                child: Text(
                  widget.isFromProfileScreen != null
                      ? "UPDATE PROFILE"
                      : "CREATE PROFILE",
                  // maxLines: 2,
                  // overflow: TextOverflow.ellipsis,
                  // textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      // decoration: TextDecoration.none,
                      // fontStyle: FontStyle.italic,
                      // fontFamily: "Rubik",
                      fontWeight: FontWeight.bold,
                      // fontWeight: FontWeight.w300,
                      fontSize: 22),
                ),
              ),
            ),

            //

            SizedBox(height: 40),

            //

            // CircleAvatar(
            //   radius: dimVar.height * 0.08,
            //   backgroundColor: Color(0xffFFE247),
            //   // backgroundImage: NetworkImage(GAuth_sp_repo.spGet_userPhotoUrl()),
            // ),

            //
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  MyComponents.buildTextField(
                      userName_Controller, 'Enter username'),
                  MyComponents.buildTextField(bio_Controller, 'Enter bio'),
                ],
              ),
            ),

            SizedBox(height: 5),

            submitButton()
          ],
        ),
      ),
    ));
  }

  submitButton() {
    var dimVar = MediaQuery.of(context).size;

//height : dimVar.height*0.5    //to access height
//width : dimVar.width*0.5       //acces width
    return SizedBox(
        width: dimVar.width * 0.85,
        height: dimVar.height * 0.065,
        child: TextButton(
          child: Text(
            widget.isFromProfileScreen != null
                ? "UPDATE PROFILE"
                : "CONTINUE TO APP",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          style: TextButton.styleFrom(backgroundColor: Colors.black),
          onPressed: () {
            if (_createFormKey.currentState!.validate()) {
              widget.isFromProfileScreen != null
                  ? Navigator.pop(context)
                  : Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                      return My_BottomBar();
                    }));
            }
          },
        ));
  }

/* -------------------------------------------------------------------------- */
/*                                 //@ STATES                                 */
/* -------------------------------------------------------------------------- */

  AppBar myHeader() {
    return AppBar(
        backgroundColor: Colors.white,
        // centerTitle: true,
        elevation: 0.0,

        //# Condition if called from profile screen
        leading: widget.isFromProfileScreen != null
            ? IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.pop(context);
                })
            : Container()
        // automaticallyImplyLeading: true, //removes default back arrow on appbar

        // title: Text(
        //   'Home', //give here appBar title
        //   style: TextStyle(color: Colors.black
        //       // fontWeight: FontWeight.bold
        //       // fontSize: 15,
        //       ),
        // ),
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.all(8.0),
        //     child: IconButton(
        //         onPressed: () {
        //           Navigator.push(context, MaterialPageRoute(builder: (context) {
        //             return Logout_screen();
        //           }));
        //         },
        //         icon: Icon(
        //           Icons.settings,
        //           color: Colors.black,
        //         )),
        //   )
        // ],
        );
  }
}
