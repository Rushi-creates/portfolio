// import 'package:ct_single_post/MODULES/PROFILE/my_chips_logic/my_chips_bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// //to change class name = right click on className> Rename symbol
// class Chips_widget extends StatefulWidget {
//   final buttonCarouselController;
//   const Chips_widget({required this.buttonCarouselController});

//   @override
//   _Chips_widgetState createState() => _Chips_widgetState();
// }

// class _Chips_widgetState extends State<Chips_widget> {
//   @override
//   Widget build(BuildContext context) {
//     return fourButtonsRow();
//   }

//   /* -------------------------------------------------------------------------- */
// /*                              //! 4 Buttons row                             */
// /* -------------------------------------------------------------------------- */
//   fourButtonsRow() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           //@ SONG

//           BlocBuilder<MyChipsBloc, MyChipsState>(
//             builder: (context, state) {
//               if (state is SongChipOpened_State) {
//                 return singleButton(
//                     0,
//                     Color(0xffFE8DAF),
//                     Color(0xffF6608D),
//                     Color(0xffFE8DAF).withOpacity(0.4),
//                     SongChipClicked_Event(),
//                     'images/Music.png');
//               } else if (state is MyChipsInitial) {
//                 return singleButton(
//                     0,
//                     Color(0xffFE8DAF),
//                     Color(0xffF6608D),
//                     Color(0xffFE8DAF).withOpacity(0.4),
//                     SongChipClicked_Event(),
//                     'images/Music.png');
//               }
//               return singleButton(
//                   0,
//                   // Color.fromARGB(255, 161, 161, 161),
//                   // Color.fromARGB(255, 83, 83, 83),
//                   Colors.white,
//                   Colors.white,
//                   Colors.transparent,
//                   SongChipClicked_Event(),
//                   'images/Music_black.png');
//             },
//           ),

//           //

//           //@ MOVIE BLOC
//           BlocBuilder<MyChipsBloc, MyChipsState>(
//             builder: (context, state) {
//               if (state is MoviesChipOpened_State) {
//                 return singleButton(
//                     1,
//                     Color(0xff8FE5FC),
//                     Color(0xff47C7EB),
//                     Color(0xff8FE5FC).withOpacity(0.4),
//                     MoviesChipClicked_Event(),
//                     'images/Movie.png');
//               }

//               return singleButton(
//                   1,
//                   // Color.fromARGB(255, 161, 161, 161),
//                   // Color.fromARGB(255, 83, 83, 83),
//                   Colors.white,
//                   Colors.white,
//                   Colors.transparent,
//                   MoviesChipClicked_Event(),
//                   'images/Movie_black.png');
//             },
//           ),

//           //

//           //@  SERIES BLOC

//           BlocBuilder<MyChipsBloc, MyChipsState>(
//             builder: (context, state) {
//               if (state is YoutubeChipOpened_State) {
//                 return singleButton(
//                     2,
//                     Color(0xffFFD199),
//                     Color(0xffFEB25A),
//                     Color.fromRGBO(255, 190, 113, 0.7),
//                     YoutubeChipClicked_Event(),
//                     'images/Series.png');
//               }

//               return singleButton(
//                   2,
//                   // Color.fromARGB(255, 161, 161, 161),
//                   // Color.fromARGB(255, 83, 83, 83),
//                   Colors.white,
//                   Colors.white,
//                   Colors.transparent,
//                   YoutubeChipClicked_Event(),
//                   'images/Series_black.png');
//             },
//           ),

//           //

//           //@ CUSTOM BLOC
//           BlocBuilder<MyChipsBloc, MyChipsState>(
//             builder: (context, state) {
//               if (state is CustomChipOpened_State) {
//                 return singleButton(
//                     3,
//                     Color(0xff5FF8D5),
//                     Color(0xff33DCB4),
//                     Color(0xff5FF8D5).withOpacity(0.4),
//                     CustomChipClicked_Event(),
//                     'images/Custom.png');
//               }

//               return singleButton(
//                   3,
//                   // Color.fromARGB(255, 161, 161, 161),
//                   // Color.fromARGB(255, 83, 83, 83),
//                   Colors.white,
//                   Colors.white,
//                   Colors.transparent,
//                   CustomChipClicked_Event(),
//                   'images/Custom_black.png');
//             },
//           ),
//         ],
//       ),
//     );
//   }

//   singleButton(int index, Color color1, Color color2, Color boxShadow_color,
//       MyChipsEvent eventArg, String icon) {
//     var dimVar = MediaQuery.of(context).size;

//     return GestureDetector(
//       onTap: () {
//         widget.buttonCarouselController.jumpToPage(index);

//         // BlocProvider.of<MyChipsBloc>(context).add(eventArg);
//       },
//       child: CircleAvatar(
//         radius: dimVar.width * 0.08,
//         child: Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.all(Radius.circular(20)),
//             boxShadow: [
//               BoxShadow(
//                   color: boxShadow_color,
//                   blurRadius: 60,
//                   offset: Offset(0, 20)),
//             ],
//             shape: BoxShape.rectangle,
//             image: DecorationImage(image: AssetImage(icon)),
//             gradient: LinearGradient(
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//               colors: [
//                 color1,
//                 color2,
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
