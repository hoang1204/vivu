import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:vivu/global.dart';
import 'package:vivu/services/http_services.dart';

class Search extends ConsumerStatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  ConsumerState<Search> createState() => _SearchState();
}

class _SearchState extends ConsumerState<Search> {
  bool _loading = true;
  @override
  void initState() {
    super.initState();

    Future<void> waiting() async {
      print("HUEEEEEEEEEE");
      print(ref.watch(cardSwipe2));
      if (!ref.watch(cardSwipe2).isEmpty) {
        setState(() {
          _loading = false;
        });
      }
    }
  }

  final CardSwiperController controller = CardSwiperController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color.fromARGB(255, 194, 96, 125), Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.7, 1],
              ),
            ),
          ),
          Stack(
            children: [
              Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
              Column(
                children: [
                  (_loading == false)
                      ? CircularProgressIndicator(
                          color: Colors.blue,
                        )
                      : Flexible(
                          child: CardSwiper(
                            isLoop: false,
                            onSwipe: (index, direction) async {
                              if (direction == CardSwiperDirection.left) {
                                ref.read(cardLiked.notifier).loadData();
                                ref.read(listQuan.notifier).loadData();
                                ref.read(cardSwipe2.notifier).del(index);
                                ref
                                    .read(accountInstaneInfo.notifier)
                                    .loadData("${accountInstane?.id}");
                                ref
                                    .read(accountInstaneImage.notifier)
                                    .loadData("${accountInstane?.id}");
                                await swipeLeft(
                                    "${ref.read(listCardInfo)[index].id}");
                                ref.read(cardLiked.notifier).loadData();
                                ref.read(cardSwipe2.notifier).loadData();
                              }
                            },
                            isVerticalSwipingEnabled: false,
                            controller: controller,
                            cards: ref.watch(cardSwipe2),
                          ),
                        ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FloatingActionButton(
                          backgroundColor: Color.fromARGB(255, 241, 78, 127),
                          onPressed: controller.swipeLeft,
                          child: const Icon(Icons.thumb_up),
                        ),
                        FloatingActionButton(
                          backgroundColor: Color.fromARGB(255, 241, 78, 127),
                          onPressed: controller.swipeRight,
                          child: const Icon(Icons.next_plan),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
