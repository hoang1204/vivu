import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';


class LoadCardSwipe extends StateNotifier<List<Widget>> {
  LoadCardSwipe(List<Widget>? state) : super(state ?? []);
  void loadData() async {
    print(state);
  }

  void del(index) {
    state.removeAt(index);
  }
}
