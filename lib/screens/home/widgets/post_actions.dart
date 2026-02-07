import 'package:flutter/material.dart';
import '../../../core/session.dart';
import '../../../services/post_actions_service.dart';
import '../comments_screen.dart';

class PostActions extends StatefulWidget {
  final String postId;
  final bool liked;
  final bool saved;
  final int likes;

  const PostActions({
    super.key,
    required this.postId,
    required this.liked,
    required this.saved,
    required this.likes,
  });

  @override
  State<PostActions> createState() => _PostActionsState();
}

class _PostActionsState extends State<PostActions> {
  late bool _liked;
  late bool _saved;
  late int _likes;
  String _me = '';

  @override
  void initState() {
    super.initState();
    _liked = widget.liked;
    _saved = widget.saved;
    _likes = widget.likes;
    _init();
  }

  Future<void> _init() async {
    _me = await Session.username() ?? '';
  }

  Future<void> _toggleLike() async {
    setState(() {
      _liked = !_liked;
      _likes += _liked ? 1 : -1;
    });

    if (_liked) {
      await PostActionsService.like(widget.postId, _me);
    } else {
      await PostActionsService.unlike(widget.postId, _me);
    }
  }

  Future<void> _toggleSave() async {
    setState(() => _saved = !_saved);

    if (_saved) {
      await PostActionsService.save(widget.postId, _me);
    } else {
      await PostActionsService.unsave(widget.postId, _me);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(
            _liked ? Icons.favorite : Icons.favorite_border,
            color: _liked ? Colors.red : Colors.white,
          ),
          onPressed: _toggleLike,
        ),
        Text('$_likes'),
        IconButton(
          icon: const Icon(Icons.comment_outlined),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => CommentsScreen(postId: widget.postId),
              ),
            );
          },
        ),
        IconButton(
          icon: const Icon(Icons.share_outlined),
          onPressed: () {
            // system share (баъд)
          },
        ),
        const Spacer(),
        IconButton(
          icon: Icon(
            _saved ? Icons.bookmark : Icons.bookmark_border,
          ),
          onPressed: _toggleSave,
        ),
      ],
    );
  }
}
