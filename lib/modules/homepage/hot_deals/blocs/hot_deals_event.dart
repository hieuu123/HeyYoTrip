// import 'package:heyyo_trip/modules/homepage/hot_deals/enum/hot_deals_enum.dart';

abstract class HotDealsCategoryEvent {}

class HotDealsCategorySelected extends HotDealsCategoryEvent {
  final int index;
  HotDealsCategorySelected(this.index);
}
