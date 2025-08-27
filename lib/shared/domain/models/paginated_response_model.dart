class PaginationResponseModel<T> {
  final String? next;
  final String? previous;
  final int totalRecords;
  final int totalPages;
  final int currentPage;
  final int perPage;
  final int pagingCounter;
  final bool hasPrevious;
  final bool hasNext;
  final String? prev;
  final int recordShown;
  final List<T> records;

  PaginationResponseModel({
    this.next,
    this.previous,
    required this.totalRecords,
    required this.totalPages,
    required this.currentPage,
    required this.perPage,
    required this.pagingCounter,
    required this.hasPrevious,
    required this.hasNext,
    this.prev,
    required this.recordShown,
    required this.records,
  });

  factory PaginationResponseModel.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) fromJsonT,
  ) {
    try {
      // Extract the data object
      final data = json['data'] as Map<String, dynamic>? ?? {};
      
      // Parse records from the nested data structure
      final List<T> recordsList;
      if (data.containsKey('records') && data['records'] != null) {
        recordsList = (data['records'] as List).map((item) {
          if (item is Map<String, dynamic>) {
            return fromJsonT(item);
          } else {
            // Handle non-Map items by converting to a minimal valid map
            return fromJsonT({'id': 'unknown'});
          }
        }).toList();
      } else {
        recordsList = <T>[];
      }

      return PaginationResponseModel(
        next: data['next']?.toString(),
        previous: data['previous']?.toString(),
        totalRecords: data['totalRecords'] as int? ?? recordsList.length,
        totalPages: data['totalPages'] as int? ?? 1,
        currentPage: data['currentPage'] as int? ?? 1,
        perPage: data['perPage'] as int? ?? 10,
        pagingCounter: data['pagingCounter'] as int? ?? 1,
        hasPrevious: data['hasPrevious'] as bool? ?? false,
        hasNext: data['hasNext'] as bool? ?? false,
        prev: data['prev'] as String?,
        recordShown: data['recordShown'] as int? ?? recordsList.length,
        records: recordsList,
      );
    } catch (e) {
      print('Error parsing pagination response: $e');
      // Return an empty model on error
      return PaginationResponseModel(
        next: null,
        previous: null,
        totalRecords: 0,
        totalPages: 1,
        currentPage: 1,
        perPage: 10,
        pagingCounter: 1,
        hasPrevious: false,
        hasNext: false,
        prev: null,
        recordShown: 0,
        records: <T>[],
      );
    }
  }

  // Convenience getters for backward compatibility with old field names
  int get totalItems => totalRecords;
  int get pageSize => perPage;
  List<T> get results => records;

  Map<String, dynamic> toJson(Map<String, dynamic> Function(T) toJsonT) => {
    'data': {
      'records': records.map(toJsonT).toList(),
      'totalRecords': totalRecords,
      'perPage': perPage,
      'totalPages': totalPages,
      'currentPage': currentPage,
      'pagingCounter': pagingCounter,
      'hasPrevious': hasPrevious,
      'hasNext': hasNext,
      'prev': prev,
      'next': next,
      'recordShown': recordShown,
    }
  };
}