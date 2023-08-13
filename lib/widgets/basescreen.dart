import 'package:flutter/material.dart';
import 'package:sweetsd_github/widgets/text.dart';

class BaseScreen extends StatelessWidget {
  final AppBar? appBar;
  final String title;
  final double titleFontSize;
  final bool centerTitle;
  final bool resizeToAvoidBottomInset;
  final Widget? body;
  final Widget? leading;
  final bool useDefaultLeading;
  final List<Widget>? actions;
  final Widget? bottomNavigationBar;
  final EdgeInsets padding;

  const BaseScreen(
      {super.key,
      this.appBar,
      this.title = '',
      this.titleFontSize = 24,
      this.centerTitle = false,
      this.resizeToAvoidBottomInset = true,
      this.body,
      this.leading,
      this.useDefaultLeading = false,
      this.actions,
      this.bottomNavigationBar,
      this.padding = EdgeInsets.zero});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      appBar: appBar,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Padding(
              padding: padding,
              child: body,
            ),
          ],
        ),
      ),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
