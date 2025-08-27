import 'package:chhoto_khabar/features/bookmark/domain/usecases/get_bookmark_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:chhoto_khabar/features/bookmark/data/models/bookmark_model.dart';
part 'bookmark_event.dart';
part 'bookmark_state.dart';
part 'bookmark_bloc.freezed.dart';

class BookmarkBloc extends Bloc<BookmarkEvent, BookmarkState> {
  final GetBookmarksUsecase getBookmarksUseCase;

  BookmarkBloc({
    required this.getBookmarksUseCase,
  }) : super(const BookmarkState.initial()) {
    on<LoadBookmarks>(_onLoadBookmarks);
    on<RefreshBookmarks>(_onRefreshBookmarks);
    on<LoadMoreBookmarks>(_onLoadMoreBookmarks);
  }

  Future<void> _onLoadBookmarks(
    LoadBookmarks event,
    Emitter<BookmarkState> emit,
  ) async {
    emit(const BookmarkState.loading());

    final result = await getBookmarksUseCase(
      page: event.page,
      language: event.language,
    );

    result.fold(
      (failure) => emit(BookmarkState.error(failure.message)),
      (bookmarks) => emit(BookmarkState.loaded(
        bookmarks: bookmarks.cast<BookmarkModel>(),
        currentPage: event.page ?? 1,
        hasMoreData: bookmarks.isNotEmpty,
      )),
    );
  }

  Future<void> _onRefreshBookmarks(
    RefreshBookmarks event,
    Emitter<BookmarkState> emit,
  ) async {
    emit(const BookmarkState.loading());

    final result = await getBookmarksUseCase(
      page: 1,
      language: event.language,
    );

    result.fold(
      (failure) => emit(BookmarkState.error(failure.message)),
      (bookmarks) => emit(BookmarkState.loaded(
        bookmarks: bookmarks.cast<BookmarkModel>(),
        currentPage: 1,
        hasMoreData: bookmarks.isNotEmpty,
      )),
    );
  }

  Future<void> _onLoadMoreBookmarks(
    LoadMoreBookmarks event,
    Emitter<BookmarkState> emit,
  ) async {
    final currentState = state;
    if (currentState is _Loaded) {
      emit(BookmarkState.loadingMore(
        bookmarks: currentState.bookmarks,
        currentPage: currentState.currentPage,
      ));

      final result = await getBookmarksUseCase(
        page: currentState.currentPage + 1,
        language: event.language,
      );

      result.fold(
        (failure) => emit(BookmarkState.loaded(
          bookmarks: currentState.bookmarks,
          currentPage: currentState.currentPage,
          hasMoreData: currentState.hasMoreData,
        )),
        (newBookmarks) {
          final updatedBookmarks = [
            ...currentState.bookmarks,
            ...newBookmarks.cast<BookmarkModel>(),
          ];
          emit(BookmarkState.loaded(
            bookmarks: updatedBookmarks,
            currentPage: currentState.currentPage + 1,
            hasMoreData: newBookmarks.isNotEmpty,
          ));
        },
      );
    }
  }
}