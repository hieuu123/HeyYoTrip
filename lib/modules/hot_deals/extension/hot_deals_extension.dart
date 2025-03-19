import 'package:heyyo_trip/modules/hot_deals/enum/hot_deals_enum.dart';

extension SpecialCampaignExtension on SpecialCampaign {
  String get title {
    switch (this) {
      case SpecialCampaign.all:
        return 'All';
      case SpecialCampaign.hotels:
        return 'Hotels';
      case SpecialCampaign.flights:
        return 'Flights';
    }
  }

  String get icon {
    switch (this) {
      case SpecialCampaign.all:
        return 'assets/icons/campaign-all.svg';
      case SpecialCampaign.hotels:
        return 'assets/icons/campaign-hotels.svg';
      case SpecialCampaign.flights:
        return 'assets/icons/campaign-flights.svg';
    }
  }

  List<Map<String, String>> get campaigns {
    switch (this) {
      case SpecialCampaign.all:
        return [
          {
            'title': 'Hot Hotel Deals in March',
            'image': 'assets/images/campaign-hotel.png',
            'description':
                'Lorem ipsum dolor sit amet,consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut',
            'time': 'from March 15, 2022 - March 31, 2022',
          },
          {
            'title': 'Hot Flight Deals in March',
            'image': 'assets/images/campaign-flight.png',
            'description':
                'Lorem ipsum dolor sit amet,consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut',
            'time': 'from March 15, 2022 - March 31, 2022',
          },
        ];
      case SpecialCampaign.hotels:
        return [
          {
            'title': 'Hot Hotel Deals in March',
            'image': 'assets/images/campaign-hotel.png',
            'description':
                'Lorem ipsum dolor sit amet,consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut',
            'time': 'from March 15, 2022 - March 31, 2022',
          }
        ];
      case SpecialCampaign.flights:
        return [
          {
            'title': 'Hot Flight Deals in March',
            'image': 'assets/images/campaign-flight.png',
            'description':
                'Lorem ipsum dolor sit amet,consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut',
            'time': 'from March 15, 2022 - March 31, 2022',
          }
        ];
    }
  }

  List<Map<String, String>> get promotionCode {
    switch (this) {
      case SpecialCampaign.all:
        return [
          {
            'title': 'Lorem ipsum dolor',
            'image': 'assets/images/promotion-ticket-featured.jfif',
            'description1': 'Giảm 15% cho khách sạn nội địa.',
            'description2': 'Giảm 25% cho khách sạn ngoại quốc.',
            'time': 'EXP: dd/mm/yyyy - hh:mm (AM/PM)',
          },
          {
            'title': 'Lorem ipsum dolor',
            'image': 'assets/images/promotion-ticket-featured.jfif',
            'description1': 'Giảm 15% cho khách sạn nội địa.',
            'description2': 'Giảm 25% cho khách sạn ngoại quốc.',
            'time': 'EXP: dd/mm/yyyy - hh:mm (AM/PM)',
          },
          {
            'title': 'Lorem ipsum dolor',
            'image': 'assets/images/promotion-ticket-featured.jfif',
            'description1': 'Giảm 15% cho khách sạn nội địa.',
            'description2': 'Giảm 25% cho khách sạn ngoại quốc.',
            'time': 'EXP: dd/mm/yyyy - hh:mm (AM/PM)',
          },
          {
            'title': 'Lorem ipsum dolor',
            'image': 'assets/images/promotion-ticket-featured.jfif',
            'description1': 'Giảm 15% cho khách sạn nội địa.',
            'description2': 'Giảm 25% cho khách sạn ngoại quốc.',
            'time': 'EXP: dd/mm/yyyy - hh:mm (AM/PM)',
          },
          {
            'title': 'Lorem ipsum dolor',
            'image': 'assets/images/promotion-ticket-featured.jfif',
            'description1': 'Giảm 15% cho khách sạn nội địa.',
            'description2': 'Giảm 25% cho khách sạn ngoại quốc.',
            'time': 'EXP: dd/mm/yyyy - hh:mm (AM/PM)',
          },
          {
            'title': 'Lorem ipsum dolor',
            'image': 'assets/images/promotion-ticket-featured.jfif',
            'description1': 'Giảm 15% cho khách sạn nội địa.',
            'description2': 'Giảm 25% cho khách sạn ngoại quốc.',
            'time': 'EXP: dd/mm/yyyy - hh:mm (AM/PM)',
          }
        ];
      case SpecialCampaign.hotels:
        return [
          {
            'title': 'Lorem ipsum dolor',
            'image': 'assets/images/promotion-ticket-featured.jfif',
            'description1': 'Giảm 15% cho khách sạn nội địa.',
            'description2': 'Giảm 25% cho khách sạn ngoại quốc.',
            'time': 'EXP: dd/mm/yyyy - hh:mm (AM/PM)',
          },
          {
            'title': 'Lorem ipsum dolor',
            'image': 'assets/images/promotion-ticket-featured.jfif',
            'description1': 'Giảm 15% cho khách sạn nội địa.',
            'description2': 'Giảm 25% cho khách sạn ngoại quốc.',
            'time': 'EXP: dd/mm/yyyy - hh:mm (AM/PM)',
          },
          {
            'title': 'Lorem ipsum dolor',
            'image': 'assets/images/promotion-ticket-featured.jfif',
            'description1': 'Giảm 15% cho khách sạn nội địa.',
            'description2': 'Giảm 25% cho khách sạn ngoại quốc.',
            'time': 'EXP: dd/mm/yyyy - hh:mm (AM/PM)',
          }
        ];
      case SpecialCampaign.flights:
        return [
          {
            'title': 'Lorem ipsum dolor',
            'image': 'assets/images/promotion-ticket-featured.jfif',
            'description1': 'Giảm 15% cho khách sạn nội địa.',
            'description2': 'Giảm 25% cho khách sạn ngoại quốc.',
            'time': 'EXP: dd/mm/yyyy - hh:mm (AM/PM)',
          },
          {
            'title': 'Lorem ipsum dolor',
            'image': 'assets/images/promotion-ticket-featured.jfif',
            'description1': 'Giảm 15% cho khách sạn nội địa.',
            'description2': 'Giảm 25% cho khách sạn ngoại quốc.',
            'time': 'EXP: dd/mm/yyyy - hh:mm (AM/PM)',
          },
          {
            'title': 'Lorem ipsum dolor',
            'image': 'assets/images/promotion-ticket-featured.jfif',
            'description1': 'Giảm 15% cho khách sạn nội địa.',
            'description2': 'Giảm 25% cho khách sạn ngoại quốc.',
            'time': 'EXP: dd/mm/yyyy - hh:mm (AM/PM)',
          }
        ];
    }
  }
}
