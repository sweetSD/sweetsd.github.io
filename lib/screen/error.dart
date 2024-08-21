import 'package:flutter/material.dart';
import 'package:sweetsd_github/widgets/basescreen.dart';
import 'package:sweetsd_github/widgets/common.dart';
import 'package:sweetsd_github/widgets/text.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseScreen(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.disabled_by_default_rounded,
            size: 40,
          ),
          Space(5),
          TextApple(
            '모바일 환경은 현재 지원하지 않습니다.',
            size: 24,
            maxLines: 2,
          ),
          Space(5),
          TextApple(
            'mobile environments are not currently supported.',
            size: 20,
            maxLines: 3,
          ),
        ],
      ),
    ));
  }
}
