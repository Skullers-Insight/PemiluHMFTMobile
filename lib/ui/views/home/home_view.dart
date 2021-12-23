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
      onModelReady: (model) {
        Future.delayed(const Duration(milliseconds: 500), () {
          model.revealHero();
        });
      },
      builder: (context, model, child) => Scaffold(
        backgroundColor: AppColors.bg,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        drawer: Drawer(),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Hero(model: model),
                AppText(
                  text: model.opacity.toString(),
                  color: AppColors.fontPrimary,
                  size: 20,
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  width: 20,
                  height: 3,
                  color: Colors.amber,
                ),
              ],
            ),
          ),
        ),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}

class Hero extends StatelessWidget {
  final HomeViewModel model;
  const Hero({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedOpacity(
          opacity: model.opacity,
          duration: const Duration(seconds: 1),
          child: SvgPicture.asset(
            'lib/assets/images/hero.svg',
            semanticsLabel: 'Pemilu HMFT',
          ),
        ),
        AnimatedPositioned(
          left: model.squareAxis.x,
          top: model.squareAxis.y,
          duration: const Duration(seconds: 1),
          child: Container(
            width: 100.0,
            height: 80.0,
            decoration: BoxDecoration(color: Colors.red),
            child: Text('hello'),
          ),
        ),
        Positioned(
          right: 30.0,
          top: 30.0,
          child: Container(
            width: 100.0,
            height: 80.0,
            decoration: BoxDecoration(color: Colors.red),
            child: Text('hello'),
          ),
        ),
      ],
    );
  }
}
