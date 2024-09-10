import 'package:flutter/material.dart';
import 'package:posts_app/database/db_helper.dart';
import 'package:posts_app/models/post_model.dart';
import 'package:posts_app/views/comment_page.dart';

class PostWidget extends StatefulWidget {
  const PostWidget({super.key, required this.postModel});

  final PostModel postModel;

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    _checkIfFavorite();
  }

  Future<void> _checkIfFavorite() async {
    try {
      final db = DatabaseHelper();
      final favorites = await db.getFavorites();
      setState(() {
        isFavorite = favorites.any((post) => post.id == widget.postModel.id);
      });
    } catch (e) {
      debugPrint("Error checking if favorite: $e");
    }
  }

  Future<void> _toggleFavorite() async {
    try {
      final db = DatabaseHelper();
      if (isFavorite) {
        await db.deleteFavorite(widget.postModel.id);
      } else {
        await db.insertFavorite(widget.postModel);
      }
      setState(() {
        isFavorite = !isFavorite;
      });
    } catch (e) {
      debugPrint("Error toggling favorite: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(13),
      child: Container(
        padding: const EdgeInsets.all(7),
        decoration: BoxDecoration(
          color: const Color(0xff323243),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color(0xff323243)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.postModel.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                ),
                Positioned(
                  top: -6,
                  right: 1,
                  child: IconButton(
                    onPressed: _toggleFavorite,
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? Colors.red : Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        CommentPage(postId: widget.postModel.id),
                  ),
                );
              },
              child: Text(
                widget.postModel.info,
                overflow: TextOverflow.ellipsis,
                maxLines: 4,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
