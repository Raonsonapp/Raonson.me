import '../lip_sync/lip_sequence.dart';

class SceneCharacter {
  final String id;
  final String modelPath;
  final LipSequence lipSequence;

  SceneCharacter({
    required this.id,
    required this.modelPath,
    required this.lipSequence,
  });
}