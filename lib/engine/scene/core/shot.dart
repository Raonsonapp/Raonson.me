import 'character_pose.dart';

class Shot {
  final String id;
  final double duration;
  final String camera;
  final List<CharacterPose> poses;

  Shot({
    required this.id,
    required this.duration,
    required this.camera,
    required this.poses,
  });
}