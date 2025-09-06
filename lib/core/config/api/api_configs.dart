class ApiConfigs {
  // live api's base
  // static const String baseUrl = 'http://192.168.1.125:8000/api/v1';
  static const String baseUrl = 'https://backend.chhotokhabar.com';
  static const String getAccessToken = '/auth/token/refresh/';
  static const String register = '/auth/signup/mobile/';
  static const String loginOtpRequest = '/user/login';
  static const String loginOtpVerify = '/user/otp-login/';
  static const String login = '/auth/token/';
  static const String signInWithGoogle = '/user/login/google';
  static const String resetPassword = '/user/verify/forgot/password';
  static const String forgotPassword = '/user/forgot/password';
  static const String verifyOtpForgot = '/user/login/google';
  static const String verifyOtp = '/auth/verify-otp/';
  static const String forgotPasswordResend = '/user/resend-otp';
  static const String resendOtp = '/user/resend-otp';
  static const String accountSetup = '/user/update-profile/';
  static const String getDoctorList = "/department/filter/";
  static const String getOnlineDoctor = "/department/online/doctor/filter/";

  static const String articles = '/articles/';
  static const String bookmarks = '/bookmarks/';
  static const String categories = '/categories/';
  static const String trending = '/articles/trending/';

  static const String getSpecializations = "/specialization/list-search";
  static const String addFavoriteDoctor = "/wishlist/create/";
  static const String removeFavoriteDoctor = "/wishlist/delete-doctor/";
  static const String getTopDoctor = "/review/top-doctors/";
  static const String getDoctorDetail = "/details/detail/get/";

  static const String doctorAvailabiity = "/doctor/available-time/";
  static const String getDependent = "/user/dependent/listbyuser/";

  static const String addDependent = "/user/dependent/create/";
  static const String editDependent = "/user/dependent/update/";

  static const String initiatePayment = '/booking/appointments/book/';
  static const String verifyPayment = '/booking/appointment/create/';

  static const String getAppointmentList = '/booking/appointment/status/';
  static const String getAppointmentDetails = '/booking/appointment/detail/';

  static const String termsAndConditions = '/termsandcondition/list/create/';
  static const String deactivateAccount = '/user/deactivate-account/';
  static const String deleteAccount = '/user/delete-account/';
  static const String changePassword = '/user/change/password';

  static const String notifications = '/notification/all/';
  static const String readNotification = '/notification/update/';
  static const String updateProfile = '/user/update-profile/';
  static const String getUser = '/user/profile';
  static const String uploadProfileImage = '/user/profile/image/';
  static const String getDepartmentList = '/department/list-search/';
  static const String getOnlineDepartment = '/department/online-list-search/';

  static const String getFavouriteDoctors = '/wishlist/list/';

  //servicesss

  static const String getServicesList = '/service/list/';
  static const String getServicesCategoryList = '/service/category/list/';
  static const String getDoctorAvailability = '/service/';
  static const String bookAppointment = '/service/';
  static const String cancelAppointment = '/service/';

  // static const String socketUrl = 'ws://192.168.1.125:8000/';
  // static const String socketUrl = 'ws://192.168.1.125:8000/';

  static const String socketUrl = 'wss://api.nipali.com/';
  // static const String socketUrl = 'wss://test.nipali.com/';
  static const String uploadFile = '/call/upload/';
  static const String getChatHistory = '/call/rooms/';
  static const String getChatRooms = '/call/rooms/';
  // call history
  static const String getCallHistory = '/call/list/';
  static const String submitFeedback = '/review/create';
  static const String getPendingReview = '/report/review-viewed/';
  static const String deletePendingReview = '/report/update/review/completed/';
  static const String getSessionDetails = '/report/appointment/detail/';

  //patient medical history
  static const String getMedicalRecords = '/history/list/';
  static const String createMedicalRecordDetails = '/history/create/';
  static const String updateRecordDetails = '/history/update/';
  static const String deleteMedicalRecordDetails = '/history/delete/';
  static const String getDependentMedicalRecords = '/history/dependent/list/';
  static const String createDependentMedicalRecordDetails =
      '/history/dependent/create/';
  static const String updateDependentRecordDetails =
      '/history/dependent/update/';
  static const String deleteDependentMedicalRecordDetails =
      '/history/dependent/delete/';
  static const String getPrescriptionById = '/prescription/detail/';
  static const String faqs = '/faq/list/';
}
