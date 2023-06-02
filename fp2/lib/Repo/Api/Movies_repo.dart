import '../../service_layer_stub/models/Movie.dart';
import '../../service_layer_stub/models/MovieResults.dart';
import '../../service_layer_stub/services/MoviesDB_helper.dart';
import '../../service_layer_stub/services/SharedPreferences_helper.dart';
import '../../service_layer_stub/services/secret_credentials/MoviesDb_paths.dart';

class Movies_api_repo {
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

  //   return Movies.fromMapList(rawData);
  // }

/* -------------------------------------------------------------------------- */
/*                              //! Fetch by Prop                             */
/* -------------------------------------------------------------------------- */

  fetchProp(String customSearch) async {
    var rawData =
        await _provider.fetch(MovieApiLinks.searchMovieUrl + customSearch);
    print('raw data from movie repo = > ${rawData}');
    print('fromJson from movie repo = > ${Movie.fromJson(rawData)}');
    print('${Movie.fromJson(rawData).page}');
    print('${Movie.fromJson(rawData).results}');
    return Movie.fromJson(rawData);
    // return Movie.fromJson(json.decode(rawData) as Map<String, dynamic>);

    // return Movie.fromMapList(rawData);
  }

/* -------------------------------------------------------------------------- */
/*                          //! fetch trending movies                         */
/* -------------------------------------------------------------------------- */

  fetchProp_trendingMovies() async {
    var rawData = await _provider.fetch(MovieApiLinks.trendingMovieUrl);
    print('raw data from movie repo = > ${rawData}');
    print('fromJson from movie repo = > ${Movie.fromJson(rawData)}');
    print('${Movie.fromJson(rawData).page}');
    print('${Movie.fromJson(rawData).results}');
    return Movie.fromJson(rawData);
    // return Movie.fromJson(json.decode(rawData) as Map<String, dynamic>);

    // return Movie.fromMapList(rawData);
  }

/* -------------------------------------------------------------------------- */
/*                           //! fetch movies by id                           */
/* -------------------------------------------------------------------------- */
  fetchMovies_byId(String id) async {
    var rawData = await _provider
        .fetch(MovieApiLinks.getMovieById_halfUrl + id + MovieApiLinks.apiKey);
    return MovieResults.fromJson(rawData);
  }

/* -------------------------------------------------------------------------- */
/*                               //! Fetch by id                              */
/* -------------------------------------------------------------------------- */
  // fetchById(modelObj_id) async {
  //   var rawData = await _provider.fetchSingleJson_by_id(ApiLinks.fetchUrl, modelObj_id);

  //   return Movies.fromMap(rawData);
  // }

/* -------------------------------------------------------------------------- */
/*                                 //! Create                                 */
/* -------------------------------------------------------------------------- */
  // create(modelObj) async {
  //   var rawData = await _provider.addApi(ApiLinks.addApiUrl, modelObj);
  //   return Movies.fromMap(rawData);
  // }

/* -------------------------------------------------------------------------- */
/*                                 //! Update                                 */
/* -------------------------------------------------------------------------- */
  // update(modelObj, modelObj_id) async {
  //   var rawData =
  //       await _provider.updateApi(ApiLinks.updateApiUrl, modelObj, modelObj_id);
  //   return Movies.fromMap(rawData);
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

// class Movies_sp_repo {
//   set_movies(value) async {
//     return await CacheHelper.set('movies', value);
//   }

//   //! do not use await in get
//   get_movies(key) {
//     return CacheHelper.get(key);
//   }

//   remove_movies(key) async {
//     return await CacheHelper.remove(key);
//   }
// }
