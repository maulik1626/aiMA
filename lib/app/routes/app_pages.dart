import 'package:aima/app/features/splash/splash_screen.dart';
import 'package:flutter/material.dart';

// Import the auto-generated app routes
part 'app_routes.dart';

/// A class responsible for generating routes in the app.
class RouteGenerator {
  /// Generates a route based on the provided [settings].
  ///
  /// The method checks the name of the route specified in [settings.name]
  /// and returns the appropriate MaterialPageRoute for navigation.
  ///
  /// Example:
  /// ```dart
  /// RouteGenerator().generateRoute(RouteSettings(name: Routes.HOME));
  /// ```
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.SPLASH:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) {
            return _generateRoutePage(settings.name);
          },
        );
      // case Routes.LANDING:
      //   return PageRouteBuilder(
      //     settings: settings,
      //     pageBuilder: (BuildContext context, Animation<double> animation,
      //             Animation<double> secondaryAnimation) =>
      //         _generateRoutePage(settings.name),
      //     transitionsBuilder: (BuildContext context,
      //         Animation<double> animation,
      //         Animation<double> secondaryAnimation,
      //         Widget child) {
      //       return FadeTransition(
      //         opacity: animation,
      //         child: child,
      //       );
      //     },
      //   );
      // case Routes.LOGIN:
      //   return PageRouteBuilder(
      //     settings: settings,
      //     pageBuilder: (BuildContext context, Animation<double> animation,
      //             Animation<double> secondaryAnimation) =>
      //         _generateRoutePage(settings.name),
      //     transitionsBuilder: (BuildContext context,
      //         Animation<double> animation,
      //         Animation<double> secondaryAnimation,
      //         Widget child) {
      //       return FadeTransition(
      //         opacity: animation,
      //         child: child,
      //       );
      //     },
      //   );
      // case Routes.OTP:
      //   return MaterialPageRoute(
      //     settings: settings,
      //     builder: (context) {
      //       return _generateRoutePage(settings.name);
      //     },
      //   );
      // case Routes.PROFILE_SETUP:
      //   return MaterialPageRoute(
      //     settings: settings,
      //     builder: (context) {
      //       return _generateRoutePage(settings.name);
      //     },
      //   );
      // case Routes.BASE:
      //   return PageRouteBuilder(
      //     settings: settings,
      //     pageBuilder: (BuildContext context, Animation<double> animation,
      //             Animation<double> secondaryAnimation) =>
      //         _generateRoutePage(settings.name),
      //     transitionsBuilder: (BuildContext context,
      //         Animation<double> animation,
      //         Animation<double> secondaryAnimation,
      //         Widget child) {
      //       return FadeTransition(
      //         opacity: animation,
      //         child: child,
      //       );
      //     },
      //   );
      // case Routes.SEARCH:
      //   return PageRouteBuilder(
      //     settings: settings,
      //     pageBuilder: (BuildContext context, Animation<double> animation,
      //             Animation<double> secondaryAnimation) =>
      //         _generateRoutePage(settings.name),
      //     transitionsBuilder: (BuildContext context,
      //         Animation<double> animation,
      //         Animation<double> secondaryAnimation,
      //         Widget child) {
      //       return FadeTransition(
      //         opacity: animation,
      //         child: child,
      //       );
      //     },
      //   );
      // case Routes.APPOINTMENT_DETAILS:
      //   return MaterialPageRoute(
      //     settings: settings,
      //     builder: (context) {
      //       return _generateRoutePage(settings.name);
      //     },
      //   );
      // case Routes.BOOK_IN_CLINIC_APPOINTMENT:
      //   return MaterialPageRoute(
      //     settings: settings,
      //     builder: (context) {
      //       return _generateRoutePage(settings.name);
      //     },
      //   );
      // case Routes.BOOK_VIDEO_CALL_APPOINTMENT:
      //   return MaterialPageRoute(
      //     settings: settings,
      //     builder: (context) {
      //       return _generateRoutePage(settings.name);
      //     },
      //   );
      // case Routes.BOOK_HOME_VISIT_APPOINTMENT:
      //   return MaterialPageRoute(
      //     settings: settings,
      //     builder: (context) {
      //       return _generateRoutePage(settings.name);
      //     },
      //   );
      // case Routes.SELECT_YOUR_PET:
      //   return MaterialPageRoute(
      //     settings: settings,
      //     builder: (context) {
      //       return _generateRoutePage(settings.name);
      //     },
      //   );
      // case Routes.ADD_PET_INFO:
      //   final AddPetInfoScreenArguments args =
      //       settings.arguments as AddPetInfoScreenArguments;
      //   return PageRouteBuilder(
      //     settings: settings,
      //     pageBuilder: (BuildContext context, Animation<double> animation,
      //             Animation<double> secondaryAnimation) =>
      //         _generateRoutePage(settings.name, arguments: args),
      //     transitionsBuilder: (BuildContext context,
      //         Animation<double> animation,
      //         Animation<double> secondaryAnimation,
      //         Widget child) {
      //       return SlideTransition(
      //         position: Tween<Offset>(
      //           begin: const Offset(0.0, 1.0),
      //           end: Offset.zero,
      //         ).animate(animation),
      //         child: child,
      //       );
      //     },
      //     transitionDuration: const Duration(milliseconds: 200),
      //   );
      // case Routes.ADD_ADDITIONAL_PET_INFO:
      //   AddPetInfoScreenArguments args =
      //       settings.arguments as AddPetInfoScreenArguments;
      //   return MaterialPageRoute(
      //     settings: settings,
      //     builder: (context) {
      //       return _generateRoutePage(settings.name, arguments: args);
      //     },
      //   );
      // case Routes.DOCTOR_DETAILS:
      //   DoctorDetailsScreenArguments args =
      //       settings.arguments as DoctorDetailsScreenArguments;
      //   return MaterialPageRoute(
      //     settings: settings,
      //     builder: (context) {
      //       return _generateRoutePage(settings.name, arguments: args);
      //     },
      //   );
      //
      // case Routes.ADDRESS_SELECTION:
      //   return PageRouteBuilder(
      //     settings: settings,
      //     pageBuilder: (BuildContext context, Animation<double> animation,
      //             Animation<double> secondaryAnimation) =>
      //         _generateRoutePage(settings.name),
      //     transitionsBuilder: (BuildContext context,
      //         Animation<double> animation,
      //         Animation<double> secondaryAnimation,
      //         Widget child) {
      //       return FadeTransition(
      //         opacity: animation,
      //         child: child,
      //       );
      //     },
      //     transitionDuration: const Duration(milliseconds: 150),
      //   );
      // case Routes.SELECT_LOCATION_ON_MAP:
      //   SelectLocationOnMapScreenArguments args =
      //       settings.arguments as SelectLocationOnMapScreenArguments;
      //   return MaterialPageRoute(
      //     settings: settings,
      //     builder: (context) {
      //       return _generateRoutePage(settings.name, arguments: args);
      //     },
      //   );
      // // return PageRouteBuilder(
      // //   settings: settings,
      // //   pageBuilder: (BuildContext context, Animation<double> animation,
      // //           Animation<double> secondaryAnimation) =>
      // //       _generateRoutePage(settings.name, arguments: args),
      // //   transitionsBuilder: (BuildContext context,
      // //       Animation<double> animation,
      // //       Animation<double> secondaryAnimation,
      // //       Widget child) {
      // //     return FadeTransition(
      // //       opacity: animation,
      // //       child: child,
      // //     );
      // //   },
      // //   transitionDuration: const Duration(milliseconds: 150),
      // // );
      // case Routes.CONTACTS:
      //   return PageRouteBuilder(
      //     settings: settings,
      //     pageBuilder: (BuildContext context, Animation<double> animation,
      //             Animation<double> secondaryAnimation) =>
      //         _generateRoutePage(settings.name),
      //     transitionsBuilder: (BuildContext context,
      //         Animation<double> animation,
      //         Animation<double> secondaryAnimation,
      //         Widget child) {
      //       return SlideTransition(
      //         position: Tween<Offset>(
      //           begin: const Offset(0.0, 1.0),
      //           end: Offset.zero,
      //         ).animate(animation),
      //         child: child,
      //       );
      //     },
      //     transitionDuration: const Duration(milliseconds: 200),
      //   );
      // case Routes.BOOKING_CONFIRMATION:
      //   BookingConfirmationScreenArguments args =
      //       settings.arguments as BookingConfirmationScreenArguments;
      //   return MaterialPageRoute(
      //     settings: settings,
      //     builder: (context) {
      //       return _generateRoutePage(settings.name, arguments: args);
      //     },
      //   );
      // case Routes.BOOKING_STATUS:
      //   BookingStatusScreenArguments args =
      //       settings.arguments as BookingStatusScreenArguments;
      //   return PageRouteBuilder(
      //     settings: settings,
      //     pageBuilder: (BuildContext context, Animation<double> animation,
      //             Animation<double> secondaryAnimation) =>
      //         _generateRoutePage(settings.name, arguments: args),
      //     transitionsBuilder: (BuildContext context,
      //         Animation<double> animation,
      //         Animation<double> secondaryAnimation,
      //         Widget child) {
      //       return FadeTransition(
      //         opacity: animation,
      //         child: child,
      //       );
      //     },
      //     transitionDuration: const Duration(milliseconds: 150),
      //   );
      //
      // case Routes.SELECT_LOCATION:
      //   return MaterialPageRoute(
      //     settings: settings,
      //     builder: (context) {
      //       return _generateRoutePage(settings.name);
      //     },
      //   );
      // case Routes.RATING_AND_REVIEW:
      //   RatingAndReviewScreenArguments args =
      //       settings.arguments as RatingAndReviewScreenArguments;
      //   return MaterialPageRoute(
      //     settings: settings,
      //     builder: (context) {
      //       return _generateRoutePage(settings.name, arguments: args);
      //     },
      //   );
      // case Routes.PAYMENT:
      //   return MaterialPageRoute(
      //     settings: settings,
      //     builder: (context) {
      //       return _generateRoutePage(settings.name);
      //     },
      //   );
      // case Routes.VIDEO_CONSULT:
      //   return PageRouteBuilder(
      //     settings: settings,
      //     pageBuilder: (BuildContext context, Animation<double> animation,
      //             Animation<double> secondaryAnimation) =>
      //         _generateRoutePage(settings.name),
      //     transitionsBuilder: (BuildContext context,
      //         Animation<double> animation,
      //         Animation<double> secondaryAnimation,
      //         Widget child) {
      //       return SlideTransition(
      //         position: Tween<Offset>(
      //           begin: const Offset(0.0, 1.0),
      //           end: Offset.zero,
      //         ).animate(animation),
      //         child: child,
      //       );
      //     },
      //     transitionDuration: const Duration(milliseconds: 200),
      //   );
      // case Routes.VIEW_QUESTION:
      //   return MaterialPageRoute(
      //     settings: settings,
      //     builder: (context) {
      //       return _generateRoutePage(settings.name);
      //     },
      //   );
      // case Routes.VIEW_ALL_QUESTIONS:
      //   return MaterialPageRoute(
      //     settings: settings,
      //     builder: (context) {
      //       return _generateRoutePage(settings.name);
      //     },
      //   );
      // case Routes.ASK_A_QUESTION:
      //   return MaterialPageRoute(
      //     settings: settings,
      //     builder: (context) {
      //       return _generateRoutePage(settings.name);
      //     },
      //   );
      // case Routes.GROOMER_DETAILS:
      //   return MaterialPageRoute(
      //     settings: settings,
      //     builder: (context) {
      //       return _generateRoutePage(settings.name);
      //     },
      //   );
      // case Routes.GROOMER_SHOP_DETAILS:
      //   return MaterialPageRoute(
      //     settings: settings,
      //     builder: (context) {
      //       return _generateRoutePage(settings.name);
      //     },
      //   );
      // case Routes.ALL_GROOMERS:
      //   return MaterialPageRoute(
      //     settings: settings,
      //     builder: (context) {
      //       return _generateRoutePage(settings.name);
      //     },
      //   );
      // case Routes.PHARMACY:
      //   return MaterialPageRoute(
      //     settings: settings,
      //     builder: (context) {
      //       return _generateRoutePage(settings.name);
      //     },
      //   );
      // case Routes.VR_PRODUCT_LIST:
      //   ProductListingScreenArguments args =
      //       settings.arguments as ProductListingScreenArguments;
      //   return MaterialPageRoute(
      //     settings: settings,
      //     builder: (context) {
      //       return _generateRoutePage(settings.name, arguments: args);
      //     },
      //   );
      // case Routes.BRAND_PRODUCTS:
      //   BrandProductsScreenArguments args =
      //       settings.arguments as BrandProductsScreenArguments;
      //   return MaterialPageRoute(
      //     settings: settings,
      //     builder: (context) {
      //       return _generateRoutePage(settings.name, arguments: args);
      //     },
      //   );
      // case Routes.CART:
      //   return MaterialPageRoute(
      //     settings: settings,
      //     builder: (context) {
      //       return _generateRoutePage(settings.name);
      //     },
      //   );
      // case Routes.ORDER_STATUS:
      //   return MaterialPageRoute(
      //     settings: settings,
      //     builder: (context) {
      //       return _generateRoutePage(settings.name);
      //     },
      //   );
      // case Routes.ORDERS:
      //   return MaterialPageRoute(
      //     settings: settings,
      //     builder: (context) {
      //       return _generateRoutePage(settings.name);
      //     },
      //   );
      // case Routes.RATE_ORDER:
      //   return MaterialPageRoute(
      //     settings: settings,
      //     builder: (context) {
      //       return _generateRoutePage(settings.name);
      //     },
      //   );
      // case Routes.ORDER_DETAILS:
      //   OrderDetailsScreenArguments args =
      //       settings.arguments as OrderDetailsScreenArguments;
      //   return MaterialPageRoute(
      //     settings: settings,
      //     builder: (context) {
      //       return _generateRoutePage(settings.name, arguments: args);
      //     },
      //   );
      // case Routes.WALLET:
      //   return MaterialPageRoute(
      //     settings: settings,
      //     builder: (context) {
      //       return _generateRoutePage(settings.name);
      //     },
      //   );
      // case Routes.NOTIFICATIONS:
      //   return MaterialPageRoute(
      //     settings: settings,
      //     builder: (context) {
      //       return _generateRoutePage(settings.name);
      //     },
      //   );
      // case Routes.PROFILE:
      //   return MaterialPageRoute(
      //     settings: settings,
      //     builder: (context) {
      //       return _generateRoutePage(settings.name);
      //     },
      //   );
      // case Routes.YOUR_PETS:
      //   return MaterialPageRoute(
      //     settings: settings,
      //     builder: (context) {
      //       return _generateRoutePage(settings.name);
      //     },
      //   );
      // case Routes.SAVED_LOCATIONS:
      //   return PageRouteBuilder(
      //     settings: settings,
      //     pageBuilder: (BuildContext context, Animation<double> animation,
      //             Animation<double> secondaryAnimation) =>
      //         _generateRoutePage(settings.name),
      //     transitionsBuilder: (BuildContext context,
      //         Animation<double> animation,
      //         Animation<double> secondaryAnimation,
      //         Widget child) {
      //       return FadeTransition(
      //         opacity: animation,
      //         child: child,
      //       );
      //     },
      //     transitionDuration: const Duration(milliseconds: 150),
      //   );
      // case Routes.PREFERRED_GROOMERS:
      //   return PageRouteBuilder(
      //     settings: settings,
      //     pageBuilder: (BuildContext context, Animation<double> animation,
      //             Animation<double> secondaryAnimation) =>
      //         _generateRoutePage(settings.name),
      //     transitionsBuilder: (BuildContext context,
      //         Animation<double> animation,
      //         Animation<double> secondaryAnimation,
      //         Widget child) {
      //       return FadeTransition(
      //         opacity: animation,
      //         child: child,
      //       );
      //     },
      //     transitionDuration: const Duration(milliseconds: 150),
      //   );
      // case Routes.ABOUT_US:
      //   return PageRouteBuilder(
      //     settings: settings,
      //     pageBuilder: (BuildContext context, Animation<double> animation,
      //             Animation<double> secondaryAnimation) =>
      //         _generateRoutePage(settings.name),
      //     transitionsBuilder: (BuildContext context,
      //         Animation<double> animation,
      //         Animation<double> secondaryAnimation,
      //         Widget child) {
      //       return FadeTransition(
      //         opacity: animation,
      //         child: child,
      //       );
      //     },
      //     transitionDuration: const Duration(milliseconds: 150),
      //   );
      // case Routes.ACCOUNT_PRIVACY:
      //   return PageRouteBuilder(
      //     settings: settings,
      //     pageBuilder: (BuildContext context, Animation<double> animation,
      //             Animation<double> secondaryAnimation) =>
      //         _generateRoutePage(settings.name),
      //     transitionsBuilder: (BuildContext context,
      //         Animation<double> animation,
      //         Animation<double> secondaryAnimation,
      //         Widget child) {
      //       return FadeTransition(
      //         opacity: animation,
      //         child: child,
      //       );
      //     },
      //     transitionDuration: const Duration(milliseconds: 150),
      //   );
      // case Routes.NOTIFICATION_SETTINGS:
      //   return PageRouteBuilder(
      //     settings: settings,
      //     pageBuilder: (BuildContext context, Animation<double> animation,
      //             Animation<double> secondaryAnimation) =>
      //         _generateRoutePage(settings.name),
      //     transitionsBuilder: (BuildContext context,
      //         Animation<double> animation,
      //         Animation<double> secondaryAnimation,
      //         Widget child) {
      //       return FadeTransition(
      //         opacity: animation,
      //         child: child,
      //       );
      //     },
      //     transitionDuration: const Duration(milliseconds: 150),
      //   );
      // case Routes.OFFERS:
      //   return MaterialPageRoute(
      //     settings: settings,
      //     builder: (context) {
      //       return _generateRoutePage(settings.name);
      //     },
      //   );

      // case Routes.PRODUCT_DETAILS:
      //   ProductDetailsScreenArguments args =
      //       settings.arguments as ProductDetailsScreenArguments;
      //   return MaterialPageRoute(
      //     settings: settings,
      //     builder: (context) {
      //       return _generateRoutePage(settings.name, arguments: args);
      //     },
      //   );
      default:
        // If the route is not recognized, return a default MaterialPageRoute.
        return MaterialPageRoute(
          builder: (context) => _generateRoutePage(settings.name),
        );
    }
  }

  /// Generates a page based on the provided route [settings].
  ///
  /// The method checks the name of the route specified in [settings] and
  /// returns the corresponding page widget.
  ///
  /// Example:
  /// ```dart
  /// RouteGenerator().generateRoutePage(Routes.HOME);
  /// ```
  _generateRoutePage(String? settings, {Object? arguments}) {
    switch (settings) {
      case Routes.SPLASH:
        return const SplashScreen();
      // case Routes.LANDING:
      //   return const LandingScreen();
      // case Routes.LOGIN:
      //   return const LoginScreen();
      // case Routes.OTP:
      //   return const OTPScreen();
      // case Routes.PROFILE_SETUP:
      //   return const ProfileSetupScreen();
      // case Routes.BASE:
      //   return const BaseScreen();
      // case Routes.SEARCH:
      //   return const SearchScreen();
      // case Routes.APPOINTMENT_DETAILS:
      //   return const BookingDetailsScreen();
      // case Routes.BOOK_IN_CLINIC_APPOINTMENT:
      //   return const InClinicAppointmentScreen();
      // case Routes.BOOK_VIDEO_CALL_APPOINTMENT:
      //   return const VideoCallAppointmentScreen();
      // case Routes.BOOK_HOME_VISIT_APPOINTMENT:
      //   return const HomeVisitAppointmentScreen();
      // case Routes.SELECT_YOUR_PET:
      //   return const SelectYourPetScreen();
      // case Routes.ADD_PET_INFO:
      //   if (arguments is AddPetInfoScreenArguments) {
      //     final AddPetInfoScreenArguments args = arguments;
      //     return AddPetInfoScreen(
      //       petType: args.petType,
      //     );
      //   }
      // case Routes.ADD_ADDITIONAL_PET_INFO:
      //   if (arguments is AddPetInfoScreenArguments) {
      //     final AddPetInfoScreenArguments args = arguments;
      //     return AddPetAdditionalInfo(
      //       petType: args.petType,
      //     );
      //   }
      // case Routes.DOCTOR_DETAILS:
      //   if (arguments is DoctorDetailsScreenArguments) {
      //     final DoctorDetailsScreenArguments args = arguments;
      //     return DoctorDetailsScreen(
      //       doctorDetails: args.doctorDetails,
      //       doctorServiceType: args.doctorServiceType,
      //       showProceedButton: args.showProceedButton,
      //       allowBookingInDetailsScreen: args.allowBookingInDetailsScreen,
      //     );
      //   }
      // case Routes.ADDRESS_SELECTION:
      //   return const AddressNewLocationScreen();
      // case Routes.SELECT_LOCATION_ON_MAP:
      //   if (arguments is SelectLocationOnMapScreenArguments) {
      //     final SelectLocationOnMapScreenArguments args = arguments;
      //     return SelectLocationOnMapScreen(
      //       latitude: args.latitude,
      //       longitude: args.longitude,
      //     );
      //   }
      // case Routes.CONTACTS:
      //   return const ContactsScreen();
      // case Routes.BOOKING_CONFIRMATION:
      //   if (arguments is BookingConfirmationScreenArguments) {
      //     final BookingConfirmationScreenArguments args = arguments;
      //     return BookingConfirmationScreen(
      //       doctorServiceType: args.doctorServiceType,
      //       groomerServiceType: args.groomerServiceType,
      //       isGroomer: args.isGroomer,
      //     );
      //   }
      // case Routes.BOOKING_STATUS:
      //   if (arguments is BookingStatusScreenArguments) {
      //     final BookingStatusScreenArguments args = arguments;
      //     return BookingStatusScreen(
      //       bookingStatus: args.bookingStatus,
      //       isGroomer: args.isGroomer,
      //     );
      //   }
      // case Routes.SELECT_LOCATION:
      //   return const SelectLocationScreen();
      // case Routes.RATING_AND_REVIEW:
      //   if (arguments is RatingAndReviewScreenArguments) {
      //     final RatingAndReviewScreenArguments args = arguments;
      //     return RatingAndReviewScreen(
      //       isProductReview: args.isProductReview,
      //     );
      //   }
      // case Routes.PAYMENT:
      //   return const PaymentScreen();
      // case Routes.VIDEO_CONSULT:
      //   return const VideoConsultScreen();
      // case Routes.VIEW_QUESTION:
      //   return const ViewQuestionScreen();
      // case Routes.VIEW_ALL_QUESTIONS:
      //   return const ViewAllQuestionsScreen();
      // case Routes.ASK_A_QUESTION:
      //   return const AskAQuestionScreen();
      // case Routes.GROOMER_DETAILS:
      //   return const GroomerDetailsScreen();
      // case Routes.GROOMER_SHOP_DETAILS:
      //   return const GroomerShopDetailsScreen();
      // case Routes.ALL_GROOMERS:
      //   return const AllGroomersScreen();
      // case Routes.PHARMACY:
      //   return const PharmacyScreen();
      // case Routes.VR_PRODUCT_LIST:
      //   if (arguments is ProductListingScreenArguments) {
      //     final ProductListingScreenArguments args = arguments;
      //     return ProductListingScreen(
      //       appBarTitle: args.appBarTitle,
      //       showWithCategories: args.showWithCategories,
      //     );
      //   }
      // case Routes.BRAND_PRODUCTS:
      //   if (arguments is BrandProductsScreenArguments) {
      //     final BrandProductsScreenArguments args = arguments;
      //     return BrandProductsScreen(
      //       brandName: args.brandName,
      //       brandImagePath: args.brandImagePath,
      //       brandColor: args.brandColor,
      //     );
      //   }
      // case Routes.CART:
      //   return const CartScreen();
      // case Routes.ORDER_STATUS:
      //   return const OrderStatusScreen(
      //     orderStatus: OrderStatus.CONFIRMED,
      //   );
      // case Routes.ORDERS:
      //   return const OrdersScreen();
      // case Routes.RATE_ORDER:
      //   return const RateOrderScreen();
      // case Routes.ORDER_DETAILS:
      //   if (arguments is OrderDetailsScreenArguments) {
      //     final OrderDetailsScreenArguments args = arguments;
      //     return OrderDetailsScreen(
      //       orderStatus: args.orderStatus,
      //     );
      //   }
      // case Routes.WALLET:
      //   return const WalletScreen();
      // case Routes.NOTIFICATIONS:
      //   return const NotificationsScreen();
      // case Routes.PROFILE:
      //   return const UserProfileScreen();
      // case Routes.YOUR_PETS:
      //   return const YourPetsScreen();
      // case Routes.SAVED_LOCATIONS:
      //   return const SavedLocationsScreen();
      // case Routes.PREFERRED_GROOMERS:
      //   return const PreferredGroomersScreen();
      // case Routes.ABOUT_US:
      //   return const AboutUsScreen();
      // case Routes.ACCOUNT_PRIVACY:
      //   return const AccountPrivacyScreen();
      // case Routes.NOTIFICATION_SETTINGS:
      //   return const NotificationSettingsScreen();
      // case Routes.OFFERS:
      //   return const OffersScreen();
      // case Routes.FILE_VIEWER:
      //   if (arguments is FileViewerScreenArguments) {
      //     final FileViewerScreenArguments args = arguments;
      //     return FileViewerScreen(
      //       filePath: args.filePath,
      //       // isNetworkFile: args.isNetworkFile,
      //       fileType: args.fileType,
      //     );
      //   }
      // case Routes.PRODUCT_DETAILS:
      //   if (arguments is ProductDetailsScreenArguments) {
      //     final ProductDetailsScreenArguments args = arguments;
      //     return ProductDetailsScreen(
      //       title: args.title,
      //       imagePaths: args.imagePaths,
      //     );
      //   }

      // case Routes.REGISTER:
      //   if (arguments is RegisterScreenArguments) {
      //     final RegisterScreenArguments args = arguments;
      //     return RegisterScreen(
      //       userType: args.userType,
      //     );
      //   }
      default:
        // If the route is not recognized, return a default Scaffold with a message.
        return Scaffold(
          body: Center(
            child: Text("No path for $settings"),
          ),
        );
    }
  }
}
