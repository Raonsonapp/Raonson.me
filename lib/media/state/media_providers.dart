// media/state/media_providers.dart

import 'package:provider/provider.dart';
import 'media_controller.dart';

final mediaProviders = [
  ChangeNotifierProvider<MediaController>(
    create: (_) => MediaController(),
  ),
];