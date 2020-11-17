
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../model/my_theme_provider.dart';
import '../size_config.dart';
import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: SvgPicture.asset(
          "assets/icons/Settings.svg",
          color: Theme.of(context).iconTheme.color,
        ),
        onPressed: () {},
      ),
      actions: [
        buildAddButton(context),
      ],
    );
  }

  Padding buildAddButton(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenHeight(10)),
      child: Container(
        // width: 30,
        child: Consumer<MyThemeModel>(
          builder: (context, theme, child) => IconButton(
            tooltip: "Theme Mode",
            onPressed: () => theme.changeTheme(),
            icon: SvgPicture.asset(
              theme.isLisghtTheme
                  ? "assets/icons/Sun.svg"
                  : "assets/icons/Moon.svg",
              height: 24,
              width: 24,
            ),
          ),
        ),
      ),
    );
  }
}
