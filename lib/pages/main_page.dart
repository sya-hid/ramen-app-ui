import 'package:flutter/material.dart';
import 'package:ramen_app_ui/consts.dart';
import 'package:ramen_app_ui/models/bottom_icon_model.dart';
import 'package:ramen_app_ui/pages/home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    Widget body() {
      switch (currentPage) {
        case 0:
          return const HomePage();
        case 1:
          return Center(
              child: Text('Message Page',
                  style: roboto.copyWith(color: black, fontSize: 28)));
        case 2:
          return Center(
              child: Text('Explore Page',
                  style: roboto.copyWith(color: black, fontSize: 28)));
        case 3:
          return Center(
              child: Text('Profile Page',
                  style: roboto.copyWith(color: black, fontSize: 28)));
        default:
          return Center(
              child: Text('Something Wrong !!',
                  style: roboto.copyWith(color: black, fontSize: 28)));
      }
    }

    return Scaffold(
      backgroundColor: bgColor,
      body: body(),
      bottomNavigationBar: Container(
        height: 86,
        color: white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ...List.generate(
                bottomIcons.length,
                (index) => GestureDetector(
                      onTap: () {
                        setState(() {
                          currentPage = index;
                        });
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            currentPage == index
                                ? bottomIcons[index].selected
                                : bottomIcons[index].unselected,
                            color: black,
                          ),
                          const SizedBox(height: 10),
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 250),
                            decoration: const BoxDecoration(
                                color: black, shape: BoxShape.circle),
                            width: currentPage == index ? 7 : 0,
                            height: currentPage == index ? 7 : 0,
                          )
                        ],
                      ),
                    ))
          ],
        ),
      ),
    );
  }
}
