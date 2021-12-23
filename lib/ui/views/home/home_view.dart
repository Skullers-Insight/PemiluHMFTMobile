import 'package:flutter/material.dart';
import 'package:pemilu_mobile/ui/views/home/home_viewmodel.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Text(model.title),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: model.selectedIndex,
          onTap: model.onItemTapped,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.call),
              label: 'Calls',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.camera),
              label: 'Camera',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: 'Chats',
            ),
          ],
        ),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
