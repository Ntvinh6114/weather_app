import 'package:geolocator/geolocator.dart';


class LocationService {

  Future<Position?> getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // dich vu dinh vi dang tat
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    // nguoi dung chua cap quyen
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    // quyen bi chan
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.'
      );
    }

    // tra ve toa do
    print('Đã lấy được vị trí!');
    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }
}