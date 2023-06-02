import 'package:flutter/material.dart';

import '../CreateProfileScreen.dart';
import '../FollowingScreen.dart';
import '../Settings_screen.dart';
import '../myComponents.dart';
import 'Posts/TrendsCarousel_widget.dart';

//to change class name = right click on className> Rename symbol
class ProfileScreen extends StatefulWidget {
  final isFromSearchScreen;
  // final profileObj;
  const ProfileScreen({
    required this.isFromSearchScreen,
  });
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
/* -------------------------------------------------------------------------- */
/*                                  //! Init                                  */
/* -------------------------------------------------------------------------- */

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // resizeToAvoidBottomInset: false,
      body: myBody(),
    );
  }

  myBody() {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Stack(
        children: [
          Stack(
            alignment: Alignment.centerLeft,
            children: [
              coverPhoto(),
              showUserDetails(),
            ],
          ),
          Column(
            children: [
              SizedBox(height: MyComponents.screenSize(context).height * 0.2),
              TrendsCarousel_widget(
                  isFromSearchScreen: widget.isFromSearchScreen),
            ],
          )
        ],
      ),
    );
  }

  showUserDetails() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, left: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.isFromSearchScreen ? dummyBackButton() : Container(),
          // Spacer(),
          myProfilePicHolder(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              myProfile_two(),
              SizedBox(height: 20),
              Row(
                children: [editProfile_button(), followingScreenIcon()],
              )
            ],
          ),
          Spacer(),
          widget.isFromSearchScreen ? Container() : mySettingsIcon()
        ],
      ),
    );
  }

  editProfile_button() {
    return SizedBox(
      width: MyComponents.screenSize(context).width * 0.3,
      child: TextButton.icon(
        icon: Icon(
          Icons.edit,
          size: 14,
          color: Color(0xff56A8E9),
        ),
        label: Text(
          "Edit Profile  ",
          style: TextStyle(
            color: Color(0xff56A8E9),
            fontSize: 12,
          ),
        ),
        style: TextButton.styleFrom(
          backgroundColor: Colors.white,
          side: BorderSide(
            color: Color.fromARGB(255, 136, 201, 255),
            width: 1.0,
          ),
        ),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return CreateProfileScreen.fromProfileScreen(
                isFromProfileScreen: true);
          }));
        },
      ),
    );
  }

  followingScreenIcon() {
    return SizedBox(
      width: MyComponents.screenSize(context).width * 0.1,
      child: TextButton.icon(
        icon: Icon(
          Icons.people,
          size: 14,
          color: Color(0xff56A8E9),
        ),
        label: Text(
          "",
          style: TextStyle(
            color: Color(0xff56A8E9),
            fontSize: 12,
          ),
        ),
        style: TextButton.styleFrom(
          backgroundColor: Colors.white,
          side: BorderSide(
            color: Color.fromARGB(255, 136, 201, 255),
            width: 1.0,
          ),
        ),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FollowingScreen(
              isAnotherProfile: widget.isFromSearchScreen,
            );
          }));
        },
      ),
    );
  }

  myProfilePicHolder() {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: CircleAvatar(
        backgroundColor: Colors.grey,
        backgroundImage: NetworkImage(
            'https://icon-library.com/images/no-profile-picture-icon/no-profile-picture-icon-14.jpg'),
        radius: 35.0,
      ),
    );
  }

  coverPhoto() {
    return SizedBox(
      height: MyComponents.screenSize(context).height * 0.22,
      width: MyComponents.screenSize(context).width,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          gradient: LinearGradient(colors: [
            Color(0xff2A8CD9),
            Color(0xff96D1FF),
          ], begin: Alignment.topRight, end: Alignment.bottomLeft),
          image: new DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('images/profile_cover_bg.png'),
          ),
        ),
      ),
    );
  }

  fakeRoundCorners() {
    return SizedBox(
      height: MyComponents.screenSize(context).height * 0.03,
      width: MyComponents.screenSize(context).width,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        child: Container(
          color: Colors.white,
        ),
      ),
    );
  }

  myProfile_two() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          // '@' +
          'Lucifer',
          // maxLines: 2,
          // overflow: TextOverflow.ellipsis,
          // textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xff2E394A),
            // decoration: TextDecoration.none,
            // fontStyle: FontStyle.italic,
            // fontFamily: "FontNameHere" ,
            fontWeight: FontWeight.bold,
            // fontWeight: FontWeight.w300,
            fontSize: 16.0,
          ),
        ),
        SizedBox(height: 2),
        Text(
          'Here to explore the app',
          // maxLines: 2,
          // overflow: TextOverflow.ellipsis,
          // textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xff2E394A),
            // decoration: TextDecoration.none,
            // fontStyle: FontStyle.italic,
            // fontFamily: "FontNameHere" ,
            // fontWeight: FontWeight.bold,
            // fontWeight: FontWeight.w300,
            fontSize: 12.0,
          ),
        ),
      ],
    );
  }

  mySettingsIcon() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: Color.fromARGB(17, 255, 255, 255),
      child: InkWell(
        onTap: () {
          // Navigate to settings screen
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return SettingScreen();
          }));
        },
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Icon(
            Icons.settings,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  dummyBackButton() {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Card(
        elevation: 0.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: Color.fromARGB(54, 255, 255, 255),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Icon(Icons.keyboard_backspace_sharp, color: Colors.white),
        ),
      ),
    );
  }
}
