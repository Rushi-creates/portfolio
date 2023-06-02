import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../service_layer_stub/services/secret_credentials/MoviesDb_paths.dart';
import 'Display_single_trend_logic/display_single_trend_bloc.dart';
import 'Movies_tab/trending_movies_fetch_logic/trending_movies_fetch_bloc.dart';
import 'Series_tab/trending_series_fetch_logic/trending_series_fetch_bloc.dart';
import 'Songs_tab/trending_spngs_fetch_logic/trending_songs_fetch_bloc.dart';
import 'Youtube_tab/trending_youtube_fetch_logic/trending_youtube_fetch_bloc.dart';

class TopTrends_widget<T> extends StatefulWidget {
  final headingText;
  const TopTrends_widget({Key? key, required this.headingText})
      : super(key: key);

  @override
  _TopTrends_widgetState<T> createState() => _TopTrends_widgetState<T>();
}

class _TopTrends_widgetState<T> extends State<TopTrends_widget<T>>
    with AutomaticKeepAliveClientMixin<TopTrends_widget<T>> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return myBody();
  }

  @override
  void initState() {
    super.initState();
    // BlocProvider.of<TrendingSongsFetchBloc>(context)
    //     .add(FetchTrendingSongs_Event());
    // BlocProvider.of<TrendingYoutubeFetchBloc>(context)
    //     .add(FetchTrendingYoutube_Event());
    // BlocProvider.of<TrendingMoviesFetchBloc>(context)
    //     .add(FetchTrendingMovies_Event());
    // BlocProvider.of<TrendingSeriesFetchBloc>(context)
    //     .add(FetchTrendingSeries_Event());
  }

  myBody() {
    return Column(
      children: [
        // SizedBox(height: MyComponents.screenSize(context).height * 0.01),
        // Align(
        //   alignment: Alignment.centerLeft,
        //   child: trending_posts_headingText(),
        // ),
        widget.headingText == 'Movies'
            ? fetchTrendingMovies_states()
            : widget.headingText == 'Youtube'
                ? fetchTrendingYoutube_states()
                : widget.headingText == 'Songs'
                    ? fetchTrendingSongs_states()
                    : widget.headingText == 'Series'
                        ? fetchTrendingSeries_states()
                        : fetchTrendingMovies_states()
      ],
    );
  }

/* -------------------------------------------------------------------------- */
/*                            //! Display top trends                          */
/* -------------------------------------------------------------------------- */
// make this class instead of func
  trending_posts_headingText() {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Text(
        "Trending ${widget.headingText}",
        // maxLines: 2,
        // overflow: TextOverflow.ellipsis,
        // textAlign: TextAlign.center,
        style: TextStyle(
          color: Color(0xff2E394A),
          // decoration: TextDecoration.none,
          // fontStyle: FontStyle.italic,
          fontFamily: "Poppins",
          // fontWeight: FontWeight.bold,
          fontWeight: FontWeight.w600,
          fontSize: 18.0,
        ),
      ),
    );
  }

  topTrends_Cards(list) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: GridView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 3),
        scrollDirection: Axis.vertical,
        itemCount: widget.headingText == 'Songs' ||
                widget.headingText == 'Movies' ||
                widget.headingText == 'Series'
            ? list.results.take(4).length
            : list.items.take(4).length, //for yt,
        itemBuilder: (context, i) {
          return
              //! single
              topTrends_singleCard(
                  cardIndex: i,

                  //! icon
                  icon: widget.headingText == 'Songs'
                      ? list.results[i].artworkUrl100
                      : widget.headingText == 'Movies' ||
                              widget.headingText == 'Series'
                          ? MovieApiLinks.imagePrefixUrl +
                              list.results[i].poster_path
                          : list.items[i].snippet.thumbnails.high.url,

                  //! title
                  title: widget.headingText == 'Movies'
                      ? list.results[i].title
                      : widget.headingText == 'Series'
                          ? list.results[i].name
                          : widget.headingText == 'Youtube'
                              ? list.items[i].snippet.title
                              : widget.headingText == 'Songs'
                                  ? list.results[i].trackName
                                  : list.results[i].title,

                  //! wholeobj
                  wholeObj: widget.headingText == 'Songs' ||
                          widget.headingText == 'Movies' ||
                          widget.headingText == 'Series'
                      ? list.results[i]
                      : list.items[i]);
        },
      ),
    );
  }

  topTrends_singleCard(
      {required int cardIndex,
      required String icon,
      required String title,
      required wholeObj}) {
    var dimVar = MediaQuery.of(context).size;

    return SizedBox(
      // height: 20,
      // width: dimVar.width * 0.4,
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Color.fromRGBO(234, 233, 241, 0.8),
              blurRadius: 50,
              offset: Offset(0, 35)),
        ]),
        child: Card(
          elevation: 0,
          // shadowColor: Colors.grey.withOpacity(0.8),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: Colors.white,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Row(children: [
                SizedBox(
                  height: 30,
                  width: 30,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                        fit: BoxFit.cover, height: 48, width: 48, icon),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      // softWrap: false,
                      style: TextStyle(
                        color: Color(0xff2E394A),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: 9,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  child: IconButton(
                    color: Colors.grey,
                    icon: Icon(Icons.add),
                    onPressed: () {
                      print('icon pressed');

                      // BlocProvider.of<MyToggleIconButtonBloc>(context)
                      //     .add(Toggle_turnOff_Event());

                      //@ Bloc provider event call

                      if (widget.headingText == 'Movies') {
                        BlocProvider.of<DisplaySingleTrendBloc<T>>(context)
                            .add(AddTrend_Event<T>(wholeObj));
                      } else if (widget.headingText == 'Youtube') {
                        BlocProvider.of<DisplaySingleTrendBloc<T>>(context)
                            .add(AddTrend_Event<T>(wholeObj));
                      } else if (widget.headingText == 'Songs') {
                        BlocProvider.of<DisplaySingleTrendBloc<T>>(context)
                            .add(AddTrend_Event<T>(wholeObj));
                      } else if (widget.headingText == 'Series') {
                        BlocProvider.of<DisplaySingleTrendBloc<T>>(context)
                            .add(AddTrend_Event<T>(wholeObj));
                      }
                    },
                  ),
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }

  // on_onIconPressed(wholeObj) {
  //   print('Button turned off');

  //   if (widget.headingText == 'Movies') {
  //     BlocProvider.of<MyMovieCartBloc>(context).add(AddMovie_Event(wholeObj));
  //   } else if (widget.headingText == 'Series') {
  //     BlocProvider.of<MySeriesCartBloc>(context).add(AddSeries_Event(wholeObj));
  //   } else if (widget.headingText == 'Songs') {
  //     BlocProvider.of<MySongCartBloc>(context).add(AddSong_Event(wholeObj));
  //   }
  // }

  // on_offIconPressed(index) {
  //   print('Button turned on');
  //   if (widget.headingText == 'Movies') {
  //     BlocProvider.of<MyMovieCartBloc>(context).add(RemoveMovie_Event(index));
  //   } else if (widget.headingText == 'Series') {
  //     BlocProvider.of<MySeriesCartBloc>(context).add(RemoveSeries_Event(index));
  //   } else if (widget.headingText == 'Songs') {
  //     BlocProvider.of<MySongCartBloc>(context).add(RemoveSong_Event(index));
  //   } else if (widget.headingText == 'Custom') {
  //     BlocProvider.of<MyCustomCartBloc>(context).add(RemoveCustom_Event(index));
  //   }
  // }

/* -------------------------------------------------------------------------- */
/*                       //! States for trending movies                       */
/* -------------------------------------------------------------------------- */

  fetchTrendingSongs_states() {
    return BlocBuilder<TrendingSongsFetchBloc, TrendingSongsFetchState>(
      builder: (context, state) {
        if (state is TrendingSongsFetch_Success_State) {
          return topTrends_Cards(state.trendSongsList);
        } else if (state is TrendingSongsFetch_Loading_State) {
          return CircularProgressIndicator();
        } else if (state is TrendingSongsFetch_Error_State) {
          return Text('state => ${state.error}');
        }
        return Text(
            'Some Problem loading trending songs,\nPlease restart the app');
      },
    );
  }

  fetchTrendingMovies_states() {
    return BlocBuilder<TrendingMoviesFetchBloc, TrendingMoviesFetchState>(
      builder: (context, state) {
        if (state is TrendingMoviesFetch_Success_State) {
          return topTrends_Cards(state.trendMovieList);
        } else if (state is TrendingMoviesFetch_Loading_State) {
          return CircularProgressIndicator();
        } else if (state is TrendingMoviesFetch_Error_State) {
          return Text('state => ${state.error}');
        }
        return Text(
            'Some Problem loading trending movies,\nPlease restart the app');
      },
    );
  }

  fetchTrendingSeries_states() {
    return BlocBuilder<TrendingSeriesFetchBloc, TrendingSeriesFetchState>(
      builder: (context, state) {
        if (state is TrendingSeriesFetch_Success_State) {
          return topTrends_Cards(state.trendSeriesList);
        } else if (state is TrendingSeriesFetch_Loading_State) {
          return CircularProgressIndicator();
        } else if (state is TrendingSeriesFetch_Error_State) {
          return Text('state => ${state.error}');
        }
        return Text(
            'Some Problem loading trending series,\nPlease restart the app');
      },
    );
  }

  fetchTrendingYoutube_states() {
    return BlocBuilder<TrendingYoutubeFetchBloc, TrendingYoutubeFetchState>(
      builder: (context, state) {
        if (state is TrendingYoutubeFetch_Success_State) {
          return topTrends_Cards(state.trendYoutubeList);
        } else if (state is TrendingYoutubeFetch_Loading_State) {
          return CircularProgressIndicator();
        } else if (state is TrendingYoutubeFetch_Error_State) {
          return Text('state => ${state.error}');
        }
        return Text(
            'Some Problem loading trending Youtube,\nPlease restart the app');
      },
    );
  }

/* -------------------------------------------------------------------------- */
/*                                   //! old                                  */
/* -------------------------------------------------------------------------- */
  // topTrends_Cards_old(list) {
  //   // String movieUrl =  ;
  //   // 'https://www.gratistodo.com/wp-content/uploads/2022/02/The-Batman-Posters-3.jpg';
  //   return Column(
  //     children: [
  //       Flex(
  //         direction: Axis.horizontal,
  //         children: [
  //           topTrends_singleCard(
  //               0,
  //               widget.headingText == 'Songs'
  //                   ? list.results[0].artworkUrl100
  //                   : MovieApiLinks.imagePrefixUrl +
  //                       list.results[0].poster_path,
  //               widget.headingText == 'Movies'
  //                   ? list.results[0].title
  //                   : widget.headingText == 'Youtube'
  //                       ? list.items[0].snippet.title
  //                       : widget.headingText == 'Songs'
  //                           ? list.results[0].trackName
  //                           : list.results[0].title,
  //               widget.headingText == 'Youtube'
  //                   ? list.items[0]
  //                   : list.results[0]),

  //                   //

  //           topTrends_singleCard(
  //               1,
  //               widget.headingText == 'Songs'
  //                   ? list.results[1].artworkUrl100
  //                   : MovieApiLinks.imagePrefixUrl +
  //                       list.results[1].poster_path,
  //               widget.headingText == 'Movies'
  //                   ? list.results[1].title
  //                   // : widget.headingText == 'Series'
  //                   //     ?
  //                   //     list.results[1].name
  //                   : widget.headingText == 'Youtube'
  //                       ? list.items[1].snippet.title
  //                       : widget.headingText == 'Songs'
  //                           ? list.results[1].trackName
  //                           : list.results[1].title,
  //               widget.headingText == 'Youtube'
  //                   ? list.items[1]
  //                   : list.results[1]),
  //         ],
  //       ),
  //       Flex(
  //         direction: Axis.horizontal,
  //         children: [
  //           topTrends_singleCard(
  //               2,
  //               widget.headingText == 'Songs'
  //                   ? list.results[2].artworkUrl100
  //                   : MovieApiLinks.imagePrefixUrl +
  //                       list.results[2].poster_path,
  //               widget.headingText == 'Movies'
  //                   ? list.results[2].title
  //                   : widget.headingText == 'Youtube'
  //                       ? list.items[2].snippet.title
  //                       : widget.headingText == 'Songs'
  //                           ? list.results[2].trackName
  //                           : list.results[2].title,
  //               widget.headingText == 'Youtube'
  //                   ? list.items[2]
  //                   : list.results[2]),
  //           topTrends_singleCard(
  //               3,
  //               widget.headingText == 'Songs'
  //                   ? list.results[3].artworkUrl100
  //                   : MovieApiLinks.imagePrefixUrl +
  //                       list.results[3].poster_path,
  //               widget.headingText == 'Movies'
  //                   ? list.results[3].title
  //                   : widget.headingText == 'Youtube'
  //                       ? list.items[3].snippet.title
  //                       : widget.headingText == 'Songs'
  //                           ? list.results[3].trackName
  //                           : list.results[3].title,
  //               widget.headingText == 'Youtube'
  //                   ? list.items[2]
  //                   : list.results[3]),
  //         ],
  //       )
  //     ],
  //   );
  // }
}
