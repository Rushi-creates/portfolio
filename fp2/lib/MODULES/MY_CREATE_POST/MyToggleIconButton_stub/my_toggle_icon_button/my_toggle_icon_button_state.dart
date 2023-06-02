part of 'my_toggle_icon_button_bloc.dart';

abstract class MyToggleIconButtonState extends Equatable {
  const MyToggleIconButtonState();

  @override
  List<Object> get props => [];
}

class Toggle_turnedOn_State extends MyToggleIconButtonState {}

class Toggle_turnedOff_State extends MyToggleIconButtonState {}
