import 'package:chhoto_khabar/core/config/api/api_configs.dart';
import 'package:chhoto_khabar/features/bookmark/data/models/bookmark_model.dart';
import 'package:chhoto_khabar/shared/data/remote/network_service.dart';
import 'package:chhoto_khabar/shared/exceptions/http_exception.dart';
import 'package:fpdart/fpdart.dart';

abstract class BookmarkDatasource {
  Future<Either<AppException, List<BookmarkModel>>> getBookmarks({
    int? page,
    String? language,
  });
}

class BookmarkDatasourceImpl implements BookmarkDatasource {
  final NetworkService networkService;

  const BookmarkDatasourceImpl({
    required this.networkService,
  });

  @override
  Future<Either<AppException, List<BookmarkModel>>> getBookmarks({
    int? page,
    String? language,
  }) async {
    try {
      final queryParameters = <String, dynamic>{};
      if (page != null) queryParameters['page'] = page;
      if (language != null) queryParameters['language'] = language;

      final response = await networkService.get(
        ApiConfigs.bookmarks, 
        queryParameters: queryParameters,
      );    

      return response.fold(
        (exception) => Left(exception),
        (result) {
          try {
            // Handle different possible response structures
            final data = result.data;
            List<dynamic> bookmarksList = [];
            
            if (data is Map<String, dynamic>) {
              // If response has nested structure like { "data": { "results": [...] } }
              if (data.containsKey('data') && data['data'] is Map<String, dynamic>) {
                final nestedData = data['data'] as Map<String, dynamic>;
                bookmarksList = nestedData['results'] as List? ?? 
                                nestedData['records'] as List? ?? 
                                nestedData['bookmarks'] as List? ?? [];
              } 
              // If response has direct results like { "results": [...] }
              else if (data.containsKey('results')) {
                bookmarksList = data['results'] as List? ?? [];
              }
              // If response has direct data array like { "bookmarks": [...] }
              else if (data.containsKey('bookmarks')) {
                bookmarksList = data['bookmarks'] as List? ?? [];
              }
            } 
            // If response is directly an array
            else if (data is List) {
              bookmarksList = data;
            }

            final bookmarks = bookmarksList
                .map((json) => BookmarkModel.fromJson(json as Map<String, dynamic>))
                .toList();
                
            return Right(bookmarks);
          } catch (e) {
            return Left(
              AppException(
                message: 'Failed to parse bookmark data: ${e.toString()}',
                statusCode: 500,
                identifier: 'BookmarkDatasourceImpl.getBookmarks.parse',
              ),
            );
          }
        },
      );
    } catch (e) {
      return Left(
        AppException(
          message: 'Failed to fetch bookmarks: ${e.toString()}',
          statusCode: 500,
          identifier: 'BookmarkDatasourceImpl.getBookmarks',
        ),
      );
    }
  }
}
