class BuildPlanService {
  List<String> createBuildSteps({
    required String platform,
    required bool release,
  }) {
    final steps = <String>[];

    if (platform == 'flutter') {
      steps.add('flutter clean');
      steps.add('flutter pub get');
      steps.add(
        release ? 'flutter build apk --release' : 'flutter build apk --debug',
      );
    }

    if (platform == 'game') {
      steps.add('compile assets');
      steps.add('bundle game logic');
    }

    return steps;
  }
}
