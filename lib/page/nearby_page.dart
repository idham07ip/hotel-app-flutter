import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_app/config/app_asset.dart';
import 'package:hotel_app/config/app_color.dart';
import 'package:hotel_app/controller/c_nearby.dart';

class NearbyPage extends StatelessWidget {
  NearbyPage({super.key});

  final controllerNearby = Get.put(CNearby());

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 24),

        //
        header(context),

        const SizedBox(height: 20),

        //
        searchField(),

        //
        const SizedBox(height: 30),

        //GetBuilder
        categories(),
      ],
    );
  }

  GetBuilder<CNearby> categories() {
    return GetBuilder<CNearby>(builder: (_) {
        return SizedBox(
          height: 45,
          child: ListView.builder(
            itemCount: _.categories.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              String category = _.categories[index];
              return Padding(
                padding: EdgeInsets.fromLTRB(
                  index == 0 ? 16 : 8,
                  0,
                  index == controllerNearby.categories.length - 1 ? 16 : 8,
                  0,
                ),

                //
                child: Material(
                  color: category == _.category
                      ? AppColor.primaryColor
                      : Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  child: InkWell(
                    onTap: () {
                      controllerNearby.category = category;
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Text(
                        category,
                        style:
                            Theme.of(context).textTheme.titleSmall!.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      });
  }

  //Search
  Container searchField() {
    return Container(
      height: 45,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Stack(
        children: [
          Container(
            height: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
            ),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),

                //hintText
                hintText: 'Search by name or city',
                hintStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
              ),

              //
            ),
          ),

          //IconSearch
          Align(
            alignment: Alignment.centerRight,
            child: Material(
              color: AppColor.secondaryColor,
              borderRadius: BorderRadius.circular(45),
              child: InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(45),
                child: const SizedBox(
                  width: 45,
                  height: 45,
                  child: Center(
                    child: ImageIcon(
                      AssetImage(AppAsset.iconSearch),
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  //Header picProfile
  Padding header(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset(
              AppAsset.profile,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),

          //Near Me
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Near Me',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.w900,
                    ),
              ),
              const Text(
                '100 Hotels',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
