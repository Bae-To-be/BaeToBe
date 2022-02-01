class PlatformConstants {
  static const String android = 'android';
  static const String ios = 'ios';
}

class CustomColors {
  static const int bottomNavBarInactiveColor = 0xFFACC5C7;
}

class LoginProviders {
  static const String facebook = 'facebook';
  static const String google = 'google';
}

class RemoteConfigs {
  static const String googleClientId = 'GOOGLE_CLIENT_ID';
  static const String debugNavEnabled = 'SHOW_DEBUG_NAV';
  static const String maxPhotoCount = 'MAXIMUM_PHOTO_COUNT';
  static const String minPhotoCount = 'MINIMUM_PHOTO_COUNT';
}

class ErrorMessages {
  static const String somethingWentWrong = 'Something went wrong';
  static const String noInternetConnection = 'No internet connection';
  static const String invalidLinkedinUrl = 'must be a valid linkedin url';
  static const String googleLoginCancelled = 'google login cancelled';
  static const String couldNotLoadCamera = 'could not load camera';
  static const String pleaseGrantCameraPermission =
      'Please grant camera permission';
  static const String couldNotTakePicture = 'Could not take picture';
  static const String couldNotPickFile = 'Could not pick file';
  static const String couldNotLoadVerificationinfo =
      'could not load verification info';
}

class StorageKeys {
  static const String auth = 'auth_info';
  static const String locationUpdatedAt = 'location_updated_at';
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
