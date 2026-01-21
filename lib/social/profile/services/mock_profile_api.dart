class MockProfileApi {
  static Map<String, dynamic> profileJson(String id) => {
        'id': id,
        'username': 'user_$id',
        'displayName': 'User $id',
        'bio': 'Welcome to Raonson',
      };
}