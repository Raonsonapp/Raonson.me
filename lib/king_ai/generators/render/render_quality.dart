class RenderQuality {
  final int width;
  final int height;
  final int bitrate;
  final int fps;

  const RenderQuality({
    required this.width,
    required this.height,
    required this.bitrate,
    required this.fps,
  });

  Map<String, dynamic> toMap() => {
        "resolution": "${width}x$height",
        "bitrate": bitrate,
        "fps": fps,
      };
}