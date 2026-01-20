import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'generator_entry_point.dart';

final generatorEntryProvider = Provider<GeneratorEntryPoint>((ref) {
  return GeneratorEntryPoint();
});
