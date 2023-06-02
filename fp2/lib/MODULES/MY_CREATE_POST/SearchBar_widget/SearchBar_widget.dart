// import 'package:animated_type_ahead_searchbar/animated_type_ahead_searchbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import '../../myComponents.dart';
import '../Movies_tab/movies_fetch_logic/movies_fetch_bloc.dart';
import '../Series_tab/series_fetch_logic/series_fetch_bloc.dart';
import '../Songs_tab/songs_fetch_logic/songs_fetch_bloc.dart';
import '../Youtube_tab/youtube_fetch_logic/youtube_fetch_bloc.dart';
import 'Search_suggestionBox_widget.dart';

class My_SearchBar<T> extends StatelessWidget {
  final gradient1, gradient2;
  final headingText;

  const My_SearchBar({
    required this.headingText,
    required this.gradient1,
    required this.gradient2,
  });

  @override
  Widget build(BuildContext context) {
    SuggestionsBoxController suggestionsBoxController =
        SuggestionsBoxController();

    return Container(
      decoration: BoxDecoration(
          border: Border.all(
              style: BorderStyle.solid,
              width: 2,
              color: Color.fromRGBO(0, 0, 0, 0.1)),
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(154, 154, 154, 0.2),
              blurRadius: 50,
              offset: Offset(10, 12),
            )
          ]),
      child: SizedBox(
        //@
        width: MyComponents.screenSize(context).width,
        // height: 45,
        child: TypeAheadField(
          debounceDuration: Duration(milliseconds: 1500),
          suggestionsBoxController: suggestionsBoxController,
          keepSuggestionsOnSuggestionSelected: true,
          // hideSuggestionsOnKeyboardHide: false,
          /* -------------------------------------------------------------------------- */
          /*                          //@ text field decoration                         */
          /* -------------------------------------------------------------------------- */

          textFieldConfiguration: TextFieldConfiguration(
            autofocus: false,
            style: DefaultTextStyle.of(context)
                .style
                .copyWith(fontStyle: FontStyle.italic),

            /* -------------------------------------------------------------------------- */
            /*                     //@ text box input decoration                          */
            /* -------------------------------------------------------------------------- */
            decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.all(14),
                prefixIcon: Image.asset(
                  'images/Search.png',
                  // scale: 1.3,
                ),
                border: InputBorder.none,
                hintText: "Search ${headingText}",
                hintStyle: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Color.fromARGB(255, 82, 82, 82).withOpacity(0.3),
                    fontStyle: FontStyle.normal)),
          ),

          /* -------------------------------------------------------------------------- */
          /*                        //@ Suggestion box decoration                       */
          /* -------------------------------------------------------------------------- */

          suggestionsBoxDecoration: SuggestionsBoxDecoration(
            elevation: 10,
            borderRadius: BorderRadius.circular(5.0),
            constraints: BoxConstraints.tightFor(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.22),
            offsetX:
                // isSeriesSearchBar ? -150 :
                12,
            // offsetX: isSeriesSearchBar ? -150 : 12,

            color: gradient2,
            // shape: RoundedRectangleBorder(
            // borderRadius: BorderRadius.circular(.0),
            //     ),
          ),

          /* -------------------------------------------------------------------------- */
          /*             //@ on text changed ( use button instead with bloc,            */
          /*             //@ dont use this, to display fetched results)                 */
          /* -------------------------------------------------------------------------- */
          // return fetchedList here, from api( instead of manual func below)

          suggestionsCallback: (pattern) async {
            print(
                'this is from suggestion callback = heading text = $headingText');
            if (headingText == 'Youtube') {
              BlocProvider.of<YoutubeFetchBloc>(context)
                  .add(Youtube_SearchFetch_Event(pattern));
            } else if (headingText == 'Songs') {
              BlocProvider.of<SongsFetchBloc>(context)
                  .add(Songs_SearchFetch_Event(pattern));
            } else if (headingText == 'Movies') {
              BlocProvider.of<MoviesFetchBloc>(context)
                  .add(Movies_SearchFetch_Event(pattern));
            } else if (headingText == 'Series') {
              BlocProvider.of<SeriesFetchBloc>(context)
                  .add(Series_SearchFetch_Event(pattern));
            }

            return [];
          },

          /* -------------------------------------------------------------------------- */
          /*                             //@ no items found                             */
          /* -------------------------------------------------------------------------- */
          noItemsFoundBuilder: ((context) {
            return SizedBox(
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  colors: [
                    gradient2,
                    gradient1,
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                )),
                child: Search_suggestionBox_widget<T>(
                  headingText: headingText,
                  gradient1: gradient1,
                  gradient2: gradient2,
                ),
              ),
            );
          }),

          /* -------------------------------------------------------------------------- */
          /*                       //@ single list tile decoration                      */
          /* -------------------------------------------------------------------------- */
          itemBuilder: (context, suggestion) {
            return Container();
          },

          /* -------------------------------------------------------------------------- */
          /*                         //@ on single tile pressed                         */
          /* -------------------------------------------------------------------------- */
          onSuggestionSelected: (suggestion) {
            print('tile tapped');
          },
        ),
      ),
    );
  }
}
