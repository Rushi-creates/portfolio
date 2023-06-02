import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'my_chips2_event.dart';
part 'my_chips2_state.dart';

class MyChips2Bloc extends Bloc<MyChips2Event, MyChips2State> {
  MyChips2Bloc() : super(MyChips2Initial()) {
    on<SongChipClicked_Event>((event, emit) => emit(SongChipOpened_State()));
    on<MoviesChipClicked_Event>(
        (event, emit) => emit(MoviesChipOpened_State()));
    on<YoutubeChipClicked_Event>(
        (event, emit) => emit(YoutubeChipOpened_State()));
    on<CustomChipClicked_Event>(
        (event, emit) => emit(CustomChipOpened_State()));
  }
}
