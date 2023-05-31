import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hotel_app/model/booking.dart';

class bookingSource {
  static Future<Booking?> checkIsBooked(String userId, String hotelId) async {
    var result = await FirebaseFirestore.instance
        .collection('User')
        .doc(userId)
        .collection('Booking')
        .where('id_hotel', isEqualTo: hotelId)
        .where('is_done', isEqualTo: false)
        .get();

    if (result.size > 0) {
      return Booking.fromJson(result.docs.first.data());
    }
    return null;
  }

  static Future<bool> tambahBooking(String userId, Booking booking) async {
    var ref = FirebaseFirestore.instance
        .collection('User')
        .doc(userId)
        .collection('Booking');

    var docRef = await ref.add(booking.toJson());

    docRef.update({'id': docRef.id});
    return true;
  }
}
