import 'package:get/get.dart';
import 'package:hotel_app/model/booking.dart';
import 'package:hotel_app/model/hotel.dart';
import 'package:hotel_app/source/booking_source.dart';
import 'package:hotel_app/source/hotel_source.dart';

class CHistory extends GetxController {
  final _listHistory = <Booking>[].obs;
  List<Booking> get listHistory => _listHistory.value;

  getListHistory(String id) async {
    _listHistory.value = await bookingSource.getHistory(id);
    update();
  }
}
