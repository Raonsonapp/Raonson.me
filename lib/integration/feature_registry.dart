enum Feature {
  reels,
  chatGPT,
  kingAI,
  nextToon,
  live,
}

class FeatureRegistry {
  static const Map<Feature, bool> defaults = {
    Feature.reels: true,
    Feature.chatGPT: true,
    Feature.kingAI: true,
    Feature.nextToon: false, // guarded
    Feature.live: false,
  };
}