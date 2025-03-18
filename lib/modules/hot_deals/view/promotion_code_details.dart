import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:heyyo_trip/common/widget/button.dart';
import 'package:heyyo_trip/common/widget/text.dart';
import 'package:heyyo_trip/modules/hot_deals/widget/promotion_code_widget.dart';
import 'package:heyyo_trip/modules/hot_deals/widget/appbar.dart';

class PromotionCodeDetails extends StatefulWidget {
  const PromotionCodeDetails({super.key});

  @override
  State<PromotionCodeDetails> createState() => PromotionCodeDetailsState();
}

class PromotionCodeDetailsState extends State<PromotionCodeDetails> {
  bool isShow = true;
  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;
      final maxHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const PromotionCodeDetailsAppBar(
        title: 'Promotion detail',
      ),
      body: Stack(
        children: [
          Column(
            children: [
              const Center(
                  child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: SubHeadingText(
                  text: 'Lorem ipsum dolor sit amet',
                  fontsize: 18,
                  color: Color(0xFF333333),
                ),
              )),
              const Padding(
                padding: EdgeInsets.only(left: 35, right: 35, bottom: 20),
                child: BodyText(
                  text:
                      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam,',
                  color: Color(0xFF333333),
                ),
              ),
              Container(
                width: maxWidth - 70,
                height: 145,
                decoration: BoxDecoration(
                    border: const Border(
                      top: BorderSide(width: 1, color: Color(0xFF0770CD)),
                      bottom: BorderSide(width: 1, color: Color(0xFF0770CD)),
                      right: BorderSide(width: 1, color: Color(0xFF0770CD)),
                      left: BorderSide(width: 20, color: Color(0xFF0770CD)),
                    ),
                    borderRadius: BorderRadius.circular(5)),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 1,
                                color: const Color.fromARGB(38, 0, 0, 0))),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(
                                      'assets/icons/flight-promotion.svg'),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  const HeadingText(
                                    text: 'CODE123456',
                                    fontsize: 16,
                                    color: Color(0xFF0D276E),
                                  ),
                                ],
                              ),
                              SvgPicture.asset('assets/icons/copy.svg'),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: BodyText(
                          text:
                              'APPLY ONLY | 10% discount up to 1,000,000 VND when booking domestic hotels from only 2,000,000 VND',
                          fontsize: 14,
                          color: Color(0xFF888888)),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  width: maxWidth - 70,
                  height: 80,
                  decoration: const BoxDecoration(
                      border: Border(
                          top: BorderSide(width: 0.5, color: Color(0xFFD7D7D7)),
                          bottom:
                              BorderSide(width: 0.5, color: Color(0xFFD7D7D7)))),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: SubHeadingText(
                          text: 'Valid time',
                          fontsize: 14,
                          color: Color(0xFF333333),
                        ),
                      ),
                      BodyText(
                        text:
                            'dd/mm/yyyy - hh:mm (AM/PM) - dd/mm/yyyy - hh:mm (AM/PM)',
                        fontsize: 14,
                        color: Color(0xFF333333),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 35, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SubHeadingText(
                      text: 'Term and condition',
                      fontsize: 14,
                      color: Color(0xFF333333),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          isShow = !isShow;
                        });
                      },
                      icon: isShow
                          ? RotatedBox(
                              quarterTurns: 2,
                              child: SvgPicture.asset('assets/icons/down.svg'),
                            )
                          : SvgPicture.asset('assets/icons/down.svg'),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: (maxHeight < 700) ? (maxHeight - 600) : (maxHeight - 650),
                child: TermAndCondition(isShow: isShow))
            ],
          ),
          Positioned(
            bottom: 10,
            left: 35,
            right: 35,
            child: SecondaryButton(text: 'Book flight now!', onPressed: () {}, color: const Color(0xFF0770CD), vertical: 8,)
          ),
        ],
      ),
    );
  }
}
