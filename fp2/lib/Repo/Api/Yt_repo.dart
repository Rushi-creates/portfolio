import '../../service_layer_stub/models/YoutubeModel.dart';
import '../../service_layer_stub/models/YoutubeSingleResult.dart';
import '../../service_layer_stub/services/MoviesDB_helper.dart';
import '../../service_layer_stub/services/SharedPreferences_helper.dart';
import '../../service_layer_stub/services/secret_credentials/YoutubeDb_paths.dart';

class Yt_api_repo {
/* -------------------------------------------------------------------------- */
/*                               //! Field vars                               */
/* -------------------------------------------------------------------------- */

  // to access funcs of api service class here

  final _provider = MovieApiHelper.ApiHelperObj;

/* -------------------------------------------------------------------------- */
/*                              //! Fetch by Prop                             */
/* -------------------------------------------------------------------------- */

  fetchProp(String customSearch) async {
    var rawData = await _provider
        .fetch(YoutubeApiLinks.searchYtVideos_url + customSearch);
    print('raw data from yt repo = > ${rawData}');
    print('fromJson from yt repo = > ${YoutubeModel.fromJson(rawData)}');
    return YoutubeModel.fromJson(rawData);
  }

  fetchProp_trendingYoutube() async {
    var rawData = await _provider
        .fetch(YoutubeApiLinks.searchYt_trendingVideos_url + 'trending');
    print('raw data from yt repo = > ${rawData}');
    print('fromJson from yt repo = > ${YoutubeModel.fromJson(rawData)}');
    return YoutubeModel.fromJson(rawData);
  }

  fetchYoutube_byId(String id) async {
    var rawData =
        await _provider.fetch(YoutubeApiLinks.searchYtVideos_ById_url + id);
    // print(rawData.runtimeType);
    // print(YoutubeModel.fromJson(json.decode(rawData)));
    return YoutubeSingleResult.fromMap(rawData);
  }
/* -------------------------------------------------------------------------- */
/*                           //! fetch yt by id                           */
/* -------------------------------------------------------------------------- */
  // fetchYt_byId(String id) async {
  //   var rawData = await _provider
  //       .fetch(MovieApiLinks.getMovieById_halfUrl + id + MovieApiLinks.apiKey);
  //   return MovieResults.fromJson(rawData);
  // }

/* -------------------------------------------------------------------------- */
/*                               //! Fetch by id                              */
/* -------------------------------------------------------------------------- */
  // fetchById(modelObj_id) async {
  //   var rawData = await _provider.fetchSingleJson_by_id(ApiLinks.fetchUrl, modelObj_id);

  //   return Yt.fromMap(rawData);
  // }

/* -------------------------------------------------------------------------- */
/*                                 //! Create                                 */
/* -------------------------------------------------------------------------- */
  // create(modelObj) async {
  //   var rawData = await _provider.addApi(ApiLinks.addApiUrl, modelObj);
  //   return Yt.fromMap(rawData);
  // }

/* -------------------------------------------------------------------------- */
/*                                 //! Update                                 */
/* -------------------------------------------------------------------------- */
  // update(modelObj, modelObj_id) async {
  //   var rawData =
  //       await _provider.updateApi(ApiLinks.updateApiUrl, modelObj, modelObj_id);
  //   return Yt.fromMap(rawData);
  // }

/* -------------------------------------------------------------------------- */
/*                                 //! Delete                                 */
/* -------------------------------------------------------------------------- */
  // doesnt return a map, just some string ( so can't use AccountModel.fromJson)
//   delete(modelObjArg_Id) async {
//     var rawData = await _provider.deleteApi(ApiLinks.deleteApiUrl, modelObjArg_Id);
//     return rawData; // as api returns string, not a map
//   }
}

/* -------------------------------------------------------------------------- */
/*                          //@ SP Repo class                                 */
/* -------------------------------------------------------------------------- */

// //Todo : while using sp , make sure to use await , kw , or it wont work
// // CacheHelper.get('UserAcc');
// // await CacheHelper.set('UserAcc');
// // await CacheHelper.remove('UserAcc');

// class Yt_sp_repo {
//   set_yt(value) async {
//     return await CacheHelper.set('yt', value);
//   }

//   //! do not use await in get
//   get_yt() {
//     return CacheHelper.get('yt');
//   }

//   remove_yt() async {
//     return await CacheHelper.remove('yt');
//   }
// }
