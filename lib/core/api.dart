class Api {
  // ===== BASE =====
  static const String baseUrl = 'https://raonson-me.onrender.com';

  // ===== AUTH =====
  static const String register = '$baseUrl/auth/register';
  static const String login = '$baseUrl/auth/login';

  // ===== POSTS =====
  static const String posts = '$baseUrl/posts';
  static String postByUser(String username) =>
      '$baseUrl/posts/$username';

  // ===== LIKES =====
  static String likePost(int postId) =>
      '$baseUrl/posts/$postId/like';

  // ===== COMMENTS =====
  static String comments(int postId) =>
      '$baseUrl/posts/$postId/comments';

  // ===== CHATS =====
  static String chats(String username) =>
      '$baseUrl/chats/$username';

  static String messages(String chatId) =>
      '$baseUrl/chats/$chatId/messages';
}
