import 'package:baetobe/constants/app_constants.dart';
import 'package:baetobe/domain/user_provider.dart';
import 'package:baetobe/infrastructure/secure_storage_provider.dart';
import 'package:baetobe/utils/datetime.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:geocoding/geocoding.dart' as geo;
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:location/location.dart';

final locationProvider = Provider((ref) => LocationService(ref));

class LocationService {
  final Ref ref;
  final Location _location = Location();

  LocationService(this.ref);

  Future<void> syncLocationIfRequired() async {
    final storage = ref.read(secureStorageProvider);
    String? value = await storage.read(key: StorageKeys.locationUpdatedAt);
    if (value != null &&
        (DateTime.now().difference(dateFormat.parse(value)).inHours < 24)) {
      return;
    }
    await _syncLocation();
    await storage.write(
        key: StorageKeys.locationUpdatedAt,
        value: dateFormat.format(DateTime.now()));
  }

  Future<void> _syncLocation() async {
    await _requestPermission();
    geo.Placemark? placemark;
    LocationData _locationData = await _location.getLocation();
    if (_locationData.longitude != null && _locationData.latitude != null) {
      try {
        placemark = (await geo.placemarkFromCoordinates(
            _locationData.latitude!, _locationData.longitude!))[0];
        await ref.read(userProvider.notifier).updateAttributes({
          'location': {
            'lat': _locationData.latitude,
            'lng': _locationData.longitude,
            'country_code': placemark.isoCountryCode,
            'locality': placemark.locality,
          }
        });
      } catch (e) {
        await FirebaseCrashlytics.instance
            .recordError(e, null, reason: 'Could not perform reverse geo code');
        await ref.read(userProvider.notifier).updateAttributes({
          'location': {
            'lat': _locationData.latitude,
            'lng': _locationData.longitude,
          }
        });
      }
    }
  }

  Future<bool> _requestPermission() async {
    if (!await _location.serviceEnabled()) {
      if (!await _location.requestService()) {
        return _requestPermission();
      }
    }
    PermissionStatus _permissionGranted = await _location.hasPermission();
    if (_permissionGranted != PermissionStatus.granted) {
      _permissionGranted = await _location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return _requestPermission();
      }
    }
    return true;
  }
}
