// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:stack_overflow_clone/core/extensions/ui_extensions.dart';

class SkeletonItem extends AspectRatio {
  SkeletonItem({
    super.key,
    required BuildContext context,
    double aspectRatio = 3.5,
  }) : super(
          aspectRatio: aspectRatio,
          child: Shimmer(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade400,
                borderRadius: context.borderRadius4x,
              ),
            ),
          ),
        );
}
