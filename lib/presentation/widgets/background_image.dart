import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ninjatrader_interview/presentation/bloc/theme/theme_bloc.dart';
import 'package:ninjatrader_interview/presentation/bloc/theme/theme_state.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImageFiltered(
      imageFilter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
      child: Center(
        child: OverflowBox(
          maxWidth: double.infinity,
          child: Transform.translate(
            offset: const Offset(200, 100),
            child: ColorFiltered(
              colorFilter: context.watch<ThemeBloc>().state is ThemeDarkState
                  ? ColorFilter.mode(Colors.black, BlendMode.saturation)
                  : ColorFilter.mode(Colors.transparent, BlendMode.multiply),
              child: Image.asset('assets/images/backgrounds/zigzag.png',
                  fit: BoxFit.cover),
            ),
          ),
        ),
      ),
    );
  }
}
