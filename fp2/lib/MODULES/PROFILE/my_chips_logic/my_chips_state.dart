part of 'my_chips_bloc.dart';

abstract class MyChipsState extends Equatable {
  const MyChipsState();

  @override
  List<Object> get props => [];
}

class MyChipsInitial extends MyChipsState {}

class SongChipOpened_State extends MyChipsState {}

class MoviesChipOpened_State extends MyChipsState {}

class YoutubeChipOpened_State extends MyChipsState {}

class CustomChipOpened_State extends MyChipsState {}
