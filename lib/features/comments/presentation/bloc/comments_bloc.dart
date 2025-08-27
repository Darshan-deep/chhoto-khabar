import 'package:chhoto_khabar/features/comments/domain/entities/comment.dart';
import 'package:chhoto_khabar/features/comments/domain/usecases/get_comments_usecase.dart';
import 'package:chhoto_khabar/features/comments/domain/usecases/post_comment_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'comments_event.dart';
part 'comments_state.dart';
part 'comments_bloc.freezed.dart';

class CommentsBloc extends Bloc<CommentsEvent, CommentsState> {
  final GetCommentsUseCase _getCommentsUseCase;
  final PostCommentUseCase _postCommentUseCase;

  List<CommentEntity> _allComments = [];
  int _currentPage = 1;
  bool _hasMore = true;

  CommentsBloc(
    this._getCommentsUseCase,
    this._postCommentUseCase,
  ) : super(const CommentsState.initial()) {
    on<LoadComments>(_onLoadComments);
    on<LoadMoreComments>(_onLoadMoreComments);
    on<PostComment>(_onPostComment);
    on<RefreshComments>(_onRefreshComments);
  }

  Future<void> _onLoadComments(
    LoadComments event,
    Emitter<CommentsState> emit,
  ) async {
    emit(const CommentsState.loading());

    final result = await _getCommentsUseCase(event.articleId, page: 1);

    result.fold(
      (failure) => emit(CommentsState.error(failure.message)),
      (commentsResponse) {
        _allComments = commentsResponse.results;
        _currentPage = 1;
        _hasMore = commentsResponse.next != null;
        
        emit(CommentsState.loaded(
          comments: _allComments,
          hasMore: _hasMore,
          currentPage: _currentPage,
        ));
      },
    );
  }

  Future<void> _onLoadMoreComments(
    LoadMoreComments event,
    Emitter<CommentsState> emit,
  ) async {
    if (!_hasMore) return;

    final nextPage = _currentPage + 1;
    final result = await _getCommentsUseCase(event.articleId, page: nextPage);

    result.fold(
      (failure) => emit(CommentsState.error(failure.message)),
      (commentsResponse) {
        _allComments.addAll(commentsResponse.results);
        _currentPage = nextPage;
        _hasMore = commentsResponse.next != null;
        
        emit(CommentsState.loaded(
          comments: _allComments,
          hasMore: _hasMore,
          currentPage: _currentPage,
        ));
      },
    );
  }

  Future<void> _onPostComment(
    PostComment event,
    Emitter<CommentsState> emit,
  ) async {
    emit(const CommentsState.posting());

    final result = await _postCommentUseCase(
      articleId: event.articleId,
      content: event.content,
      parentId: event.parentId,
    );

    result.fold(
      (failure) => emit(CommentsState.error(failure.message)),
      (comment) {
        // Add the new comment to the beginning of the list
        _allComments.insert(0, comment);
        
        emit(CommentsState.loaded(
          comments: _allComments,
          hasMore: _hasMore,
          currentPage: _currentPage,
        ));
      },
    );
  }

  Future<void> _onRefreshComments(
    RefreshComments event,
    Emitter<CommentsState> emit,
  ) async {
    _allComments.clear();
    _currentPage = 1;
    _hasMore = true;
    
    add(LoadComments(event.articleId));
  }
}
