import 'package:chhoto_khabar/features/comments/domain/entities/comment.dart';
import 'package:chhoto_khabar/features/comments/presentation/bloc/comments_bloc.dart';
import 'package:chhoto_khabar/features/comments/domain/usecases/get_comment_replies_usecase.dart';
import 'package:chhoto_khabar/core/config/dependency_injection/di_config.dart';
import 'package:chhoto_khabar/shared/user/domain/repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class CommentsBottomSheet extends StatefulWidget {
  final String articleId;
  final VoidCallback? onCommentAdded;

  const CommentsBottomSheet({
    Key? key,
    required this.articleId,
    this.onCommentAdded,
  }) : super(key: key);

  @override
  State<CommentsBottomSheet> createState() => _CommentsBottomSheetState();
}

class _CommentsBottomSheetState extends State<CommentsBottomSheet> {
  final TextEditingController _commentController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  CommentEntity? _replyingTo;
  late CommentsBloc _commentsBloc;
  String? _currentUserId;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _commentsBloc = sl<CommentsBloc>();
    _commentsBloc.add(CommentsEvent.loadComments(widget.articleId));
    _getCurrentUser();
  }

  Future<void> _getCurrentUser() async {
    try {
      final userRepository = sl<UserRepository>();
      final userResult = await userRepository.getUser();
      userResult.fold(
        (error) => print('Error getting current user: ${error.message}'),
        (user) => setState(() {
          _currentUserId = user.id;
        }),
      );
    } catch (e) {
      print('Error getting current user: $e');
    }
  }

  @override
  void dispose() {
    _commentController.dispose();
    _scrollController.dispose();
    _commentsBloc.close();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      // Load more comments
      final state = _commentsBloc.state;
      state.maybeWhen(
        loaded: (comments, hasMore, currentPage) {
          if (hasMore) {
            _commentsBloc.add(
              CommentsEvent.loadMoreComments(widget.articleId),
            );
          }
        },
        orElse: () {},
      );
    }
  }

  void _postComment() {
    final content = _commentController.text.trim();
    if (content.isNotEmpty) {
      _commentsBloc.add(
        CommentsEvent.postComment(
          articleId: widget.articleId,
          content: content,
          parentId: _replyingTo?.id,
        ),
      );
      _commentController.clear();
      _setReplyingTo(null);
    }
  }

  void _editComment(CommentEntity comment, String newContent) {
    _commentsBloc.add(
      CommentsEvent.editComment(
        commentId: comment.id,
        content: newContent,
      ),
    );
  }

  void _setReplyingTo(CommentEntity? comment) {
    setState(() {
      _replyingTo = comment;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _commentsBloc,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.85,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          children: [
            // Header
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey.shade200),
                ),
              ),
              child: Row(
                children: [
                  Text(
                    'Comments',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
            ),
            
            // Comments List
            Expanded(
              child: BlocListener<CommentsBloc, CommentsState>(
                listener: (context, state) {
                  state.maybeWhen(
                    error: (message) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Error: $message'),
                          backgroundColor: Colors.red,
                        ),
                      );
                    },
                    orElse: () {},
                  );
                },
                child: BlocBuilder<CommentsBloc, CommentsState>(
                  builder: (context, state) {
                    return state.when(
                      initial: () => const Center(
                        child: Text('No comments yet'),
                      ),
                      loading: () => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      loaded: (comments, hasMore, currentPage) {
                        if (comments.isEmpty) {
                          return const Center(
                            child: Text('No comments yet. Be the first to comment!'),
                          );
                        }
                        return ListView.builder(
                          controller: _scrollController,
                          padding: const EdgeInsets.all(16),
                          itemCount: comments.length + (hasMore ? 1 : 0),
                          itemBuilder: (context, index) {
                            if (index == comments.length) {
                              return const Center(
                                child: Padding(
                                  padding: EdgeInsets.all(16),
                                  child: CircularProgressIndicator(),
                                ),
                              );
                            }
                            return NestedCommentWidget(
                              comment: comments[index],
                              articleId: widget.articleId,
                              depth: 0,
                              currentUserId: _currentUserId,
                              onReply: _setReplyingTo,
                              onEdit: _editComment,
                            );
                          },
                        );
                      },
                      error: (message) => Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Error: $message'),
                            ElevatedButton(
                              onPressed: () {
                                context.read<CommentsBloc>().add(
                                  CommentsEvent.refreshComments(widget.articleId),
                                );
                              },
                              child: const Text('Retry'),
                            ),
                          ],
                        ),
                      ),
                      posting: () => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      posted: (comment) => const SizedBox.shrink(),
                      editing: () => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      edited: (comment) => const SizedBox.shrink(),
                    );
                  },
                ),
              ),
            ),
            
            // Comment Input
            Container(
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                top: 16,
                bottom: MediaQuery.of(context).viewInsets.bottom + 16,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  top: BorderSide(color: Colors.grey.shade200),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Reply indicator
                  if (_replyingTo != null) ...[
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.blue.shade200),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.reply, size: 16, color: Colors.blue.shade600),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              'Replying to ${_replyingTo!.user.firstName} ${_replyingTo!.user.lastName}',
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                color: Colors.blue.shade600,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => _setReplyingTo(null),
                            child: Icon(Icons.close, size: 16, color: Colors.blue.shade600),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                  ],
                  
                  // Comment input row
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _commentController,
                          style: GoogleFonts.poppins(),
                          decoration: InputDecoration(
                            hintText: _replyingTo != null 
                                ? 'Reply to ${_replyingTo!.user.firstName}...'
                                : 'Write a comment...',
                            hintStyle: GoogleFonts.poppins(),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide(color: Colors.grey.shade300),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                          ),
                          maxLines: null,
                          textInputAction: TextInputAction.newline,
                        ),
                      ),
                      const SizedBox(width: 8),
                      BlocBuilder<CommentsBloc, CommentsState>(
                        builder: (context, state) {
                          final isPosting = state.maybeWhen(
                            posting: () => true,
                            orElse: () => false,
                          );
                          
                          return IconButton(
                            onPressed: isPosting ? null : _postComment,
                            icon: isPosting
                                ? const SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(strokeWidth: 2),
                                  )
                                : const Icon(Icons.send),
                            style: IconButton.styleFrom(
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.white,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Simplified NestedCommentWidget that shows basic comments with replies
class NestedCommentWidget extends StatefulWidget {
  final CommentEntity comment;
  final Function(CommentEntity) onReply;
  final Function(CommentEntity, String) onEdit;
  final String? currentUserId;
  final String articleId;
  final int depth;

  const NestedCommentWidget({
    Key? key,
    required this.comment,
    required this.onReply,
    required this.onEdit,
    this.currentUserId,
    required this.articleId,
    this.depth = 0,
  }) : super(key: key);

  @override
  State<NestedCommentWidget> createState() => _NestedCommentWidgetState();
}

class _NestedCommentWidgetState extends State<NestedCommentWidget> {
  bool _isExpanded = false;
  bool _isLoadingReplies = false;
  List<CommentEntity> _replies = [];
  bool _hasMore = true;
  int _currentPage = 1;

  Future<void> _loadReplies({bool refresh = false}) async {
    if (_isLoadingReplies || !widget.comment.hasReplies) return;

    setState(() {
      _isLoadingReplies = true;
      if (refresh) {
        _replies.clear();
        _currentPage = 1;
        _hasMore = true;
      }
    });

    try {
      final useCase = sl<GetCommentRepliesUseCase>();
      final result = await useCase(widget.comment.id, page: _currentPage);

      result.fold(
        (error) {
          print('Error loading replies: ${error.message}');
        },
        (response) {
          setState(() {
            if (refresh) {
              _replies = response.results;
            } else {
              _replies.addAll(response.results);
            }
            _hasMore = response.next != null;
            _currentPage++;
            _isExpanded = true;
          });
        },
      );
    } catch (e) {
      print('Error loading replies: $e');
    } finally {
      setState(() {
        _isLoadingReplies = false;
      });
    }
  }

  void _toggleReplies() {
    if (!widget.comment.hasReplies) return;

    if (_replies.isEmpty && !_isLoadingReplies) {
      _loadReplies();
    } else {
      setState(() {
        _isExpanded = !_isExpanded;
      });
    }
  }

  String _getTimeAgo(String dateTimeString) {
    try {
      final dateTime = DateTime.parse(dateTimeString);
      final now = DateTime.now();
      final difference = now.difference(dateTime);

      if (difference.inDays > 0) {
        return '${difference.inDays}d';
      } else if (difference.inHours > 0) {
        return '${difference.inHours}h';
      } else if (difference.inMinutes > 0) {
        return '${difference.inMinutes}m';
      } else {
        return 'now';
      }
    } catch (e) {
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    final isNested = widget.depth > 0;
    final maxDepth = 3;
    final shouldShowNested = widget.depth < maxDepth;
    
    return Container(
      margin: EdgeInsets.only(
        left: widget.depth * 16.0,
        bottom: 8,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Main comment
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Avatar
              CircleAvatar(
                radius: isNested ? 16 : 20,
                backgroundColor: Colors.blue,
                child: Text(
                  widget.comment.user.firstName.isNotEmpty 
                      ? widget.comment.user.firstName[0].toUpperCase()
                      : 'U',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: isNested ? 12 : 14,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              
              // Comment Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          '${widget.comment.user.firstName} ${widget.comment.user.lastName}',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            fontSize: isNested ? 13 : 14,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          _getTimeAgo(widget.comment.createdAt),
                          style: GoogleFonts.poppins(
                            color: Colors.grey.shade600,
                            fontSize: isNested ? 11 : 12,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    
                    Text(
                      widget.comment.content,
                      style: GoogleFonts.poppins(
                        fontSize: isNested ? 13 : 14,
                        height: 1.4,
                      ),
                    ),
                    
                    const SizedBox(height: 8),
                    
                    // Action buttons
                    Row(
                      children: [
                        // Replies toggle button
                        if (widget.comment.hasReplies)
                          GestureDetector(
                            onTap: _toggleReplies,
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                              decoration: BoxDecoration(
                                color: _isExpanded 
                                    ? Colors.blue.shade50
                                    : Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(12),
                                border: _isExpanded
                                    ? Border.all(color: Colors.blue.shade300, width: 1)
                                    : Border.all(color: Colors.grey.shade300, width: 1),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    _isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                                    size: 14,
                                    color: _isExpanded ? Colors.blue.shade600 : Colors.grey.shade600,
                                  ),
                                  const SizedBox(width: 4),
                                  if (_isLoadingReplies)
                                    const SizedBox(
                                      width: 12,
                                      height: 12,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 1.5,
                                        color: Colors.blue,
                                      ),
                                    )
                                  else
                                    Text(
                                      _replies.isNotEmpty
                                          ? '${_replies.length} ${_replies.length == 1 ? 'reply' : 'replies'}'
                                          : 'View replies',
                                      style: GoogleFonts.poppins(
                                        color: _isExpanded ? Colors.blue.shade600 : Colors.grey.shade600,
                                        fontSize: 11,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        
                        if (widget.comment.hasReplies) const SizedBox(width: 8),
                        
                        // Reply button
                        GestureDetector(
                          onTap: () => widget.onReply(widget.comment),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade300),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              'Reply',
                              style: GoogleFonts.poppins(
                                color: Colors.grey.shade600,
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          
          // Nested replies
          if (_isExpanded && shouldShowNested && _replies.isNotEmpty)
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              child: Column(
                children: _replies.map((reply) => NestedCommentWidget(
                  comment: reply,
                  articleId: widget.articleId,
                  depth: widget.depth + 1,
                  currentUserId: widget.currentUserId,
                  onReply: widget.onReply,
                  onEdit: widget.onEdit,
                )).toList(),
              ),
            ),
        ],
      ),
    );
  }
}
