// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import 'my_toggle_icon_button/my_toggle_icon_button_bloc.dart';

// class MyToggleIconButton_widget extends StatelessWidget {
//   final IconData onIcon, offIcon;
//   final Function on_onIconPressed;
//   final Function on_offIconPressed;
//   const MyToggleIconButton_widget({
//     required this.onIcon,
//     required this.on_onIconPressed,
//     required this.offIcon,
//     required this.on_offIconPressed,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return myToggle_STATES();
//   }

//   onIconButton(context) {
//     return IconButton(
//       color: Colors.pink,
//       icon: Icon(onIcon),
//       onPressed: () {
//         //
//         BlocProvider.of<MyToggleIconButtonBloc>(context)
//             .add(Toggle_turnOff_Event());

//         //
//         on_onIconPressed();
//       },
//     );
//   }

//   offIconButton(context) {
//     return IconButton(
//       color: Colors.pink,
//       icon: Icon(offIcon),
//       onPressed: () {
//         //
//         BlocProvider.of<MyToggleIconButtonBloc>(context)
//             .add(Toggle_turnOn_Event());

//         //
//         on_offIconPressed();
//       },
//     );
//   }

//   myToggle_STATES() {
//     return BlocBuilder<MyToggleIconButtonBloc, MyToggleIconButtonState>(
//       builder: (context, state) {
//         if (state is Toggle_turnedOff_State) {
//           return offIconButton(context);
//         }
//         return onIconButton(context);
//       },
//     );
//   }

// // /* -------------------------------------------------------------------------- */
// // /*                          // Snippet to call in Ui                          */
// // /* -------------------------------------------------------------------------- */

// //   myButton() {
// //     return MyToggleIconButton_widget(
// //     onIcon: Icons.add,
// //     on_onIconPressed: on_onIconPressed,
// //     on_offIconPressed: on_offIconPressed,
// //     offIcon: Icons.delete,
// //     );
// //   }

// //   void on_onIconPressed() {
// //     print('Button turned off');
// //   }

// //   void on_offIconPressed() {
// //     print('Button turned on');
// //   }
// }
