class AppLinks {
  static const String updateBirthday = '/birthday';
  static const String updateGender = '/gender';
  static const String updateInterestedGenders = '/interested_genders';
  static const String updateWorkDetails = '/work_details';
  static const String updateEducationHistory = '/education_history';
  static const String login = '/login';
  static const String updateLinkedInURL = '/linkedin_url';
  static const String updateImages = '/images';
  static const String selfieVerification = '/selfie_verification';
  static const String identityVerification = '/identity_verification';
  static const String homePage = '/home';
  static const String splash = '/splash';
  static const String underVerification = '/under_verification';
  static const String verificationRejected = '/rejected';
  static const String helpPage = 'help';
  static const String webview = 'webview';
  static const String editProfile = 'edit_profile';
  static const String editHometown = '/edit_hometown';
  static const String editReligion = '/edit_religion';
  static const String editLanguage = '/edit_language';
  static const String updatePreferences = '/update_preferences/:preferenceFor';
  static const String editHeight = '/edit_height';
  static const String updateMatchingPreferences =
      'update__matching_preferences';
  static const String accountSettings = '/account_settings';
  static const String reportUser = '/users/report';
  static const String profileDetailsRoute = '/profile_details/:id';
  static String profileDetails(int id) {
    return '/profile_details/${id.toString()}';
  }

  static const String messagesForMatchRoute = '/matches/messages';
  static String back = 'back';
}

class HomepageTabs {
  static const String discover = '';
  static const String likes = 'likes';
  static const String matches = 'matches';
  static const String profile = 'profile';
}

class LikePageTabs {
  static const String received = '';
  static const String sent = 'sent';
}
