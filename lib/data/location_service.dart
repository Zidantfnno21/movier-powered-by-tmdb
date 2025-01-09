import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:logging/logging.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:the_movie_databases/utils/result.dart';

class LocationService {
  final _log = Logger('LocationService');
   Future<Result<Map<String, String?>>> getLocationToIso31661() async {
    try {
      _log.info('Checking location permissions...');

      PermissionStatus status = await Permission.locationWhenInUse.status;
      if (!status.isGranted) {
        _log.warning('Location permission denied by user.');
        status = await Permission.locationWhenInUse.request();
        if (!status.isGranted) {
          _log.warning('Location permission denied by user.');
          return Result.error(Exception('Location permission denied.'));
        }
      }

      _log.info('Location permission granted. Fetching location...');
      const LocationSettings locationSettings = LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 100,
      );

      final position = await Geolocator.getCurrentPosition(locationSettings: locationSettings);
      final placemarks = await placemarkFromCoordinates(
          position.latitude, position.longitude);

      final countryName = placemarks.first.country;
      final countryCode = placemarks.first.isoCountryCode;

      _log.info('Country name: $countryName, Country code: $countryCode');

      if (countryName != null && countryCode != null) {
        return Result.ok({
          countryName : countryCode,
        });
      } else {
        return Result.error(Exception('Unable to fetch country details.'));
      }
    } catch (e) {
      _log.severe(e.toString());
      return Result.error(Exception(e));
    }
  }
}  