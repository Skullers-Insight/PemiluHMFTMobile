import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pemilu_mobile/ui/views/home/home_viewmodel.dart';
import 'package:pemilu_mobile/utils/app_color.dart';
import 'package:pemilu_mobile/utils/app_text.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        backgroundColor: AppColors.bg,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        drawer: Drawer(),
        body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              SvgPicture.asset(
                'lib/assets/images/hero.svg',
                semanticsLabel: 'Pemilu HMFT',
              ),
              AppText(
                text: "Welcome Skullers",
                color: AppColors.fontPrimary,
              ),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
