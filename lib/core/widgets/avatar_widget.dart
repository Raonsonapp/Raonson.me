import 'package:flutter/material.dart';
import '../constants/app_sizes.dart';

class AvatarWidget extends StatelessWidget {
  final String imageUrl;
  const AvatarWidget({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: AppSizes.avatarRadius,
      backgroundImage: NetworkImage(imageUrl),
    );
  }
}
