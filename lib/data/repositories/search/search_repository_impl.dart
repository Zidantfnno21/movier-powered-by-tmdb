import 'package:the_movie_databases/data/repositories/search/search_repository.dart';

import '../../../utils/result.dart';
import '../../network/response/api_response.dart';
import '../../network/service/tmdb_client.dart';

class SearchRepositoryImpl implements SearchRepository{
  final TmdbClient _tmdbClient;

  SearchRepositoryImpl(this._tmdbClient);

  @override
  Future<Result<ApiResponse<dynamic>>> fetchSearch(String query, int page) async {
    print('Fetching search results for query: $query, page: $page');
    return await _tmdbClient.fetchSearch(query, page);
  }
}