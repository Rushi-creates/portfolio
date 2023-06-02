import 'package:fp2/MODULES/Auth_srcreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../service_layer_stub/models/Movie.dart';
import '../service_layer_stub/models/Series.dart';
import '../service_layer_stub/models/Songs.dart';
import '../service_layer_stub/models/YoutubeModel.dart';
import 'MY_CREATE_POST/Movies_tab/trending_movies_fetch_logic/trending_movies_fetch_bloc.dart';
import 'MY_CREATE_POST/Series_tab/trending_series_fetch_logic/trending_series_fetch_bloc.dart';
import 'MY_CREATE_POST/Songs_tab/trending_spngs_fetch_logic/trending_songs_fetch_bloc.dart';
import 'MY_CREATE_POST/Youtube_tab/trending_youtube_fetch_logic/trending_youtube_fetch_bloc.dart';
import 'My_BottomBar_stub/My_BottomBar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen();

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    //!
    // BlocProvider.of<FetchPostsBloc<Movie>>(context)
    //     .add(List_Refresh_Event<Movie>());
    // BlocProvider.of<FetchPostsBloc<Series>>(context)
    //     .add(List_Refresh_Event<Series>());
    // BlocProvider.of<FetchPostsBloc<YoutubeModel>>(context)
    //     .add(List_Refresh_Event<YoutubeModel>());
    // BlocProvider.of<FetchPostsBloc<Songs>>(context)
    //     .add(List_Refresh_Event<Songs>());

    // //!

    // BlocProvider.of<FetchPostsBloc<Movie>>(context).add(
    //     List_FetchPosts_Event<Movie>((counter) =>
    //         myCreatePost_api_repo.fetchProp(counter,
    //             Profile_sp_repo.get_profile()!.p_uid.toString(), 'Movies')));
    // BlocProvider.of<FetchPostsBloc<Series>>(context).add(
    //     List_FetchPosts_Event<Series>((counter) =>
    //         myCreatePost_api_repo.fetchProp(counter,
    //             Profile_sp_repo.get_profile()!.p_uid.toString(), 'Series')));
    // BlocProvider.of<FetchPostsBloc<YoutubeModel>>(context).add(
    //     List_FetchPosts_Event<YoutubeModel>((counter) =>
    //         myCreatePost_api_repo.fetchProp(counter,
    //             Profile_sp_repo.get_profile()!.p_uid.toString(), 'Youtube')));
    // BlocProvider.of<FetchPostsBloc<Songs>>(context).add(
    //     List_FetchPosts_Event<Songs>((counter) =>
    //         myCreatePost_api_repo.fetchProp(counter,
    //             Profile_sp_repo.get_profile()!.p_uid.toString(), 'Songs')));

    //!

    BlocProvider.of<TrendingSongsFetchBloc>(context)
        .add(FetchTrendingSongs_Event());
    BlocProvider.of<TrendingYoutubeFetchBloc>(context)
        .add(FetchTrendingYoutube_Event());
    BlocProvider.of<TrendingMoviesFetchBloc>(context)
        .add(FetchTrendingMovies_Event());
    BlocProvider.of<TrendingSeriesFetchBloc>(context)
        .add(FetchTrendingSeries_Event());

    blocFunc();
  }

  blocFunc() {
    Future.delayed(Duration(milliseconds: 2000), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return AuthScreen();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 14, 0, 143),
        body: newDesignSplashScreenUi());
  }

  newDesignSplashScreenUi() {
    return Container(
      child: Center(
        child: Text(
          "Current Trends",
          // maxLines: 2,
          // overflow: TextOverflow.ellipsis,
          // textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            // decoration: TextDecoration.none,
            // fontStyle: FontStyle.italic,
            // fontFamily: "FontNameHere" ,
            // fontWeight: FontWeight.bold,
            // fontWeight: FontWeight.w300,
            fontSize: 20.0,
          ),
        ),
      ),
      // child: Image.asset("images/blackLogo.png", height: 250, width: 250)),
    );
  }

  /* -------------------------------------------------------------------------- */
/*                          //@ Initialize all blocs                          */
/* -------------------------------------------------------------------------- */

  resetBlocs() {}

  initializeBlocs() {}
}
