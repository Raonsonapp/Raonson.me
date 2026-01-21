class AudioTimeline {
  final List<String> audioFiles;

  AudioTimeline(this.audioFiles);

  bool get isReady => audioFiles.isNotEmpty;
}