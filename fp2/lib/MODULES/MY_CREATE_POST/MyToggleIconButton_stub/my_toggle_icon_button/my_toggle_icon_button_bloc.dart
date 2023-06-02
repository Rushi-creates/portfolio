import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'my_toggle_icon_button_event.dart';
part 'my_toggle_icon_button_state.dart';

class MyToggleIconButtonBloc
    extends Bloc<MyToggleIconButtonEvent, MyToggleIconButtonState> {
  MyToggleIconButtonBloc() : super(Toggle_turnedOn_State()) {
    //

    on<Toggle_turnOn_Event>((event, emit) => emit(Toggle_turnedOn_State()));
    on<Toggle_turnOff_Event>((event, emit) => emit(Toggle_turnedOff_State()));
  }

  //  Do_this;
  //mention bloc in blocProvider, in main.dart

}
