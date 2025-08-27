import 'package:chhoto_khabar/features/comments/domain/entities/comment.dart';
import 'package:chhoto_khabar/features/comments/presentation/bloc/comments_bloc.dart';
import 'package:chhoto_khabar/core/config/dependency_injection/di_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _commentsBloc = sl<CommentsBloc>();
    _commentsBloc.add(CommentsEvent.loadComments(widget.articleId));
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
      // Remove the widget.onCommentAdded?.call(); to avoid the provider error
    }
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
                  const Text(
                    'Comments',
                    style: TextStyle(
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
                          return CommentWidget(
                            comment: comments[index],
                            onReply: _setReplyingTo,
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
                    posted: (comment) => const Center(
                      child: Text('Comment posted!'),
                    ),
                  );
                },
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
                              style: TextStyle(
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
                          decoration: InputDecoration(
                            hintText: _replyingTo != null 
                                ? 'Reply to ${_replyingTo!.user.firstName}...'
                                : 'Write a comment...',
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

class CommentWidget extends StatelessWidget {
  final CommentEntity comment;
  final Function(CommentEntity) onReply;

  const CommentWidget({
    Key? key,
    required this.comment,
    required this.onReply,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Avatar
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.blue,
            child: Text(
              comment.user.firstName.isNotEmpty 
                  ? comment.user.firstName[0].toUpperCase()
                  : 'U',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
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
                      '${comment.user.firstName} ${comment.user.lastName}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      _getTimeAgo(comment.createdAt),
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  comment.content,
                  style: const TextStyle(fontSize: 14),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    if (comment.hasReplies) ...[
                      TextButton(
                        onPressed: () {
                          // TODO: Handle view replies
                        },
                        child: const Text(
                          'View replies',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                      const SizedBox(width: 8),
                    ],
                    TextButton(
                      onPressed: () => onReply(comment),
                      child: const Text(
                        'Reply',
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
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
}
