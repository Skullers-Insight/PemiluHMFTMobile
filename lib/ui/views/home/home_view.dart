import 'dart:async';

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
        Timer.periodic(const Duration(milliseconds: 10),
            (Timer t) => model.afterRevealAnimation());
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
    return Column(
      children: [
        SvgPicture.asset(
          'lib/assets/svg/hero.svg',
          semanticsLabel: 'Pemilu HMFT',
          height: 150,
        ),
        AnimatedOpacity(
          opacity: model.opacity,
          duration: const Duration(seconds: 1),
          child: Stack(
            alignment: Alignment.center,
            children: [
              SvgPicture.asset(
                'lib/assets/svg/mask.svg',
                semanticsLabel: 'Pemilu HMFT',
                height: 300,
              ),
              Positioned(
                bottom: 0,
                child: Align(
                  child: Column(
                    children: [
                      AppText(
                        text: "Welcome Skullers!",
                        color: AppColors.fontPrimary,
                        size: 20,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        width: 20,
                        height: 3,
                        color: AppColors.secondary,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
