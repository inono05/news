class ApiRoutes {
  ApiRoutes._();

  static const String url = "https://sopaki.com/api";
  //static const String url = "http://192.168.100.26:8000/api";

  static const String login = '/login';
  static const String logout = '/logout';
  static const String register = '/register-mob';
  static const String resetPasswordBegin =
  '/users/forget/password/{number}/phone';
  static const String resetPasswordConfirm = '/users/reset/password/phone';

  static const String countries = '/countries/list';

  static const String sendVerificationPhoneCode = '/users/verify/phone/{phone}';
  static const String resendVerificationPhoneCode ='/users/reverify/phone/{phone}';
  static const String validationPhoneCode = '/users/validate/phone';
  static const String currentUser = '/user';
  static const String member = '/members/{id}';
  static const String members = '/members/list';
  static const String editUser = '/users/{id}';

  static const String listPacks = '/packs/list';
  static const String listSupportings = '/supportings/list';

  static const String uploadFile = '/uploads/document';

  static const String storeDocument = '/documents';
  static const String updateDocument = '/documents/{id}';

  static const String paymentMethods = '/payment-methods/list';
  static const String initiatePayment = '/payments/initiate';
  static const String paymentCheckStatus = '/payments/{payment}/status';
  static const String getPayment = '/payments/{paymentId}';

  static const String unReadNotifications = '/notifications/unread';
  static const String setReadNotification =
  '/notifications/{notificationId}/set-read';

  static const String generation = '/member-positions/list';
  static const String rewards = '/rewards/by-member';
  static const String discounts = '/rewards/list';

  static const String lang = '/users/{lang}/set/locale';
  static const String allPayments = '/payments/list';
  static const String paidRewards = '/payments/reward/{member_id}/initiate';
  static const String validateDiscount = '/payments/reward/validate';
  static const String paidPartialRewards =
  '/payments/{position_id}/reward/{member_id}/initiate';
  static const String validPartialRewards = '/payments/reward/validate';
  static const String verifyPhone = '/users/verify/phone/{phone}';
  static const String tickets = '/tickets/list';
  static const String storeTicket = '/tickets';
  static const String ticketSms = '/messages';
  static const String allTicketSms = '/messages/list';

}
