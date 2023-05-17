import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hotel_app/config/app_asset.dart';
import 'package:hotel_app/config/app_route.dart';
import 'package:hotel_app/widget/button_custom.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          AppAsset.bgIntro,
          fit: BoxFit.cover,
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.4,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Colors.black,
                Colors.transparent,
              ],
            ),
          ),
        ),

        //Penambahan TEXT
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Your Great Life\nStarts Here',
                style: Theme.of(context).textTheme.headline4!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                    ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'More than just a hotel',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                    ),
              ),
              const SizedBox(
                height: 30,
              ),

              //Button Custom
              ButtonCustom(
                label: 'Get Started',
                onTap: () {
                  Navigator.pushReplacementNamed(context, AppRoute.signIn);
                },
                isExpand: true,
              )
            ],
          ),
        )
      ],
    ));
  }
}
