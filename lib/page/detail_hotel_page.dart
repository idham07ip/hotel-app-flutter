import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:hotel_app/config/app_asset.dart';
import 'package:hotel_app/config/app_color.dart';
import 'package:hotel_app/config/app_format.dart';
import 'package:hotel_app/controller/c_user.dart';
import 'package:hotel_app/model/booking.dart';
import 'package:hotel_app/model/hotel.dart';
import 'package:hotel_app/source/booking_source.dart';
import 'package:hotel_app/widget/button_custom.dart';

class DetailHotelPage extends StatelessWidget {
  DetailHotelPage({super.key});

  final controllerUser = Get.put(CUser());

  final Rx<Booking> _bookedData = initBooking.obs;
  Booking get bookedData => _bookedData.value;
  set bookedData(Booking n) => _bookedData.value = n;

  final List facilitiesHotel = [
    {
      'icon': AppAsset.iconCoffee,
      'label': 'Lounge',
    },
    {
      'icon': AppAsset.iconOffice,
      'label': 'Office',
    },
    {
      'icon': AppAsset.iconWifi,
      'label': 'Wi-Fi',
    },
    {
      'icon': AppAsset.iconStore,
      'label': 'Store',
    },
  ];

  @override
  Widget build(BuildContext context) {
    Hotel hotel = ModalRoute.of(context)!.settings.arguments as Hotel;

    //Pengecekan Booking
    bookingSource
        .checkIsBooked(controllerUser.data.id!, hotel.id)
        .then((bookingValue) {
      bookedData = bookingValue ?? initBooking;
    });

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        title: Text(
          'Detail Hotels',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      //Price and book button
      // bottomNavigationBar: bookingNow(hotel, context),
      bottomNavigationBar: Obx(() {
        if (bookedData.id == '') return bookingNow(hotel, context);
        return viewReceiptHotel();
      }),
      //Details hotel
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),

        //Image List Hotels
        child: ListView(
          children: [
            const SizedBox(height: 24),
            Images(hotel),
            const SizedBox(height: 16),
            nameHotel(hotel, context),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(hotel.description),
            ),

            //
            const SizedBox(height: 16),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Facilities',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),

            //Layout icon Facilities
            gridFacilitiesHotel(),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Activities',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            const SizedBox(height: 16),
            activitiesHotel(hotel),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Container viewReceiptHotel() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Colors.grey[100]!, width: 1.5),
        ),
      ),
      height: 80,
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'You Booked This.',
            style: TextStyle(color: Colors.grey),
          ),
          Material(
            color: AppColor.secondaryColor,
            borderRadius: BorderRadius.circular(20),
            child: InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () {},
              child: const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 36,
                  vertical: 14,
                ),
                child: Text(
                  'View Receipt',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container bookingNow(Hotel hotel, BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Colors.grey[100]!, width: 1.5),
        ),
      ),
      height: 80,
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppFormat.currency(hotel.price.toDouble()),
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: AppColor.secondaryColor,
                        fontWeight: FontWeight.w900,
                      ),
                ),
                const Text(
                  'per Night',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),

          //Button
          ButtonCustom(
            label: 'Booking Now',
            onTap: () {},
          ),
        ],
      ),
    );
  }

  SizedBox activitiesHotel(Hotel hotel) {
    return SizedBox(
      height: 105,
      child: ListView.builder(
        itemCount: hotel.activities.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          Map activityHotel = hotel.activities[index];

          //Image activities
          return Padding(
            padding: EdgeInsets.fromLTRB(
              index == 0 ? 16 : 8,
              0,
              index == hotel.activities.length - 1 ? 16 : 8,
              0,
            ),
            child: Column(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      activityHotel['image'],
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                Text(activityHotel['name']),
              ],
            ),
          );
        },
      ),
    );
  }

  GridView gridFacilitiesHotel() {
    return GridView.builder(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
      itemCount: facilitiesHotel.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[200]!),
            borderRadius: BorderRadius.circular(24),
          ),

          //assets icon
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ImageIcon(
                AssetImage(
                  facilitiesHotel[index]['icon'],
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                facilitiesHotel[index]['label'],
                style: const TextStyle(fontSize: 13),
              )
            ],
          ),
        );
      },
    );
  }

  Padding nameHotel(Hotel hotel, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Hotel Name
                Text(
                  hotel.name,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),

                //Hotel Location
                Text(
                  hotel.location,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),

          //Show Icon
          const Icon(Icons.star, color: AppColor.starActiveIcon),
          const SizedBox(width: 4),

          //Rate hotel
          Text(
            hotel.rate.toString(),
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  //Images
  SizedBox Images(Hotel hotel) {
    return SizedBox(
      height: 180,
      child: ListView.builder(
        itemCount: hotel.images.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          //
          return Padding(
            padding: EdgeInsets.fromLTRB(
              index == 0 ? 16 : 8,
              0,
              index == hotel.images.length - 1 ? 16 : 8,
              0,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                hotel.images[index],
                fit: BoxFit.cover,
                height: 180,
                width: 240,
              ),
            ),
          );
        },
      ),
    );
  }
}
