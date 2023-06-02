part of 'my_toggle_icon_button_bloc.dart';

abstract class MyToggleIconButtonEvent extends Equatable {
  const MyToggleIconButtonEvent();

  @override
  List<Object> get props => [];
}

class Toggle_turnOn_Event extends MyToggleIconButtonEvent {}

class Toggle_turnOff_Event extends MyToggleIconButtonEvent {}
