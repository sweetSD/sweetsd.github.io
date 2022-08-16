import 'package:flutter/material.dart';
import 'package:sweetsd_github/widgets/text.dart';

class BaseScreen extends StatelessWidget {
  final AppBar? appBar;

  final String title;

  final bool centerTitle;

  final bool resizeToAvoidBottomInset;

  final Widget? body;

  final Widget? leading;

  final bool useDefaultLeading;

  final List<Widget>? actions;

  final Widget? bottomNavigationBar;

  final EdgeInsets padding;

  const BaseScreen(
      {Key? key,
      this.appBar,
      this.title = '',
      this.centerTitle = false,
      this.resizeToAvoidBottomInset = true,
      this.body,
      this.leading,
      this.useDefaultLeading = false,
      this.actions,
      this.bottomNavigationBar,
      this.padding = EdgeInsets.zero})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final defLeading = IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(
        Icons.arrow_back,
        color: Colors.black,
      ),
    );

    return Scaffold(
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      appBar: appBar ??
          AppBar(
            shadowColor: Color.fromARGB(150, 0, 0, 0),
            elevation: 30,
            backgroundColor: Colors.white,
            title: TextApple(
              title,
              size: 18,
              type: TextType.Bold,
            ),
            centerTitle: centerTitle,
            leading: useDefaultLeading ? defLeading : leading,
            actions: actions ?? [],
          ),
      body: Container(
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
