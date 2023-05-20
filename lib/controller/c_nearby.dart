import 'package:get/get.dart';
import 'package:hotel_app/model/hotel.dart';
import 'package:hotel_app/source/hotel_source.dart';

class CNearby extends GetxController {
  final _category = 'All Place'.obs;
  String get category => _category.value;
  set category(n) {
    _category.value = n;
    update();
  }

  List<String> get categories => [
        'All Place',
        'Industrial',
        'Village',
      ];

  final _listHotel = <Hotel>[].obs;
  List<Hotel> get listHotel => _listHotel.value;

  //Fungsi get data Hotel
  getListHotel() async {
    _listHotel.value = await HotelSource.getHotel();
    update();
  }

  //init GetXcontroller
  @override
  void onInit() {
    getListHotel();
    super.onInit();
  }
}
