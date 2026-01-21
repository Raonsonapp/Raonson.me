class MediaUploadService {
  Future<String> uploadMedia(String path) async {
    // future: Firebase / S3 / Local server
    await Future.delayed(const Duration(seconds: 2));
    return 'uploaded_media_url';
  }
}