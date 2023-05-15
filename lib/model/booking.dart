class Booking {
  String id;
  String name;
  String cover;
  List<String> images;
  int price;
  String location;
  int guest;
  String breakfast;
  String checkInTime;
  String night;

  Booking({
    required this.id,
    required this.name,
    required this.cover,
    required this.images,
    required this.price,
    required this.location,
    required this.guest,
    required this.breakfast,
    required this.checkInTime,
    required this.night,
  });

  factory Booking.fromJson(Map<String, dynamic> json) => Booking(
        id: json["id"],
        name: json["name"],
        cover: json["cover"],
        images: List<String>.from(json["images"].map((x) => x)),
        price: json["price"],
        location: json["location"],
        guest: json["guest"],
        breakfast: json["breakfast"],
        checkInTime: json["check_in_time"],
        night: json["night"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "cover": cover,
        "images": List<dynamic>.from(images.map((x) => x)),
        "price": price,
        "location": location,
        "guest": guest,
        "breakfast": breakfast,
        "check_in_time": checkInTime,
        "night": night,
      };
}
