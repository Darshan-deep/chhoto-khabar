import 'package:chhoto_khabar/features/comments/domain/entities/comment.dart';
import 'package:chhoto_khabar/features/comments/domain/usecases/get_comments_usecase.dart';
import 'package:chhoto_khabar/features/comments/domain/usecases/post_comment_usecase.dart';
import 'package:chhoto_khabar/features/comments/domain/usecases/edit_comment_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'comments_event.dart';
part 'comments_state.dart';
part 'comments_bloc.freezed.dart';

class CommentsBloc extends Bloc<CommentsEvent, CommentsState> {
  final GetCommentsUseCase _getCommentsUseCase;
  final PostCommentUseCase _postCommentUseCase;
  final EditCommentUseCase _editCommentUseCase;

  List<CommentEntity> _allComments = [];
  int _currentPage = 1;
  bool _hasMore = true;

  CommentsBloc(
    this._getCommentsUseCase,
    this._postCommentUseCase,
    this._editCommentUseCase,
  ) : super(const CommentsState.initial()) {
    on<LoadComments>(_onLoadComments);
    on<LoadMoreComments>(_onLoadMoreComments);
    on<PostComment>(_onPostComment);
    on<EditComment>(_onEditComment);
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

    await result.fold(
      (failure) async {
        emit(CommentsState.error(failure.message));
      },
      (comment) async {
        // Enrich comment with current user data if missing
        final enrichedComment = await _enrichCommentWithUserData(comment);
        
        // Add the new comment to the beginning of the list
        _allComments.insert(0, enrichedComment);
        
        // Emit loaded state with updated list (skip the posted state to avoid multiple indicators)
        emit(CommentsState.loaded(
          comments: _allComments,
          hasMore: _hasMore,
          currentPage: _currentPage,
        ));
      },
    );
  }

  Future<void> _onEditComment(
    EditComment event,
    Emitter<CommentsState> emit,
  ) async {
    emit(const CommentsState.editing());

    final result = await _editCommentUseCase(
      commentId: event.commentId,
      content: event.content,
    );

    result.fold(
      (failure) => emit(CommentsState.error(failure.message)),
      (editedComment) {
        // Update the comment in the local list
        final commentIndex = _allComments.indexWhere((c) => c.id == editedComment.id);
        if (commentIndex >= 0) {
          _allComments[commentIndex] = editedComment;
        }
        
        // First emit edited state for listeners
        emit(CommentsState.edited(editedComment));
        
        // Then emit loaded state with updated list
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

  /// Enrich comment with current user data if the user data is missing or invalid
  Future<CommentEntity> _enrichCommentWithUserData(CommentEntity comment) async {
    try {
      // Check if comment already has valid user data
      if (comment.user.firstName != 'Unknown' && comment.user.firstName.isNotEmpty) {
        return comment;
      }

      // For now, just return the comment as-is since the API response doesn't include user data
      // The user data should ideally come from the backend response
      print('Comment missing user data, using fallback');
      
      // Create a fallback user with current user info from token if available
      return CommentEntity(
        id: comment.id,
        user: CommentUser(
          id: 'current_user', // Fallback ID
          email: 'user@example.com', // Fallback email
          firstName: 'You', // Fallback first name
          lastName: '', // Fallback last name
          isStaff: false,
          isSuperuser: false,
          bookmarksCount: 0,
        ),
        article: comment.article,
        parent: comment.parent,
        content: comment.content,
        hasReplies: comment.hasReplies,
        createdAt: comment.createdAt,
      );
    } catch (e) {
      print('Error enriching comment with user data: $e');
      return comment; // Return original comment on any error
    }
  }
}
