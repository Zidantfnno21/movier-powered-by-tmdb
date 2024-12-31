import '../../../utils/result.dart';
import '../../network/response/api_response.dart';

abstract class SearchRepository{
  Future<Result<ApiResponse<dynamic>>> fetchSearch(String query, int page);
}