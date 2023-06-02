import '../../service_layer_stub/models/Series.dart';
import '../../service_layer_stub/models/SeriesResult.dart';
import '../../service_layer_stub/services/MoviesDB_helper.dart';
import '../../service_layer_stub/services/SharedPreferences_helper.dart';
import '../../service_layer_stub/services/secret_credentials/MoviesDb_paths.dart';
import '../../service_layer_stub/services/secret_credentials/SeriesDB_paths.dart';

//Todo : (IMP) All functions of this class must be await , or else wont work
class Series_api_repo {
/* -------------------------------------------------------------------------- */
/*                               //! Field vars                               */
/* -------------------------------------------------------------------------- */

  // to access funcs of api service class here

  final _provider = MovieApiHelper.ApiHelperObj;

  // int pageSizeVar = 15;  // used in pagination of fetches

/* -------------------------------------------------------------------------- */
/*                                //! Fetch All                               */
/* -------------------------------------------------------------------------- */
  // fetchAll(int counter) async {
  //   var rawData = await _provider.fetchJsonList(
  //     fetchUrl: ApiLinks.someUrl,
  //     pageSize: pageSizeVar,
  //     pageNum: counter,
  //   );

  //   return Series.fromMapList(rawData);
  // }

  /* -------------------------------------------------------------------------- */
/*                              //! Fetch by Prop                             */
/* -------------------------------------------------------------------------- */

  fetchProp(String customSearch) async {
    var rawData =
        await _provider.fetch(SeriesApiLinks.searchSeriesUrl + customSearch);
    print('raw data from series repo = > ${rawData}');
    print('fromJson from series repo = > ${Series.fromJson(rawData)}');
    print('${Series.fromJson(rawData).page}');
    print('${Series.fromJson(rawData).results}');
    return Series.fromJson(rawData);
    // return Movie.fromJson(json.decode(rawData) as Map<String, dynamic>);

    // return Movie.fromMapList(rawData);
  }

/* -------------------------------------------------------------------------- */
/*                          //! fetch trending series                         */
/* -------------------------------------------------------------------------- */

  fetchProp_trendingSeries() async {
    var rawData = await _provider.fetch(SeriesApiLinks.trendingSeriesUrl);
    print('raw data from movie repo = > ${rawData}');
    print('fromJson from movie repo = > ${Series.fromJson(rawData)}');
    print('${Series.fromJson(rawData).page}');
    print('${Series.fromJson(rawData).results}');
    return Series.fromJson(rawData);
    // return Movie.fromJson(json.decode(rawData) as Map<String, dynamic>);

    // return Movie.fromMapList(rawData);
  }

/* -------------------------------------------------------------------------- */
/*                           //! Fetch series by id                           */
/* -------------------------------------------------------------------------- */

  fetchSeries_byId(String id) async {
    var rawData = await _provider.fetch(
        SeriesApiLinks.getSeriesById_halfUrl + id + MovieApiLinks.apiKey);
    return SeriesResults.fromJson(rawData);
  }

/* -------------------------------------------------------------------------- */
/*                               //! Fetch by id                              */
/* -------------------------------------------------------------------------- */
  // fetchById(modelObj_id) async {
  //   var rawData = await _provider.fetchSingleJson_by_id(ApiLinks.fetchUrl, modelObj_id);

  //   return Series.fromMap(rawData);
  // }

/* -------------------------------------------------------------------------- */
/*                                 //! Create                                 */
/* -------------------------------------------------------------------------- */
  // create(modelObj) async {
  //   var rawData = await _provider.addApi(ApiLinks.addApiUrl, modelObj);
  //   return Series.fromMap(rawData);
  // }

/* -------------------------------------------------------------------------- */
/*                                 //! Update                                 */
/* -------------------------------------------------------------------------- */
  // update(modelObj, modelObj_id) async {
  //   var rawData =
  //       await _provider.updateApi(ApiLinks.updateApiUrl, modelObj, modelObj_id);
  //   return Series.fromMap(rawData);
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

// class Series_sp_repo {
//   set_series(value) async {
//     return await CacheHelper.set('series', value);
//   }

//   //! do not use await in get
//   get_series() {
//     return CacheHelper.get('series');
//   }

//   remove_series() async {
//     return await CacheHelper.remove('series');
//   }
// }
