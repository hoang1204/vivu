
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vivu/services/http_services.dart';

import 'card_info.dart';

class LoadCardLiked extends StateNotifier<List<CardInfo>> {
  LoadCardLiked(List<CardInfo>? state) : super(state ?? []);
  void loadData() async {
    print("Cardlike loaded");
    state = await getCardLiked();
    print(state);
  }
}
