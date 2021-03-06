import 'package:firebase_remote_config/firebase_remote_config.dart';

class PlatformConstants {
  static const String android = 'android';
  static const String ios = 'ios';
}

class ImageAspectRatio {
  static const int ratioX = 4;
  static const int ratioY = 5;
}

class CustomColors {
  static const int bottomNavBarInactiveColor = 0xFFACC5C7;
}

class LoginProviders {
  static const String facebook = 'facebook';
  static const String google = 'google';
}

class Swipe {
  static const String left = 'left';
  static const String right = 'right';
}

class RemoteConfigs {
  static const String googleClientId = 'GOOGLE_CLIENT_ID';
  static const String debugNavEnabled = 'SHOW_DEBUG_NAV';
  static const String maxPhotoCount = 'MAXIMUM_PHOTO_COUNT';
  static const String minPhotoCount = 'MINIMUM_PHOTO_COUNT';
  static const String apiHostURL = 'API_HOST';
  static const String heightLowerBound = 'HEIGHT_LOWER_BOUND';
  static const String heightUpperBound = 'HEIGHT_UPPER_BOUND';
  static const String imageQuality = 'IMAGE_QUALITY';
}

class ErrorMessages {
  static const String somethingWentWrong = 'Something went wrong';
  static const String somethingWentWrongTryAgain =
      'Something went wrong! Try again?';
  static const String noInternetConnection = 'No internet connection';
  static const String invalidLinkedinUrl = 'must be a valid linkedin url';
  static const String googleLoginCancelled = 'google login cancelled';
  static const String couldNotLoadCamera = 'could not load camera';
  static const String pleaseGrantCameraPermission =
      'Please grant camera permission';
  static const String couldNotTakePicture = 'Could not take picture';
  static const String couldNotPickFile = 'Could not pick file';
  static const String couldNotLoadVerificationInfo =
      'could not load verification info';
  static const String pleaseUpdatePreferences = 'Please update preferences';
  static const String noLikesFound = 'No likes found! Try again?';
  static const String noMatchesFound = 'No Matches found! Try again?';
  static const String userNotFound = 'User not found';
  static String cannotDeleteLastNImages =
      'Cannot delete the last ${FirebaseRemoteConfig.instance.getInt(RemoteConfigs.minPhotoCount)} images';
}

class StorageKeys {
  static const String auth = 'auth_info';
  static const String locationUpdatedAt = 'location_updated_at';
  static const String fcmTimestamp = 'fcm_updated_at';
  static const String notifyWhileAppOpen = 'notify_while_app_open';
}

class VerificationTypes {
  static const String selfie = 'selfie';
  static const String identity = 'identity';
}

class ApprovalStatuses {
  static const String inReview = 'in_review';
  static const String approved = 'approved';
  static const String rejected = 'rejected';
}

class ApprovalFields {
  static const linkedin = 'linkedin_url';
  static const workDetails = 'work_info';
  static const education = 'education';
  static const selfie = 'selfie';
  static const identity = 'identity';
  static const birthday = 'birthday';
}

class NotificationEvents {
  static const String verificationUpdate = 'verification_update';
  static const String newMessage = 'new_message';
  static const String newMatch = 'new_match';
  static const String leftSwiped = 'left_swiped';
  static const String newLike = 'new_like';
  static const String matchClosed = 'match_closed';
}

class UserMatchStatuses {
  static const String rejected = 'rejected';
  static const String pending = 'pending';
  static const String matched = 'matched';
  static const String none = 'none';
}

class UserStatus {
  static const String paused = 'paused';
  static const String active = 'active';
}

class PreferenceKey {
  static const String children = 'children';
  static const String food = 'food';
  static const String smoking = 'smoking';
  static const String drinking = 'drinking';
  static const String exercise = 'exercise';
}

class PerformanceTraces {
  static const String chatConnection = 'CHAT_CONNECTION';
  static const String attributeStatus = 'status';
}
