import 'package:carousel_slider/carousel_slider.dart';
import 'package:fp2/MODULES/PROFILE/Posts/CommonListTile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../my_chips_logic/my_chips_bloc.dart';
import 'fetchPosts_stub/fetchPosts_widget.dart';

//to change class name = right click on className> Rename symbol
class TrendsCarousel_widget extends StatefulWidget {
  final isFromSearchScreen;
  const TrendsCarousel_widget({required this.isFromSearchScreen});

  @override
  _TrendsCarousel_widgetState createState() => _TrendsCarousel_widgetState();
}

class _TrendsCarousel_widgetState extends State<TrendsCarousel_widget> {
  CarouselController buttonCarouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    return myBody();
  }

  myBody() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20.0),
          topLeft: Radius.circular(20.0),
        ),
      ),
      child: Column(
        children: [
          fourButtonsRow(),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: CarouselSlider(
              carouselController: buttonCarouselController,
              items: [
                //!
                FetchPosts_widget(
                  isFromSearchScreen: widget.isFromSearchScreen,
                  listTile: (singleObj) => CommonListTile_widget(),
                ),

//!
                FetchPosts_widget(
                  isFromSearchScreen: widget.isFromSearchScreen,
                  listTile: (singleObj) => CommonListTile_widget(),
                ),
                //!
                FetchPosts_widget(
                  isFromSearchScreen: widget.isFromSearchScreen,
                  listTile: (singleObj) => CommonListTile_widget(),
                ),
                //!
                FetchPosts_widget(
                  isFromSearchScreen: widget.isFromSearchScreen,
                  listTile: (singleObj) => CommonListTile_widget(),
                ),
              ],
              options: CarouselOptions(
                viewportFraction: 1,
                pageSnapping: true,
                aspectRatio: 16 / 25,

                // height: 1000,
                // aspectRatio: 1 / MediaQuery.of(context).devicePixelRatio,
                // autoPlay: true,
                // autoPlayInterval: Duration(seconds: 3),
                // pauseAutoPlayOnTouch: true,
                // pauseAutoPlayOnManualNavigate: true,
                enlargeCenterPage: true,
                enlargeFactor: 0.15,
                enableInfiniteScroll: true,
                scrollDirection: Axis.horizontal,
                onPageChanged: ((index, reason) {
                  if (index == 0) {
                    BlocProvider.of<MyChipsBloc>(context)
                        .add(SongChipClicked_Event());
                  } else if (index == 1) {
                    BlocProvider.of<MyChipsBloc>(context)
                        .add(MoviesChipClicked_Event());
                  } else if (index == 2) {
                    BlocProvider.of<MyChipsBloc>(context)
                        .add(YoutubeChipClicked_Event());
                  } else if (index == 3) {
                    BlocProvider.of<MyChipsBloc>(context)
                        .add(CustomChipClicked_Event());
                  }
                }),
                // onScrolled: ((floatValue) {
                //   int value = floatValue!.floor();
                //   print(value);
                //   if (value == 10000) {
                //     BlocProvider.of<MyChipsBloc>(context)
                //         .add(SongChipClicked_Event());
                //   } else if (value == 10001) {
                //     BlocProvider.of<MyChipsBloc>(context)
                //         .add(MoviesChipClicked_Event());
                //   } else if (value == 10002) {
                //     BlocProvider.of<MyChipsBloc>(context)
                //         .add(YoutubeChipClicked_Event());
                //   } else if (value == 10003) {
                //     BlocProvider.of<MyChipsBloc>(context)
                //         .add(CustomChipClicked_Event());
                //   }

                // // ! works as wanted ( but resource consuming)
                // if (value! >= 0 && value < 0.5) {
                //   BlocProvider.of<MyChipsBloc>(context)
                //       .add(SongChipClicked_Event());
                //   print('event called');
                // } else if (value >= 0.5 && value < 1.5) {
                //   BlocProvider.of<MyChipsBloc>(context)
                //       .add(MoviesChipClicked_Event());
                //   print('event called');
                // } else if (value >= 1.5 && value < 2.5) {
                //   BlocProvider.of<MyChipsBloc>(context)
                //       .add(YoutubeChipClicked_Event());
                //   print('event called');
                // } else if (value >= 2.5 && value <= 3) {
                //   BlocProvider.of<MyChipsBloc>(context)
                //       .add(CustomChipClicked_Event());
                //   print('event called');
                // }
                // }
                // )
              ),
            ),
          ),
        ],
      ),
    );
  }

/* -------------------------------------------------------------------------- */
/*                                  //! chips                                 */
/* -------------------------------------------------------------------------- */

  /* -------------------------------------------------------------------------- */
/*                              //! 4 Buttons row                             */
/* -------------------------------------------------------------------------- */
  fourButtonsRow() {
    return Padding(
      padding: const EdgeInsets.all(20),
      // padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          //@ SONG

          BlocBuilder<MyChipsBloc, MyChipsState>(
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
              } else if (state is MyChipsInitial) {
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
          ),

          //

          //@ MOVIE BLOC
          BlocBuilder<MyChipsBloc, MyChipsState>(
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
          ),

          //

          //@  SERIES BLOC

          BlocBuilder<MyChipsBloc, MyChipsState>(
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
          ),

          //

          //@ CUSTOM BLOC
          BlocBuilder<MyChipsBloc, MyChipsState>(
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
          ),
        ],
      ),
    );
  }

  singleButton(
    int index,
    Color color1,
    Color color2,
    Color boxShadow_color,
    MyChipsEvent eventArg,
    String label,
    String icon,
  ) {
    var dimVar = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        buttonCarouselController.jumpToPage(index);

        // BlocProvider.of<MyChipsBloc>(context).add(eventArg);
      },
      child: SizedBox(
        width: 80,
        height: 35,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            boxShadow: [
              BoxShadow(
                  color: boxShadow_color,
                  blurRadius: 60,
                  offset: Offset(0, 20)),
            ],
            // shape: BoxShape.rectangle,
            // image: DecorationImage(image: AssetImage(icon)),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                color1,
                color2,
              ],
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // FittedBox(
              //   child: Padding(
              //     padding: const EdgeInsets.all(8.0),
              //     child: SizedBox(
              //       // height: dimVar.height * 0.3,
              //       // width: dimVar.width * 0.05,
              //       child: Container(
              //         decoration: BoxDecoration(
              //             shape: BoxShape.rectangle,
              //             image: DecorationImage(
              //                 image: AssetImage(icon), fit: BoxFit.fill)),
              //       ),
              //     ),
              //   ),
              // ),
              Text(
                label,
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
                  fontSize: 12.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
