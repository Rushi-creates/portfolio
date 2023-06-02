import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../service_layer_stub/services/secret_credentials/MoviesDb_paths.dart';
import '../myComponents.dart';
import 'CreatePostForm.dart';
import 'Display_single_trend_logic/display_single_trend_bloc.dart';
import 'MyDatePicker_widget.dart';

//to change class name = right click on className> Rename symbol
class DisplaySelection_widget<T> extends StatefulWidget {
  final headingText;
  const DisplaySelection_widget({required this.headingText});

  @override
  _DisplaySelection_widgetState<T> createState() =>
      _DisplaySelection_widgetState<T>();
}

class _DisplaySelection_widgetState<T>
    extends State<DisplaySelection_widget<T>> {
  TextEditingController lovedFact_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return myBody();
  }

  myBody() {
    return displayTrend_STATES();
  }

  displayTrend_STATES() {
    return BlocBuilder<DisplaySingleTrendBloc<T>, DisplaySingleTrendState<T>>(
      builder: (context, state) {
        if (state is TrendAdded_State<T>) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //!
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Divider(
                  height: 30,
                  color: Color.fromARGB(255, 230, 230, 230),
                ),
              ),
              Flex(
                direction: Axis.horizontal,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Flexible(
                    child: displayTrend(state.trend),
                  ),
                  Flexible(
                      child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      yourSelection_headingText(),

                      Padding(
                        padding: const EdgeInsets.only(
                            right: 8.0, bottom: 8, top: 10),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            // boxShadow: [
                            //   BoxShadow(
                            //     color: Colors.grey.withOpacity(0.5),
                            //     spreadRadius: 1,
                            //     blurRadius: 2,
                            //     offset: Offset(0, 1),
                            //   ),
                            // ],
                            gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(255, 255, 255, 255),
                                Color.fromARGB(255, 255, 244, 244),
                                // Color.fromARGB(255, 36, 204, 255),
                                // Color(0xFF00C6FF),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    'Remove  ',
                                    // maxLines: 2,
                                    // overflow: TextOverflow.ellipsis,
                                    // textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.grey,
                                      // decoration: TextDecoration.none,
                                      // fontStyle: FontStyle.italic,
                                      // fontFamily: "FontNameHere" ,
                                      // fontWeight: FontWeight.bold,
                                      // fontWeight: FontWeight.w300,
                                      fontSize: 11.0,
                                    ),
                                  ),
                                  Icon(
                                    Icons.delete,
                                    size: 20,
                                    color: Colors.grey,
                                  ),
                                ],
                              ),
                              onTap: () {
                                BlocProvider.of<DisplaySingleTrendBloc<T>>(
                                        context)
                                    .add(RemoveTrend_Event<T>());
                              },
                            ),
                          ),
                        ),
                      ),
                      // SizedBox(height: 60),

                      IndependentDatePicker(
                          initialDate: DateTime.now(),
                          onDateSelected: ((value) {
                            print(value);
                          })),

                      //
                      customTextFieldUi(lovedFact_controller,
                          'Share your\nthoughts', Icons.favorite),
                    ],
                  ))
                ],
              ),
              CreatePostForm(
                loved_fact_text: lovedFact_controller.text,
                headingText: widget.headingText,
                api_id: widget.headingText == 'Songs'
                    ? state.trend.trackId.toString()
                    : widget.headingText == 'Youtube'
                        ? state.trend.id.videoId
                        : state.trend.id.toString(),
              )
            ],
          );
        } else if (state is TrendRemoved_State<T>) {
          return nothingSelectedYet_image();
        }
        return nothingSelectedYet_image();
      },
    );
  }

  nothingSelectedYet_image() {
    return Align(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 30,
          ),
          Icon(
            Icons.photo_size_select_actual_rounded,
            size: 220,
            color: Colors.grey[200],
          ),
          Text(
            'No ${widget.headingText.toLowerCase()} selected yet',
            style: TextStyle(color: Colors.grey[200], fontSize: 15),
          ),
        ],
      ),
    );
  }

  dummyTrial(state) {
    String description = '';
    if (widget.headingText == 'Movies') {
      description = 'Movies';
    } else if (widget.headingText == 'Series') {
      description = 'Series';
    } else if (widget.headingText == 'Youtube') {
      description = state.snippet.channelTitle;
    } else if (widget.headingText == 'Songs') {
      print('Song trend type');
      print(state.trackName);
      description = state.artistName;
    } else if (widget.headingText == 'Custom') {
      description = state.description;
    }

    String title = '';

    if (widget.headingText == 'Movies') {
      title = state.title;
    } else if (widget.headingText == 'Series') {
      title = state.name;
    } else if (widget.headingText == 'Youtube') {
      title = state.snippet.title;
    } else if (widget.headingText == 'Songs') {
      print('Song trend type');
      print(state.trackName);
      title = state.trackName;
    } else if (widget.headingText == 'Custom') {
      title = state.title;
    }

    String url =
        'https://www.solidbackgrounds.com/images/2560x1440/2560x1440-davys-grey-solid-color-background.jpg';

    //
    if (widget.headingText == 'Movies') {
      url = MovieApiLinks.imagePrefixUrl + state.poster_path;
    } else if (widget.headingText == 'Series') {
      url = MovieApiLinks.imagePrefixUrl + state.poster_path;
    } else if (widget.headingText == 'Youtube') {
      url = state.snippet.thumbnails.high.url;
    } else if (widget.headingText == 'Songs') {
      url = state.artworkUrl100.replaceAll('100x100', '600x600');
    } else if (widget.headingText == 'Custom') {
      url = state.image;
    }
    return Padding(
        padding: const EdgeInsets.all(4.0),
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
                height: MyComponents.screenSize(context).height * 0.31,
                width: widget.headingText == 'Youtube'
                    // ||
                    //         widget.headingText == 'Songs'
                    ? MyComponents.screenSize(context).width
                    : MyComponents.screenSize(context).width * 0.4,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    CachedNetworkImage(imageUrl: url, fit: BoxFit.cover),

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
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,

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
                                fontSize: 12.0,
                              ),
                            ),
                            //
                            Text(
                              description,

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
                                fontSize: 12.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )));
  }

  displayTrend([state]) {
    return dummyTrial(state);
    // return Padding(
    //   padding: const EdgeInsets.all(8.0),
    //   child: Stack(
    //     alignment: Alignment.bottomRight,
    //     children: [
    //       displayImage(state),
    //       Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           displayTitle(state),
    //           displayDescription(state),
    //         ],
    //       ),
    //     ],
    //   ),
    // );
  }

  yourSelection_headingText() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        " Your\nSelection",
        // maxLines: 2,
        // overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.end,
        style: TextStyle(
          letterSpacing: 0.7,
          height: 1.2,
          color: Color.fromARGB(255, 154, 155, 156),
          // decoration: TextDecoration.none,
          // fontStyle: FontStyle.italic,
          // fontFamily: "FontNameHere" ,
          fontFamily: "Poppins",
          // fontWeight: FontWeight.bold,
          fontWeight: FontWeight.w800,
          fontSize: 18.0,
        ),
      ),
    );
  }

  customTextFieldUi(
    controllerArg,
    String labelTextArg,
    IconData icon,
  ) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        maxLengthEnforcement: MaxLengthEnforcement.enforced,
        // maxLength: 25,

        maxLines: 3,
        style: TextStyle(
          fontSize: 15,
        ),
        controller: controllerArg,
        keyboardType: TextInputType.multiline,
        decoration: InputDecoration(
            hintMaxLines: 3,
            suffixStyle: TextStyle(),
            // contentPadding: EdgeInsets.symmetric(vertical: 50, horizontal: 16),
            suffixIcon: Icon(
              icon,
              size: 20,
            ),
            border: OutlineInputBorder(),
            labelText: labelTextArg, //hint text here
            labelStyle: TextStyle(fontSize: 12, color: Colors.grey)),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Field required'; //if empty give error msg here
          }
          return null;
        },
      ),
    );
  }
}
