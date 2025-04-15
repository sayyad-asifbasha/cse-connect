import 'package:cse_connect/services/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loader extends StatefulWidget {
  const Loader({super.key});

  @override
  State<Loader> createState() => _LoaderState();
}

class _LoaderState extends State<Loader> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose(); // always dispose controllers
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.screenHeight!*0.78,
      width: SizeConfig.screenWidth,
      child: Center(
        child: SpinKitSpinningLines(
          color: Theme.of(context).colorScheme.onSecondaryFixedVariant,
          size: SizeConfig.screenHeight! * 0.075,
          controller: _controller,
        ),
      ),
    );
  }
}
