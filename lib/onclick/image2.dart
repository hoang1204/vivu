import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../global.dart';

class Anh2 extends ConsumerStatefulWidget {
  const Anh2({super.key});

  @override
  ConsumerState<Anh2> createState() => _Anh2State();
}

class _Anh2State extends ConsumerState<Anh2> {
  int i = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                SizedBox(
                  height: 300,
                  child: Container(
                    height: 300,
                    width: 260,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage("http://" +
                            IP +
                            "/vivu/account/uploads/${ref.watch(accountImage)[i].name}"),
                        fit: BoxFit.cover,
                      ),
                      border: Border.all(width: 2, color: Colors.white),
                      //borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        if (i == ref.read(accountImage).length - 1) {
                          i = ref.read(accountImage).length - 1;
                        } else {
                          i++;
                        }
                      });
                    },
                    icon: Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        if (i == 0) {
                          i = 0;
                        } else {
                          i--;
                        }
                      });
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
