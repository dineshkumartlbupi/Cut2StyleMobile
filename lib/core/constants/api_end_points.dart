class ApiEndpoints {
  // Base
  // static const String baseUrl = 'https://yourapi.com/api';
  static const baseUrl = 'http://192.168.1.27:8000/';

  // Auth
  static const String login = 'api/v1/login';
  static const String register = 'api/v1/register';
  static const String userProfile = 'api/v1/profile';
  static const String logout = 'api/v1/logout';
  static const String updateProfile = 'api/v1/update-profile';
  static const String changePassword = 'api/v1/change-password';
  static const String forgotPassword = 'api/v1/forgot-password';
  static const String resetPassword = 'api/v1/reset-password';

  // Services
  static const String beeProServices = '/services/beepro';
  static const String homeServices = '/services/home';

  // Booking
  static const String bookService = '/booking';
  static const String userBookings = '/booking/user';
  static const String professionalBookings = '/booking/professional';

  // E-commerce (OSGS)
  static const String productList = '/products';
  static const String productDetails = '/products/';
  static const String placeOrder = '/orders';
  static const String orderHistory = '/orders/history';

  // Loyalty & Rewards
  static const String rewards = '/rewards';
  static const String redeemPoints = '/rewards/redeem';

  // Notifications
  static const String notifications = '/notifications';

  // Reviews
  static const String postReview = '/reviews';
  static const String getReviews = '/reviews';

  // Others (Add as needed)
}
