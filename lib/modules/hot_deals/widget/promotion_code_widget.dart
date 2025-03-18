import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:heyyo_trip/common/widget/text.dart';
import 'package:heyyo_trip/modules/hot_deals/blocs/hot_deals_bloc.dart';
import 'package:heyyo_trip/modules/hot_deals/blocs/hot_deals_state.dart';
import 'package:heyyo_trip/modules/hot_deals/enum/hot_deals_enum.dart';
import 'package:heyyo_trip/modules/hot_deals/extension/hot_deals_extension.dart';

class PromotionContent extends StatelessWidget {
  const PromotionContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HotDealsCategoryBloc, HotDealsCategoryState>(
        builder: (context, state) {
      int selectedIndex = (state as HotDealsCategoryInitial).selectedIndex;
      var filteredData = SpecialCampaign.values[selectedIndex].promotionCode;
      final maxHeight = MediaQuery.of(context).size.height;
      final maxWidth = MediaQuery.of(context).size.width;
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
                height: maxHeight - 405,
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: filteredData.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () =>
                            GoRouter.of(context).push('/promotion-details'),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: SizedBox(
                            width: maxWidth - 32,
                            height: maxHeight / 8.5,
                            child: Row(
                              children: [
                                Container(
                                  width: maxWidth / 4.75,
                                  decoration: const BoxDecoration(
                                      border: Border(
                                          top: BorderSide(
                                              width: 1.5,
                                              color: Color(0xFFD7D7D7)),
                                          bottom: BorderSide(
                                              width: 1.5,
                                              color: Color(0xFFD7D7D7)),
                                          left: BorderSide(
                                              width: 1.5,
                                              color: Color(0xFFD7D7D7)))),
                                  child: Column(
                                    children: [
                                      Expanded(
                                          child: Image.asset(filteredData[index]
                                                  ['image'] ??
                                              ''))
                                    ],
                                  ),
                                ),
                                SvgPicture.asset(
                                    'assets/icons/promotion-ticket-divider.svg'),
                                Expanded(
                                  child: Container(
                                    decoration: const BoxDecoration(
                                        border: Border(
                                            top: BorderSide(
                                                width: 1.5,
                                                color: Color(0xFFD7D7D7)),
                                            bottom: BorderSide(
                                                width: 1.5,
                                                color: Color(0xFFD7D7D7)),
                                            right: BorderSide(
                                                width: 1.5,
                                                color: Color(0xFFD7D7D7)))),
                                    child: Stack(children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 3, bottom: 4),
                                            child: HeadingText(
                                              text: filteredData[index]
                                                      ['title'] ??
                                                  '',
                                              fontsize: 14,
                                              color: const Color(0xFF333333),
                                            ),
                                          ),
                                          BodyText(
                                            text: filteredData[index]
                                                    ['description1'] ??
                                                '',
                                            fontsize: 12,
                                            color: const Color(0xFF333333),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 2, bottom: 8),
                                            child: BodyText(
                                              text: filteredData[index]
                                                      ['description2'] ??
                                                  '',
                                              fontsize: 12,
                                              color: const Color(0xFF333333),
                                            ),
                                          ),
                                          BodyText(
                                            text: filteredData[index]['time'] ??
                                                '',
                                            fontsize: 12,
                                            color: const Color(0xFF666666),
                                          )
                                        ],
                                      ),
                                      Positioned(
                                          top: 8,
                                          right: 8,
                                          child: SvgPicture.asset(
                                              'assets/icons/notice.svg')),
                                    ]),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    })),
          )
        ],
      );
    });
  }
}

class TermAndCondition extends StatelessWidget {
  final bool isShow;

  TermAndCondition({this.isShow = true, super.key});

  final List<String> promotionTerms = [
    "Booking period: From 8:00 a.m Oct 25 - 11:59 p.m Nov 12, 2022.",
    "Promotion applies for all airlines, except AirAsia.",
    "For international flights, only applicable for flights departing from Vietnam.",
    "Each customer (using 1 phone number, 1 email, 1 credit card, and 1 device) can only use 1 coupon during the promotion period.",
    "The program may end sooner than expected without prior notice due to the limited number of coupons.",
    "These coupons cannot be combined with other coupons of HeyoTrip.",
    "Valid for transactions in VND only.",
    "These coupons are not transferable or exchangeable for cash.",
    "The promotion can be combined with HeyoTrip loyalty points for Heyo members.",
    "Customers who misuse or violate the terms and conditions will be denied future use of HeyoTrip offers.",
    "HeyoTrip reserves the right to cancel and deny any coupon usage if deemed as misuse or fraudulent activities for profit.",
    "HeyoTrip will not be liable to offer a replacement coupon if it is discontinued, canceled, or used improperly due to fraud or technical issues.",
    "HeyoTrip reserves the right to change the terms and conditions without prior notice."
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: promotionTerms.length,
      itemBuilder: (context, index) {
        return Visibility(
          visible: isShow,
          child: ListTile(
            leading: BodyText(text: '${index+1}.', fontsize: 14, color: const Color(0xFF333333),),
            title: BodyText(text: promotionTerms[index], fontsize: 14, color: const Color(0xFF333333),),
          ),
        );
      }
    );
  }
}
