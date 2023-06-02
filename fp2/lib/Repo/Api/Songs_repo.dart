import '../../service_layer_stub/models/Songs.dart';
import '../../service_layer_stub/services/MoviesDB_helper.dart';
import '../../service_layer_stub/services/secret_credentials/ITunesDb_paths.dart';

class Songs_api_repo {
/* -------------------------------------------------------------------------- */
/*                               //! Field vars                               */
/* -------------------------------------------------------------------------- */

  final _provider = MovieApiHelper.ApiHelperObj;

/* -------------------------------------------------------------------------- */
/*                              //! Fetch by Prop                             */
/* -------------------------------------------------------------------------- */

  fetchProp(String customSearch) async {
    var rawData =
        await _provider.fetch(ITunesApi_links.searchSongs + customSearch);
    print('raw data from song repo = > ${rawData}');
    print('fromMap from song repo = > ${Songs.fromMap(rawData)}');
    print('${Songs.fromMap(rawData).resultCount}');
    print('${Songs.fromMap(rawData).results}');
    return Songs.fromMap(rawData);
    // return Movie.fromJson(json.decode(rawData) as Map<String, dynamic>);
    // return Movie.fromMapList(rawData);
  }

  fetchProp_trendingSongs() async {
    var rawData = await _provider.fetch(ITunesApi_links.dummyTrendSongsUrl);
    print('raw data from song repo = > ${rawData}');
    print('fromJson from song repo = > ${Songs.fromMap(rawData)}');
    print('${Songs.fromMap(rawData).resultCount}');
    print('${Songs.fromMap(rawData).results}');
    return Songs.fromMap(rawData);
    // return Movie.fromJson(json.decode(rawData) as Map<String, dynamic>);

    // return Movie.fromMapList(rawData);
  }

  fetchSong_byId(String id) async {
    var rawData =
        await _provider.fetch(ITunesApi_links.getSongById_halfUrl + id);
    // print('songs rawData=> ${rawData}');
    // print(SongResults.fromMap(rawData));
    // print(Songs.fromMap(rawData).results.first);
    // return SongResults.fromMap(rawData);
    return Songs.fromMap(rawData).results.first;
  }
}
