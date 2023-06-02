import 'package:carousel_slider/carousel_controller.dart';
import 'package:fp2/MODULES/PROFILE/ProfileScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';

import '../DummyScreen.dart';
import '../Home.dart';
import '../MY_CREATE_POST/CreatePost_Screen.dart';
import 'MyBottomBar_logic/my_bottom_bar_bloc.dart';
import 'my_chips2_logic/my_chips2_bloc.dart';

class My_BottomBar extends StatefulWidget {
  const My_BottomBar({Key? key}) : super(key: key);

  @override
  _My_BottomBarState createState() => _My_BottomBarState();
}

class _My_BottomBarState extends State<My_BottomBar> {
  CarouselController buttonCarouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: true,
      //! location imp
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 12.0, bottom: 10),
        child: ExpandableFab(
          // childrenOffset: Offset(4, 12),
          backgroundColor: Colors.black,
          collapsedFabSize: ExpandableFabSize.regular,
          expandedFabSize: ExpandableFabSize.regular,
          // key: key,
          // duration: const Duration(seconds: 1),
          distance: 180.0,
          type: ExpandableFabType.fan,
          onOpen: () {
            BlocProvider.of<MyBottomBarBloc>(context)
                .add(MyBottomBar_ThreeCLicked_Event());
          },
          fanAngle: 90,
          child: const Icon(Icons.add),
          // foregroundColor: Colors.black,
          // backgroundColor: Colors.green,
          closeButtonStyle: const ExpandableFabCloseButtonStyle(
            child: Icon(Icons.close),
            // foregroundColor: Colors.deepOrangeAccent,
            backgroundColor: Colors.black,
          ),
          overlayStyle: ExpandableFabOverlayStyle(
            // color: Colors.black.withOpacity(0.5),
            blur: 2,
          ),

          children: [
            songButton(),
            movieButton(),
            seriesButton(),
            YoutubeButton(),
          ],
        ),
      ),

      backgroundColor: Colors.white,
      body: myBody(),
    );
  }

  myBody() {
    return Center(
      child: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [whichTabStates(), customBottombarDesign()],
      ),
    );
  }

  customBottombarDesign() {
    // final key = GlobalObjectKey<ExpandableFabState>(context);

    var dimVar = MediaQuery.of(context).size;

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: dimVar.height * 0.035),
            SizedBox(
                height: dimVar.height * 0.07,
                child: Container(
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(8),
                      // borderRadius: BorderRadius.only(
                      //     topLeft: Radius.circular(20),
                      //     topRight: Radius.circular(20)),
                      gradient: LinearGradient(
                          colors: [
                            // Colors.deepPurple,
                            // Colors.deepPurpleAccent,
                            // Color.fromARGB(255, 0, 27, 68),
                            // Color.fromARGB(255, 8, 0, 124),
                            Colors.white,
                            Colors.white,
                          ],
                          end: Alignment.topCenter,
                          begin: Alignment.bottomCenter)),
                  child: BlocBuilder<MyBottomBarBloc, MyBottomBarState>(
                      builder: (context, state) {
                    return Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          FittedBox(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: IconButton(
                                icon: Icon(
                                  (state is MyBottomBar_openTwo_State)
                                      ? Icons.home
                                      : Icons.home,
                                  color: (state is MyBottomBar_openOne_State)
                                      ? Colors.blue[900]
                                      : Colors.grey,
                                ),
                                onPressed: () {
                                  BlocProvider.of<MyBottomBarBloc>(context)
                                      .add(MyBottomBar_OneCLicked_Event());
                                },
                              ),
                            ),
                          ),
                          VerticalDivider(
                            width: 40,
                            color: Colors.white,
                          ),
                          FittedBox(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: IconButton(
                                icon: Icon(
                                  (state is MyBottomBar_openTwo_State)
                                      ? Icons.person
                                      : Icons.person_2_outlined,
                                  color: (state is MyBottomBar_openTwo_State)
                                      ? Colors.blue[900]
                                      : Colors.grey,
                                ),
                                onPressed: () {
                                  BlocProvider.of<MyBottomBarBloc>(context)
                                      .add(MyBottomBar_TwoCLicked_Event());
                                },
                              ),
                            ),
                          ),
                          VerticalDivider(
                            color: Colors.white,
                            width: 40,
                          ),
                          FittedBox(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: IconButton(
                                  icon: Icon(
                                    (state is MyBottomBar_openThree_State)
                                        ? Icons.person
                                        : Icons.person_2_outlined,
                                    color:
                                        (state is MyBottomBar_openThree_State)
                                            ? Colors.transparent
                                            : Colors.transparent,
                                  ),
                                  onPressed: null
                                  //  () {
                                  //   BlocProvider.of<MyBottomBarBloc>(context)
                                  //       .add(MyBottomBar_ThreeCLicked_Event());
                                  // },
                                  ),
                            ),
                          ),
                        ]);
                  }),
                )),
          ],
        ),

        //!

        //!
        // Align(
        //   alignment: Alignment.centerRight,
        //   child: Padding(
        //     padding: const EdgeInsets.only(right: 30.0),
        //     child: ExpandableFab(
        //       children: [
        //         songButton(),
        //         movieButton(),
        //         seriesButton(),
        //         YoutubeButton(),
        //       ],
        //     ),
        //   ),
        // )
        // CircleAvatar(
        //   backgroundColor: Colors.purple,
        //   radius: 30,
        // ),
      ],
    );
  }

  whichTabStates() {
    return BlocBuilder<MyBottomBarBloc, MyBottomBarState>(
        builder: (context, state) {
      if (state is MyBottomBar_openOne_State) {
        return Home();
      } else if (state is MyBottomBar_openTwo_State) {
        return ProfileScreen(
          isFromSearchScreen: false,
        );
      } else if (state is MyBottomBar_openThree_State) {
        return CreatePost_Screen(
            buttonCarouselController: buttonCarouselController,
            isFromSearchScreen: false);
      }

      // initial Screen here
      return DummyScreen();
    });
  }

// /* -------------------------------------------------------------------------- */
// /*                               //! FAB BUTTONS                              */
// /* -------------------------------------------------------------------------- */

  songButton() {
    return BlocBuilder<MyChips2Bloc, MyChips2State>(
      builder: (context, state) {
        if (state is SongChipOpened_State) {
          return singleButton(
              0,
              Color(0xffFE8DAF),
              Color(0xffF6608D),
              Color(0xffFE8DAF).withOpacity(0.4),
              SongChipClicked_Event(),
              'Song',
              'images/Music.png');
        } else if (state is MyChips2Initial) {
          return singleButton(
              0,
              Color(0xffFE8DAF),
              Color(0xffF6608D),
              Color(0xffFE8DAF).withOpacity(0.4),
              SongChipClicked_Event(),
              'Song',
              'images/Music.png');
        }
        return singleButton(
            0,
            // Color.fromARGB(255, 161, 161, 161),
            // Color.fromARGB(255, 83, 83, 83),
            Colors.white,
            Colors.white,
            Colors.grey,
            SongChipClicked_Event(),
            'Song',
            'images/Music_black.png');
      },
    );
  }

  movieButton() {
    return BlocBuilder<MyChips2Bloc, MyChips2State>(
      builder: (context, state) {
        if (state is MoviesChipOpened_State) {
          return singleButton(
              1,
              Color(0xff8FE5FC),
              Color(0xff47C7EB),
              Color(0xff8FE5FC).withOpacity(0.4),
              MoviesChipClicked_Event(),
              'Movie',
              'images/Movie.png');
        }

        return singleButton(
            1,
            // Color.fromARGB(255, 161, 161, 161),
            // Color.fromARGB(255, 83, 83, 83),
            Colors.white,
            Colors.white,
            Colors.grey,
            MoviesChipClicked_Event(),
            'Movie',
            'images/Movie_black.png');
      },
    );
  }

  seriesButton() {
    return BlocBuilder<MyChips2Bloc, MyChips2State>(
      builder: (context, state) {
        if (state is YoutubeChipOpened_State) {
          return singleButton(
              2,
              Color(0xffFFD199),
              Color(0xffFEB25A),
              Color.fromRGBO(255, 190, 113, 0.7),
              YoutubeChipClicked_Event(),
              'Youtube',
              'images/Series.png');
        }

        return singleButton(
            2,
            // Color.fromARGB(255, 161, 161, 161),
            // Color.fromARGB(255, 83, 83, 83),
            Colors.white,
            Colors.white,
            Colors.grey,
            YoutubeChipClicked_Event(),
            'Youtube',
            'images/Series_black.png');
      },
    );
  }

  YoutubeButton() {
    return BlocBuilder<MyChips2Bloc, MyChips2State>(
      builder: (context, state) {
        if (state is CustomChipOpened_State) {
          return singleButton(
              3,
              Color(0xff5FF8D5),
              Color(0xff33DCB4),
              Color(0xff5FF8D5).withOpacity(0.4),
              CustomChipClicked_Event(),
              'Series',
              'images/Custom.png');
        }

        return singleButton(
            3,
            // Color.fromARGB(255, 161, 161, 161),
            // Color.fromARGB(255, 83, 83, 83),
            Colors.white,
            Colors.white,
            Colors.grey,
            CustomChipClicked_Event(),
            'Series',
            'images/Custom_black.png');
      },
    );
  }

  singleButton(
    int index,
    Color color1,
    Color color2,
    Color boxShadow_color,
    MyChips2Event eventArg,
    String label,
    String icon,
  ) {
    var dimVar = MediaQuery.of(context).size;

    return GestureDetector(
        onTap: () {
          buttonCarouselController.jumpToPage(index);

          // BlocProvider.of<MyButtonBarBloc>(context).add(eventArg);
        },
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: boxShadow_color,
                blurRadius: 30,
                spreadRadius: 2,
                // offset: Offset(0, 20)
              ),
            ],
            gradient: LinearGradient(
              colors: [color1, color2],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            shape: BoxShape.circle,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: SizedBox(
                  height: 20,
                  width: 20,
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        image: DecorationImage(
                            image: AssetImage(icon), fit: BoxFit.fill)),
                  ),
                ),
              ),
              SizedBox(width: 5),
              Text(
                label,
                style: TextStyle(
                    color: Color.fromARGB(255, 122, 122, 122), fontSize: 8),
              ),
            ],
          ),
        ));
  }
}
