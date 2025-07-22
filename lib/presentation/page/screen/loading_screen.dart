import 'package:flutter/material.dart';
import 'package:great_talk/presentation/component/shimmer_skeleton.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const ShimmerSkeleton();
  }
}
