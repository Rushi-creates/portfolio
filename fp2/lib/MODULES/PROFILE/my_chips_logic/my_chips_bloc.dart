import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'my_chips_event.dart';
part 'my_chips_state.dart';

class MyChipsBloc extends Bloc<MyChipsEvent, MyChipsState> {
  MyChipsBloc() : super(MyChipsInitial()) {
    on<SongChipClicked_Event>((event, emit) => emit(SongChipOpened_State()));
    on<MoviesChipClicked_Event>(
        (event, emit) => emit(MoviesChipOpened_State()));
    on<YoutubeChipClicked_Event>(
        (event, emit) => emit(YoutubeChipOpened_State()));
    on<CustomChipClicked_Event>(
        (event, emit) => emit(CustomChipOpened_State()));
  }
}
