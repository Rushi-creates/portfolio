import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../service_layer_stub/models/Movie.dart';
import '../../service_layer_stub/models/Series.dart';
import '../../service_layer_stub/models/Songs.dart';
import '../../service_layer_stub/models/YoutubeModel.dart';
import '../My_BottomBar_stub/my_chips2_logic/my_chips2_bloc.dart';
import '../myComponents.dart';
import 'SingleCreatePost_Card.dart';

//to change class name = right click on className> Rename symbol
class CreatePost_Screen extends StatefulWidget {
  final isFromSearchScreen;
  final buttonCarouselController;
  const CreatePost_Screen(
      {Key? key,
      required this.isFromSearchScreen,
      required this.buttonCarouselController});

  @override
  _CreatePost_ScreenState createState() => _CreatePost_ScreenState();
}

class _CreatePost_ScreenState extends State<CreatePost_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // resizeToAvoidBottomInset: false,
      appBar: myHeader(),
      body: myBody(),
    );
  }

  myBody() {
    return GestureDetector(
      onTap: () {
        print('focus shifted');
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            // Align(
            //   alignment: Alignment.center,
            //   child: myHeaderTitle(),
            // ),

            // SizedBox(height: MyComponents.screenSize(context).height * 0.01),
            // SizedBox(height: MyComponents.screenSize(context).height * 0.065),
            fourButtonsRow(),
            SizedBox(height: MyComponents.screenSize(context).height * 0.02),
            myCarouselSlider(),
            SizedBox(height: MyComponents.screenSize(context).height * 0.005),
            // createPost_button(),
            // SizedBox(height: MyComponents.screenSize(context).height * 0.0035),
            // SizedBox(height: 15),
          ],
        ),
      )),
    );
  }

/* -------------------------------------------------------------------------- */
/*                             //! Carousel slider                            */
/* -------------------------------------------------------------------------- */

  myCarouselSlider() {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Color.fromRGBO(46, 57, 74, 0.06),
            blurRadius: 50,
            offset: Offset(0, -30))
      ]),
      child: CarouselSlider(
        carouselController: widget.buttonCarouselController,
        items: [
          SingleCreatePost_Card<Songs>(headingText: 'Songs'),
          SingleCreatePost_Card<Movie>(headingText: 'Movies'),
          SingleCreatePost_Card<YoutubeModel>(headingText: 'Youtube'),
          SingleCreatePost_Card<Series>(headingText: 'Series'),
        ],
        options: CarouselOptions(
          viewportFraction: 1,
          pageSnapping: true,
          height: MyComponents.screenSize(context).height * 0.75,
          aspectRatio: 16 / 9,
          // aspectRatio: 1 / MediaQuery.of(context).devicePixelRatio,
          // autoPlay: true,
          // autoPlayInterval: Duration(seconds: 3),
          // pauseAutoPlayOnTouch: true,
          // pauseAutoPlayOnManualNavigate: true,
          enlargeCenterPage: true,
          enlargeFactor: 0.15,
          enableInfiniteScroll: false,
          scrollDirection: Axis.horizontal,
          onPageChanged: ((index, reason) {
            if (index == 0) {
              BlocProvider.of<MyChips2Bloc>(context)
                  .add(SongChipClicked_Event());
            } else if (index == 1) {
              BlocProvider.of<MyChips2Bloc>(context)
                  .add(MoviesChipClicked_Event());
            } else if (index == 2) {
              BlocProvider.of<MyChips2Bloc>(context)
                  .add(YoutubeChipClicked_Event());
            } else if (index == 3) {
              BlocProvider.of<MyChips2Bloc>(context)
                  .add(CustomChipClicked_Event());
            }
          }),
        ),
      ),
    );
  }

/* -------------------------------------------------------------------------- */
/*                                 //! Header                                 */
/* -------------------------------------------------------------------------- */
  headerDescription() {
    return Text(
      "Share your trend with others", //give here appBar title
      style: TextStyle(
        color: Color.fromARGB(255, 153, 153, 153),
        fontFamily: "Poppins",
        // fontWeight: FontWeight.w700,
        fontSize: 9,
      ),
    );
  }

  myHeaderTitle() {
    return Text(
      "Create Your Trend",
      // maxLines: 2,
      // overflow: TextOverflow.ellipsis,
      // textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.black,
        // decoration: TextDecoration.none,
        // fontStyle: FontStyle.italic,
        // fontFamily: "FontNameHere" ,
        fontWeight: FontWeight.bold,
        // fontWeight: FontWeight.w300,
        fontSize: 20.0,
      ),
    );
  }

  AppBar myHeader() {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      elevation: 0.0,
      //leading: IconButton(
      //  icon: Icon(
      //   Icons.arrow_back,
      //   color: Colors.black,
      //   ),
      //   onPressed: (){
      //       Navigator.pop(context);
      //   }
      // ),
      // automaticallyImplyLeading: true,  //removes default back arrow on appbar

      title: Column(
        children: [
          Text(
            'Create Your Trend', //give here appBar title
            style: TextStyle(
              color: Color(0xff342E44),
              fontFamily: "Poppins",
              fontWeight: FontWeight.w700,
              fontSize: 24,
            ),
          ),
          // headerDescription()
        ],
      ),
      //actions: [

      //  Padding(
      //    padding: const EdgeInsets.all(8.0),
      //   child: IconButton(
      //       onPressed: null,
      //       icon: Icon(
      //         Icons.search,
      //         color: Colors.black,
      //       )), )
      // ],
    );
  }

/* -------------------------------------------------------------------------- */
/*                                     //!                                    */
/* -------------------------------------------------------------------------- */

  fourButtonsRow() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          songButton(),
          movieButton(),
          seriesButton(),
          YoutubeButton(),
        ]));
  }

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
            Colors.transparent,
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
            Colors.transparent,
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
            Colors.transparent,
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
            Colors.transparent,
            CustomChipClicked_Event(),
            'Series',
            'images/Custom_black.png');
      },
    );
  }

  singleButton(int index, Color color1, Color color2, Color boxShadow_color,
      MyChips2Event eventArg, String label, String icon) {
    var dimVar = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        widget.buttonCarouselController.jumpToPage(index);

        // BlocProvider.of<MyButtonBarBloc>(context).add(eventArg);
      },
      child: CircleAvatar(
        radius: dimVar.width * 0.08,
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: boxShadow_color,
                  blurRadius: 60,
                  offset: Offset(0, 20)),
            ],
            shape: BoxShape.circle,
            image: DecorationImage(image: AssetImage(icon)),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                color1,
                color2,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
