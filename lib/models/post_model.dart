class Post {
  int likes;
  bool liked;
  bool saved;

  Post({
    this.likes = 0,
    this.liked = false,
    this.saved = false,
  });

  void toggleLike() {
    liked = !liked;
    likes += liked ? 1 : -1;
  }

  void toggleSave() {
    saved = !saved;
  }
}
