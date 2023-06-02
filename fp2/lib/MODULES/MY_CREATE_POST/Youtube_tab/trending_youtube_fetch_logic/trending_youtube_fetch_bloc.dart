import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../Repo/Api/Yt_repo.dart';
import '../../../../service_layer_stub/Exceptions/Exceptions.dart';

part 'trending_youtube_fetch_event.dart';
part 'trending_youtube_fetch_state.dart';

class TrendingYoutubeFetchBloc
    extends Bloc<TrendingYoutubeFetchEvent, TrendingYoutubeFetchState> {
  TrendingYoutubeFetchBloc() : super(TrendingYoutubeFetchInitial()) {
    Yt_api_repo youtube_api_repo = Yt_api_repo();

    on<FetchTrendingYoutube_Event>((event, emit) async {
      print('trending youtube fetch called');
      try {
        emit((TrendingYoutubeFetch_Loading_State()));
        // await Future.delayed(Duration(milliseconds: 800));

        final moreFetchedList =
            await youtube_api_repo.fetchProp_trendingYoutube();

        print(moreFetchedList);
        // final List moreFetchedList =
        //     await queues_Api_Repo.fetchAll(newCounter);

        emit(TrendingYoutubeFetch_Success_State(moreFetchedList));

        //# catch error
      } catch (e) {
        print(e);
        var storeErr = CustomExceptions.checkExcp(e.runtimeType);
        emit(TrendingYoutubeFetch_Error_State(storeErr));
      }
    });
  }
}
