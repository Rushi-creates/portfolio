import 'package:fp2/Dummy_data/MyPost_dummy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../myComponents.dart';

class FetchPosts_widget extends StatefulWidget {
  final Function(dynamic) listTile;
  // final Future<dynamic> Function(int counter) myFetchPostsFunc;
  final isFromSearchScreen;

  const FetchPosts_widget({
    Key? key,
    required this.listTile,
    // required this.myFetchPostsFunc,
    required this.isFromSearchScreen,
  }) : super(key: key);

  @override
  _FetchPosts_widgetState createState() => _FetchPosts_widgetState();
}

class _FetchPosts_widgetState extends State<FetchPosts_widget> {
  final ScrollController scrollController = ScrollController();

/* -------------------------------------------------------------------------- */
/*                            //! lifecycle methods                           */
/* -------------------------------------------------------------------------- */

  @override
  void initState() {
    super.initState();
    scrollController.addListener(scrollListener);

    // widget.isFromSearchScreen ? onRefreshFunc() : null;
    print('common fetchPosts init called');
    // BlocProvider.of<FetchPostsBloc>(context)
    //     .add(List_FetchPosts_Event(widget.myFetchPostsFunc));
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void scrollListener() {
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange) {
      print('list endedddd');
      // Future.delayed(Duration(milliseconds: 100), () {
      //   BlocProvider.of<FetchPostsBloc>(context)
      //       .add(List_FetchPosts_Event(widget.myFetchPostsFunc));
      // });
    }
  }

/* -------------------------------------------------------------------------- */
/*                                  //! Build                                 */
/* -------------------------------------------------------------------------- */

  @override
  Widget build(BuildContext context) {
    return myBody();
    // return Scaffold(
    //   backgroundColor: Colors.white,
    //   appBar: myHeader(),
    //   body: myBody(),
    // );
  }

/* -------------------------------------------------------------------------- */
/*                             //! body structure                             */
/* -------------------------------------------------------------------------- */

  // myBody_STATES() {
  //   return BlocConsumer<JooCudBloc, JooCudState>(
  //     listener: (context, state) {
  //       if (state is Joo_create_Loaded_State ||
  //           state is Joo_update_Loaded_State ||
  //           state is Joo_Delete_Loaded_state) {
  //         onRefreshFunc();
  //       }
  //     },
  //     builder: (context, state) {
  //       return myBody();
  //     },
  //   );
  // }

  myBody() {
    return RefreshIndicator(
      onRefresh: () async {
        print('Refreshed');
        // onRefreshFunc();
      },
      child: SingleChildScrollView(
          controller: scrollController,
          child: Column(
            children: [
              buildFetchPostsList(MyPost_dummy),
              // belowLastTile_STATES(),
              SizedBox(height: 60)
            ],
          )),
    );
  }

  // AppBar myHeader() {
  //   return AppBar(
  //     backgroundColor: Colors.white,
  //     centerTitle: true,
  //     // elevation: 0.0,
  //     // leading: IconButton(
  //     //     icon: Icon(
  //     //       Icons.arrow_back,
  //     //       color: Colors.black,
  //     //     ),
  //     //     onPressed: () {
  //     //       Navigator.push(context, MaterialPageRoute(builder: (context) {
  //     //         return FetchPostsScreen<Post>();
  //     //       }));
  //     //     }),
  //     // automaticallyImplyLeading: true,  //removes default back arrow on appbar

  //     title: Text(
  //       'Home', //give here appBar title
  //       style: TextStyle(color: Colors.black
  //           // fontWeight: FontWeight.bold
  //           // fontSize: 15,
  //           ),
  //     ),
  //     actions: [
  //       Padding(
  //         padding: const EdgeInsets.all(8.0),
  //         child: IconButton(
  //             onPressed: () {
  //               BlocProvider.of<FetchPostsBloc>(context)
  //                   .add(List_FetchPosts_Event(widget.myFetchPostsFunc));
  //             },
  //             icon: Icon(
  //               Icons.add,
  //               color: Colors.black,
  //             )),
  //       ),
  //       Padding(
  //         padding: const EdgeInsets.all(8.0),
  //         child: IconButton(
  //             onPressed: () {
  //               BlocProvider.of<FetchPostsBloc>(context)
  //                   .add(List_Refresh_Event());
  //               BlocProvider.of<FetchPostsBloc>(context)
  //                   .add(List_FetchPosts_Event(widget.myFetchPostsFunc));
  //             },
  //             icon: Icon(
  //               Icons.refresh,
  //               color: Colors.black,
  //             )),
  //       )
  //     ],
  //   );
  // }

/* -------------------------------------------------------------------------- */
/*                           //@ fetchPosts list states                            */
/* -------------------------------------------------------------------------- */

  // fetchPostsListStates() {
  //   return BlocBuilder<FetchPostsBloc, FetchPostsState>(
  //       builder: (context, state) {
  //     print(state);
  //     return
  //         // (state.fetchPostsList.first is YoutubeModel)
  //         //     ? buildFetchPostsList_ForYT(state.fetchPostsList)
  //         //     :
  //         buildFetchPostsList(state.fetchPostsList);
  //   });
  // }

  // buildFetchPostsList_ForYT(List listArg) {
  //   return listArg.isEmpty
  //       ? Text('empty')
  //       : ListView.builder(
  //           padding: EdgeInsets.zero,
  //           shrinkWrap: true,
  //           physics: NeverScrollableScrollPhysics(),
  //           scrollDirection: Axis.vertical,
  //           itemCount: listArg.length,
  //           itemBuilder: (context, i) {
  //             return widget.listTile(listArg[i]);
  //           },
  //         );
  // }

  buildFetchPostsList(List listArg) {
    return listArg.isEmpty
        ? Text('empty')
        : MasonryGridView.count(
            padding: EdgeInsets.zero,
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            crossAxisCount: 2,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
            itemCount: listArg.length,
            itemBuilder: (context, i) {
              return Column(
                children: [
                  i == 1 ? SizedBox(height: 50) : SizedBox(height: 0),
                  widget.listTile(listArg[i]),
                ],
              );
            },
          );
  }

/* -------------------------------------------------------------------------- */
/*               //! display error,loading states widgets                     */
/* -------------------------------------------------------------------------- */

  // belowLastTile_STATES() {
  //   return BlocBuilder<FetchPostsBloc, FetchPostsState>(
  //     builder: (context, state) {
  //       if (state is FetchPostsList_Loading_State) {
  //         return customLoadingWidget();
  //       } else if (state is FetchPostsList_Error_State) {
  //         // scrollController.addListener(scrollListener);  // this is imp
  //         // MyComponents.errorSnackBar(context, 'Some Network error');
  //         return connectionErrorText(context, state.error);
  //       } else if (state is FetchPostsList_LoadedEmpty_State) {
  //         scrollController.removeListener(scrollListener);
  //         return MyComponents.nothingMoreToLoad();
  //       }
  //       return MyComponents.emptyText();

  //       // loadMoreButton(context); //to use button instead of scroll controller
  //     },
  //   );
  // }

  connectionErrorText(context, error) {
    return Center(
      child: Row(
        children: [
          Text(
            'Connection error or \n Error: $error',
            style: TextStyle(color: Colors.red),
          ),
          // tryAgainButton(context)
        ],
      ),
    );
  }

  // tryAgainButton(context) {
  //   return TextButton(
  //     child: Text(
  //       "Try again",
  //       style: TextStyle(color: Colors.white),
  //     ),
  //     style: TextButton.styleFrom(backgroundColor: Colors.pink[600]),
  //     onPressed: () {
  //       BlocProvider.of<FetchPostsBloc>(context)
  //           .add(List_FetchPosts_Event(widget.myFetchPostsFunc));
  //     },
  //   );
  // }

  customLoadingWidget() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          MyComponents.buildLoading(),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }

  // loadMoreButton(context) {
  //   return TextButton(
  //     child: Text(
  //       "Load more ",
  //       style: TextStyle(color: Colors.white),
  //     ),
  //     style: TextButton.styleFrom(backgroundColor: Colors.pink[600]),
  //     onPressed: () {
  //       BlocProvider.of<FetchPostsBloc>(context)
  //           .add(List_FetchPosts_Event(widget.myFetchPostsFunc));
  //     },
  //   );
  // }

/* -------------------------------------------------------------------------- */
/*                         //# Sttic Helper functions                         */
/* -------------------------------------------------------------------------- */

  // onRefreshFunc() {
  //   BlocProvider.of<FetchPostsBloc>(context).add(List_Refresh_Event());
  //   BlocProvider.of<FetchPostsBloc>(context)
  //       .add(List_FetchPosts_Event(widget.myFetchPostsFunc));
  //   scrollController.addListener(scrollListener);
  // }
}


/* -------------------------------------------------------------------------- */
/*                                //? TUTORIAL                                */
/* -------------------------------------------------------------------------- */
// you can call fetchPostsWidget, anywhere you want
  //     //# call fetchPostsWidget anywhere,
  //     //# and pass func ( to fetchPosts which api list)
  //     //# and listTile widget ( to display props)

  // sampleWidget() {
  //   return Container(

  //     child: FetchPosts_widget<Post>(
  //       myFetchPostsFunc: (myCounter) => post_api_repo.fetchPostsPosts_byProp_pUid(
  //           myCounter,
  //           '1'), // pass actual filterProp here ( p_uid, user_fk, etc)
  //       listTile: (singleObj) => Text(singleObj.toString),
  //     ),
      

    // child: FetchPosts_widget<UserAcc>(
      //   myFetchPostsFunc: (myCounter) => user_api_repo.fetchPostsAll(
      //     myCounter,
      //   ),
      //   listTile: (singleObj) => MyListTile(singleObj: singleObj),
      // ),

  //   );
  // }

/* -------------------------------------------------------------------------- */
/*                   //? in main.dart - multip BlocProvider                   */
/* -------------------------------------------------------------------------- */
//  MultiBlocProvider(
//       providers: [

//         BlocProvider<FetchPostsBloc<UserAcc>>(create: (context) => FetchPostsBloc<UserAcc>()),
//         BlocProvider<FetchPostsBloc<Post>>(create: (context) => FetchPostsBloc<Post>()),

//       ])