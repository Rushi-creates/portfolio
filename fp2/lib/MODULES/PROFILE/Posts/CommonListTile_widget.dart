import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../myComponents.dart';

class CommonListTile_widget extends StatelessWidget {
  CommonListTile_widget()
  // ;
  {}

  @override
  Widget build(BuildContext context) {
    return trendCard(context);
  }

  trendCard(context) {
    return GestureDetector(
      onTap: () {
        // fetchListFunc(context);
      },
      child: ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: Container(
            decoration: BoxDecoration(
              // borderRadius: BorderRadius.circular(30.0),
              shape: BoxShape.rectangle,
              color: Colors.grey,

              // image: DecorationImage(
              //     image: NetworkImage('url_here'), fit: BoxFit.fill)),
            ),
            child: SizedBox(
              height: MyComponents.screenSize(context).height * 0.3,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  CachedNetworkImage(
                      imageUrl: 'https://wallpaperaccess.com/full/2840317.jpg',
                      fit: BoxFit.cover),

                  //
                  SizedBox(
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                            Colors.transparent,
                            Colors.transparent,
                            Colors.black,
                          ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter)),
                    ),
                  ),
                  trendCard_text(),
                ],
              ),
            ),
          )),
    );
  }

  trendCard_text() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Title',

              // maxLines: 2,
              // overflow: TextOverflow.ellipsis,
              // textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                // decoration: TextDecoration.none,
                // fontStyle: FontStyle.italic,
                // fontFamily: "FontNameHere" ,
                fontWeight: FontWeight.bold,
                // fontWeight: FontWeight.w300,
                fontSize: 10.0,
              ),
            ),
            //
            Text(
              'Movie',

              // singleObj.artistName!,
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
                fontSize: 9.0,
              ),
            ),

            //!
            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    'Just loved it',
                    // singleObj.artistName!,
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
                      fontSize: 9.0,
                    ),
                  ),
                ),
                Flexible(
                  child: Text(
                    '23 feb 2023',
                    // singleObj.artistName!,
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
                      fontSize: 9.0,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

/* -------------------------------------------------------------------------- */
/*                             //@ Functionalities                            */
/* -------------------------------------------------------------------------- */

  // fetchListFunc(context) async {
  //   Navigator.push(context, MaterialPageRoute(builder: (context) {
  //     return DetailsCard_widget(
  //       //!

  //       title: //
  //           (singleObj is MovieResults)
  //               ? singleObj.title

  //               //
  //               : (singleObj is SeriesResults)
  //                   ? singleObj.name

  //                   //
  //                   : (singleObj is SongResults)
  //                       ? singleObj.trackName

  //                       //
  //                       : (singleObj is YoutubeSingleResult)
  //                           ? singleObj.items!.first.snippet!.title!
  //                           :

  //                           //
  //                           '',

  //       //!
  //       description: //
  //           (singleObj is MovieResults)
  //               ? 'Movie'

  //               //
  //               : (singleObj is SeriesResults)
  //                   ? 'Series'

  //                   //
  //                   : (singleObj is SongResults)
  //                       ? singleObj.artistName

  //                       //
  //                       : (singleObj is YoutubeSingleResult)
  //                           ? singleObj.items!.first.snippet!.channelTitle!
  //                           :

  //                           //
  //                           '',

  //       //!
  //       imageUrl: //

  //           //
  //           (singleObj is MovieResults)
  //               ? MovieApiLinks.imagePrefixUrl + singleObj.poster_path

  //               //
  //               : (singleObj is SeriesResults)
  //                   ? MovieApiLinks.imagePrefixUrl + singleObj.poster_path

  //                   //
  //                   : (singleObj is SongResults)
  //                       ? singleObj.artworkUrl100!
  //                           .replaceAll('100x100', '600x600')

  //                       //
  //                       : (singleObj is YoutubeSingleResult)
  //                           ? singleObj?.youtubeSingleResult.items!.first
  //                               .snippet!.thumbnails!.high!.url!
  //                           :

  //                           //
  //                           '',
  //     );
  //   }));
  // }

/* -------------------------------------------------------------------------- */
/*                               //! properties                               */
/* -------------------------------------------------------------------------- */
}
