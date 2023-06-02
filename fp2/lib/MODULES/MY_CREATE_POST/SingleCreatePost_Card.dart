import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../My_BottomBar_stub/my_chips2_logic/my_chips2_bloc.dart';
import 'DisplaySelection_YT_widget.dart';
import 'DisplaySelection_widget.dart';
import 'SearchBar_widget/SearchBar_widget.dart';
import 'TopTrends_widget.dart';

//to change class name = right click on className> Rename symbol
class SingleCreatePost_Card<T> extends StatefulWidget {
  final headingText;
  const SingleCreatePost_Card({Key? key, required this.headingText})
      : super(key: key);

  @override
  _SingleCreatePost_CardState<T> createState() =>
      _SingleCreatePost_CardState<T>();
}

class _SingleCreatePost_CardState<T> extends State<SingleCreatePost_Card<T>> {
  @override
  Widget build(BuildContext context) {
    return myBody();
  }

  myBody() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40.0),
            topRight: Radius.circular(40.0),
            bottomLeft: Radius.zero,
            bottomRight: Radius.zero),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 25.0,
          right: 25,
          // top: 25,
        ),
        child: Column(
          children: [
            SizedBox(height: 10),
            BlocBuilder<MyChips2Bloc, MyChips2State>(
              builder: (context, state) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: My_SearchBar<T>(
                    gradient1: (state is SongChipOpened_State)
                        ? Color(0xffFE8DAF)
                        : (state is MoviesChipOpened_State)
                            ? Color(0xff8FE5FC)
                            : (state is YoutubeChipOpened_State)
                                ? Color(0xffFFD199)
                                : (state is CustomChipOpened_State)
                                    ? Color(0xff5FF8D5)
                                    : Color(0xffFE8DAF),
                    gradient2: (state is SongChipOpened_State)
                        ? Color(0xffF6608D)
                        : (state is MoviesChipOpened_State)
                            ? Color(0xff47C7EB)
                            : (state is YoutubeChipOpened_State)
                                ? Color(0xffFEB25A)
                                : (state is CustomChipOpened_State)
                                    ? Color(0xff33DCB4)
                                    : Color(0xffF6608D),
                    headingText: widget.headingText,
                  ),
                );
              },
            ),

            //!
            TopTrends_widget<T>(headingText: widget.headingText),

            //!
            // BlocBuilder<DisplaySingleTrendBloc<T>, DisplaySingleTrendState<T>>(
            //   builder: (context, state) {
            //     if (state is TrendRemoved_State<T>) {
            //       return TopTrends_widget<T>(headingText: widget.headingText);
            //     }
            //     return Container();
            //   },
            // ),

            Align(
              alignment: Alignment.centerLeft,
              child: widget.headingText == 'Youtube'
                  ? DisplaySelectionYT_widget<T>(
                      headingText: widget.headingText,
                    )
                  : DisplaySelection_widget<T>(
                      headingText: widget.headingText,
                    ),
            )
          ],
        ),
      ),
    );
  }

/* -------------------------------------------------------------------------- */
/*                                     //!                                    */
/* -------------------------------------------------------------------------- */
  // displayDescription([state]) {
  //   String description =
  //       widget.headingText == 'Movies' ? "No movie selected" : 'Not selected';
  //   if (state != null) {
  //     print('state is not null');
  //     if (widget.headingText == 'Movies') {
  //       description = 'Movies';
  //     } else if (widget.headingText == 'Series') {
  //       description = 'Series';
  //     } else if (widget.headingText == 'Youtube') {
  //       description = state.snippet.channelTitle;
  //     } else if (widget.headingText == 'Songs') {
  //       print('Song trend type');
  //       print(state.trackName);
  //       description = state.artistName;
  //     } else if (widget.headingText == 'Custom') {
  //       description = state.description;
  //     }
  //   }
  //   return Padding(
  //     padding: const EdgeInsets.all(2.0),
  //     child: Text(
  //       description,
  //       // maxLines: 2,
  //       // overflow: TextOverflow.ellipsis,
  //       // textAlign: TextAlign.center,
  //       style: TextStyle(
  //         color: Colors.black,
  //         // decoration: TextDecoration.none,
  //         // fontStyle: FontStyle.italic,
  //         // fontFamily: "FontNameHere" ,
  //         // fontWeight: FontWeight.bold,
  //         // fontWeight: FontWeight.w300,
  //         // fontSize: 20.0,
  //       ),
  //     ),
  //   );
  // }

  // displayTitle([state]) {
  //   String title = 'Not selected';
  //   if (state != null) {
  //     print('state is not null');
  //     if (widget.headingText == 'Movies') {
  //       title = state.title;
  //     } else if (widget.headingText == 'Series') {
  //       title = state.name;
  //     } else if (widget.headingText == 'Youtube') {
  //       title = state.snippet.title;
  //     } else if (widget.headingText == 'Songs') {
  //       print('Song trend type');
  //       print(state.trackName);
  //       title = state.trackName;
  //     } else if (widget.headingText == 'Custom') {
  //       title = state.title;
  //     }
  //   }

  //   return Padding(
  //     padding: const EdgeInsets.all(2.0),
  //     child: Text(
  //       title,
  //       // maxLines: 2,
  //       // overflow: TextOverflow.ellipsis,
  //       // textAlign: TextAlign.center,
  //       style: TextStyle(
  //         color: Colors.black,
  //         // decoration: TextDecoration.none,
  //         // fontStyle: FontStyle.italic,
  //         // fontFamily: "FontNameHere" ,
  //         // fontWeight: FontWeight.bold,
  //         // fontWeight: FontWeight.w300,
  //         // fontSize: 20.0,
  //       ),
  //     ),
  //   );
  // }

  // displayImage([state]) {
  //   String url =
  //       'https://www.solidbackgrounds.com/images/2560x1440/2560x1440-davys-grey-solid-color-background.jpg';

  //   //
  //   if (state != null) {
  //     if (widget.headingText == 'Movies') {
  //       url = MovieApiLinks.imagePrefixUrl + state.poster_path;
  //     } else if (widget.headingText == 'Series') {
  //       url = MovieApiLinks.imagePrefixUrl + state.poster_path;
  //     } else if (widget.headingText == 'Youtube') {
  //       url = state.snippet.thumbnails.high.url;
  //     } else if (widget.headingText == 'Songs') {
  //       url = state.artworkUrl100.replaceAll('100x100', '600x600');
  //     } else if (widget.headingText == 'Custom') {
  //       url = state.image;
  //     }
  //   }

  //   //
  //   return SizedBox(
  //     height: MyComponents.screenSize(context).height * 0.3,
  //     width: MyComponents.screenSize(context).width * 0.45,
  //     child: Container(
  //       decoration: BoxDecoration(
  //         borderRadius: BorderRadius.all(Radius.circular(20)),
  //         shape: BoxShape.rectangle,
  //         image: DecorationImage(image: NetworkImage(url), fit: BoxFit.cover),
  //       ),
  //     ),
  //   );
  // }
}
