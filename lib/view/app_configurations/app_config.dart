class AppConfigConstants {
  // ==================== APP METADATA ====================
  static const String appName = 'Pi Chat';
  static const String currentVersion = '1.0.0';
  static const int buildNumber = 1;

  static const String packageName = 'com.narayan.firebase_mychat';
  static const String liveAppLink = 'https://www.google.com/';
  static const String appTagline = 'Chat with friends';
  static const String appDescription = 'Private, secure and fast messaging';
  static const String appWebsite = 'https://pichat.in';
  static const String privacyPolicyUrl = 'https://pichat.in/privacy';
  static const String termsOfServiceUrl = 'https://pichat.in/terms';

  // ==================== COMPANY INFO ====================
  static const String companyName = 'pichat';
  static const String supportEmail = 'support@pichat.in';
  static const String contactPhone = '+911234567890';
  static const String companyAddress = '123 Tech Park, Bangalore, India';

  // ==================== API CONFIGURATION ====================
  static const String restApiBaseUrl = 'https://sayhi.pichat.in/api/web/v1/';
  static const String socketApiBaseUrl = "wss://sayhi.pichat.in/ws";
  static const int apiTimeoutSeconds = 30;
  static const int socketReconnectInterval = 5; // in seconds
  static const int maxRetryAttempts = 3;

  // ==================== AUTHENTICATION ====================
  static const int minPasswordLength = 8;
  static const int maxPasswordLength = 32;
  static const int otpExpiryMinutes = 5;
  static const int sessionExpiryDays = 30;

  // ==================== FEATURE TOGGLES ====================
  static const bool isDemoApp = true;
  static const bool isUnderMaintenance = false;
  static const bool askForFollow = true;
  static const bool enableDarkModeByDefault = false;
  static const bool enableVoiceCalls = true;
  static const bool enableVideoCalls = true;
  static const bool enableGroupChat = true;
  static const bool enableStatusFeature = true;
  static const bool enableStories = false;
  static const bool enablePayments = false;
  static const bool enableMessageReactions = true;
  static const bool enableMessageEditing = true;


  // ==================== UI/UX CONSTANTS ====================
  static const double defaultPadding = 16.0;
  static const double defaultBorderRadius = 12.0;
  static const int splashScreenDuration = 2; // in seconds
  static const int typingIndicatorTimeout = 5; // in seconds
  static const int messageReadReceiptTimeout = 30; // in seconds

  // ==================== PERFORMANCE ====================
  static const int messagesCacheLimit = 1000;
  static const int imageCacheMaxAge = 30; // in days
  static const int maxConcurrentImageDownloads = 3;

  // ==================== SECURITY ====================
  static const String encryptionKey = 'your_encryption_key_here';
  static const bool enableEncryption = true;
  static const int chatVersion = 1;
  static const int pinLockMaxAttempts = 5;
  static const int autoLockTimeout = 15; // in minutes

  // ==================== NOTIFICATIONS ====================
  static const String firebaseServerKey = 'your-firebase-server-key';
  static const String fcmTopicAll = 'all_users';
  static const int notificationDebounceTime = 2; // in seconds

  // ==================== STORAGE KEYS ====================
  static const String keyUserToken = 'user_token';
  static const String keyIsLoggedIn = 'is_logged_in';
  static const String keyThemeMode = 'theme_mode';
  static const String keyLastLogin = 'last_login';
  static const String keyBiometricEnabled = 'biometric_enabled';

  // ==================== LIMITS & VALIDATION ====================
  static const int messagesPageSize = 50;
  static const int usersPageSize = 20;
  static const int groupsPageSize = 15;
  static const int maxMessageLength = 1000;
  static const int maxGroupParticipants = 100;
  static const int maxImageSizeInMB = 5;
  static const int maxVideoSizeInMB = 50;
  static const int maxFileSizeInMB = 25;
  static const int maxStatusLength = 250;

  // ==================== FILE FORMATS ====================
  static const List<String> allowedImageFormats = ['jpg', 'jpeg', 'png', 'webp'];
  static const List<String> allowedVideoFormats = ['mp4', 'mov', 'avi'];
  static const List<String> allowedDocumentFormats = ['pdf', 'doc', 'docx', 'txt'];

  // ==================== ANALYTICS ====================
  static const bool enableCrashlytics = true;
  static const bool enableAnalytics = true;
  static const int analyticsSamplingRate = 100; // percentage

  // ==================== DEBUG SETTINGS ====================
  static const bool showDebugBanner = false;
  static const bool enableApiLogging = true;
  static const bool enableNetworkInspector = false;

  // ==================== TIME CONSTANTS ====================
  static const int secondsInAMinute = 60;
  static const int secondsInAnHour = 3600;
  static const int secondsInADay = 86400;
  static const int secondsInThreeDays = 259200;
  static const int secondsInSevenDays = 604800;
  static const int liveBattleConfirmationWaitTime = 30;

  // ==================== ADS CONFIG ====================
  static const bool showAds = true;
  static const int showInterstitialAdAfter = 2; // message count
  static const int showRewardedAdAfter = 5; // message count
  static const int showAdmobBannerAfter = 20; // seconds
  static const String admobAppId = 'ca-app-pub-3940256099942544~3347511713';
  static const String admobBannerId = 'ca-app-pub-3940256099942544/6300978111';
  static const String admobInterstitialId = 'ca-app-pub-3940256099942544/1033173712';

  // ==================== SOCIAL MEDIA ====================
  static const String facebookPageUrl = 'https://facebook.com/pichat';
  static const String instagramUrl = 'https://instagram.com/pichat';
  static const String twitterUrl = 'https://twitter.com/pichat';
  static const String linkedinUrl = 'https://linkedin.com/company/pichat';

  // ==================== IN-APP PURCHASES ====================
  static const List<String> subscriptionProductIds = [
    'pichat_premium_monthly',
    'pichat_premium_yearly'
  ];

  // ==================== ERROR MESSAGES ====================
  static const String connectionError = 'Please check your internet connection';
  static const String serverError = 'Server is temporarily unavailable';
  static const String maintenanceMessage = 'App is under maintenance. Please try again later.';
}