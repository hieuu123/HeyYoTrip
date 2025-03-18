// import 'package:heyyo_trip/modules/hot_deals/enum/hot_deals_enum.dart';

abstract class HotDealsCategoryEvent {}

class HotDealsCategorySelected extends HotDealsCategoryEvent {
  final int index;
  HotDealsCategorySelected(this.index);
}
