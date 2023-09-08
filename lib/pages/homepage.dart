import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:vivu/global.dart';
import 'package:vivu/pages/bottomPage/home.dart';
import 'package:vivu/pages/bottomPage/likes.dart';
import 'package:vivu/pages/login.dart';

import '../services/http_services.dart';
import 'bottomPage/message.dart';
import 'bottomPage/profile.dart';
import 'bottomPage/search.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  bool _isLoading = true;
  @override
  void initState() {
   // ref.read(listTags.notifier).loadData();
    ref.read(accountInstaneInfo.notifier).loadData("${accountInstane?.id}");
    print("LOAD INFOR");
   ref.read(accountInstaneImage.notifier).loadData("${accountInstane?.id}");
    ref.read(cardSwipe2.notifier).loadData();
    super.initState();
    Future.delayed(Duration(seconds: 2), () async {
      ref.read(cardSwipe.notifier).state =
          await buildCard(ref.read(listCardInfo));
      setState(() {
        _isLoading = false;
      });
    });
  }

  var _currentIndex = 0;
  final List<Widget> PageHome = [
    Home(),
    Likes(),
    Profile(),
    Search(),
    Message(),
  ];
  // late PageController _pageController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 245, 240, 240),
        foregroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/icon.png",
              width: 30,
            ),
            Image.asset(
              "assets/images/name.png",
              width: 80,
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {
                accountInstane = null;
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => LoginPage()));
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: _isLoading == true
          ? Center(child: const CircularProgressIndicator())
          : PageTransitionSwitcher(
              transitionBuilder: (child, animation, secondaryAnimation) {
                return FadeThroughTransition(
                  child: child,
                  animation: animation,
                  secondaryAnimation: secondaryAnimation,
                );
              },
              child: PageHome[_currentIndex],
            ),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() {
          _currentIndex = i;
        }),
        items: [
          /// Home
          SalomonBottomBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
            selectedColor: Colors.purple,
          ),

          /// Likes
          SalomonBottomBarItem(
            icon: Icon(Icons.favorite_border),
            title: Text("Liked"),
            selectedColor: Colors.pink,
          ),

          /// Search
          /// Profile
          SalomonBottomBarItem(
            icon: Icon(Icons.person),
            title: Text("Profile"),
            selectedColor: Colors.teal,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.search),
            title: Text("Search"),
            selectedColor: Color.fromARGB(255, 80, 75, 232),
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.messenger),
            title: Text("Messenger"),
            selectedColor: Colors.orange,
          ),
        ],
      ),
    );
  }
}
