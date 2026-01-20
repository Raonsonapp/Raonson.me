class FrameComposer {
  List<String> composeFrames(int totalFrames) {
    return List.generate(
      totalFrames,
      (i) => 'frame_${i.toString().padLeft(6, '0')}.png',
    );
  }
}