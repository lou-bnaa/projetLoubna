import 'package:flutter/material.dart';
import 'package:newprojet/projet/home.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final PageController _pageController = PageController();

  int _activePage = 0;

  void onNextPage() {
    if (_activePage < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.linear,
      );
    }
  }

  final List<Map<String, dynamic>> _pages = [
    {
      'color': '#FFEBEB',
      
      'title1': 'Start Finding Your Version ',
      'title2': 'The Best Fashion Style',
      'image': 'assets/images/02.jpg',
      'description':
          'Are you ready to make a perfect for your friends or your family? make perfect and help your self',
      'skip': true
    },
    {
      'color': '#D14D72',
      
      'title1': 'Start Finding Your Version ',
      'title2': 'The Best Fashion Style',
      'image': 'assets/images/02.jpg',
      'description':
          'Are you ready to make a perfect for your friends or your family? make perfect and  help your self',
      'skip': true
    },
    {
      'color': '#B71375',
      
      'title1': 'Start Finding Your Version ',
      'title2': 'The Best Fashion Style',
      'image': 'assets/images/03.jpg',
      'description':
          'Are you ready to make a perfect for your friends or your family? make perfect and  help your self',
      'skip': false
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
              controller: _pageController,
              itemCount: _pages.length,
              onPageChanged: (int page) {
                setState(() {
                  _activePage = page;
                });
              },
              itemBuilder: (BuildContext context, int index) {
                return Home(
                  color: _pages[index]['color'],
                  title1: _pages[index]['title1'],
                  
                  title2: _pages[index]['title2'],
                  description: _pages[index]['description'],
                  image: _pages[index]['image'],
                  skip: _pages[index]['skip'],
                  onTab: onNextPage,
                );
              }),
          Positioned(
            bottom: MediaQuery.of(context).size.height / 6.75,
            right: 0,
            left: 0,
            child: Column(
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _buildIndicator())
              ],
            ),
          )
        ],
      ),
    );
  }

  List<Widget> _buildIndicator() {
    final indicators = <Widget>[];

    for (var i = 0; i < _pages.length; i++) {
      if (_activePage == i) {
        indicators.add(_indicatorsTrue());
      } else {
        indicators.add(_indicatorsFalse());
      }
    }
    return indicators;
  }

  Widget _indicatorsTrue() {
    final String color;
    if (_activePage == 0) {
      color = '#FFEBEB';
    } else if (_activePage == 1) {
      color = '#D14D72';
    } else {
      color = '#B71375';
    }

    return AnimatedContainer(
      duration: const Duration(microseconds: 300),
      height: 8,
      width: 8,
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: hexToColor(color),
      ),
    );
  }

  Widget _indicatorsFalse() {
    return AnimatedContainer(
      duration: const Duration(microseconds: 300),
      height: 8,
      width: 8,
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.grey.shade100,
      ),
    );
  }
}
