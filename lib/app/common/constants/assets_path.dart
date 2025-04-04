import 'dart:math';

class SVGAssetsPath {
  static const String _path = 'assets/svg/';
  static const String _extension = '.svg';

  // Scaffold Layer
  // static const String _scaffoldStarLayer = '${_path}scaffold_layer/landing_star_layer$_extension';
  static const String _scaffoldEllipseLayer =
      '${_path}scaffold_layer/landing_ellipse$_extension';

  // Images
  static const String _donate = '${_path}images/donate$_extension';
  static const String _zigzag = '${_path}images/zigzag$_extension';
  static const String _coin = '${_path}images/coin$_extension';

  // App Logo
  static const String _aunCabsLogo =
      '${_path}app_logo/aun_cabs_logo$_extension';
  static const String _aunLogo = '${_path}app_logo/aun_logo$_extension';
  static const String _cabsLogo = '${_path}app_logo/cabs_logo$_extension';

  // Icons
  static const String _icArrowRight = '${_path}icons/ic_arrow_right$_extension';
  static const String _icArrowRightDouble =
      '${_path}icons/ic_arrow_right_double$_extension';
  static const String _icBackButtonArrow =
      '${_path}icons/ic_back_button_arrow$_extension';
  static const String _icHelp = '${_path}icons/ic_help$_extension';
  static const String _icInfo = '${_path}icons/ic_info$_extension';
  static const String _icFlagIndia = '${_path}icons/ic_flag_india$_extension';
  static const String _icExclamation =
      '${_path}icons/ic_exclamation$_extension';
  static const String _icPersonOutlined =
      '${_path}icons/ic_person_outlined$_extension';
  static const String _icCloseSquareOutlined =
      '${_path}icons/ic_close_square_outlined$_extension';
  static const String _icArrowRight2 =
      '${_path}icons/ic_arrow_right_2$_extension';
  static const String _icDividerVert =
      '${_path}icons/ic_divider_vert$_extension';
  static const String _icNotificationOutlined =
      '${_path}icons/ic_notification_outlined$_extension';
  static const String _icLogout2 = '${_path}icons/ic_logout_2$_extension';
  static const String _icProfileOutlined =
      '${_path}icons/ic_profile_outlined$_extension';
  static const String _icCircleLock = '${_path}icons/ic_circle_lock$_extension';
  static const String _icEmailOutlined =
      '${_path}icons/ic_email_outlined$_extension';
  static const String _icHome = '${_path}icons/ic_home$_extension';
  static const String _icHomeFilledBlue =
      '${_path}icons/ic_home_filled_blue$_extension';
  static const String _icHomeFilledPurple =
      '${_path}icons/ic_home_filled_purple$_extension';
  static const String _icHomeFilledBrown =
      '${_path}icons/ic_home_filled_brown$_extension';
  static const String _icOffice = '${_path}icons/ic_office$_extension';
  static const String _icHomeVisit = '${_path}icons/ic_home_visit$_extension';
  static const String _icReceipt = '${_path}icons/ic_receipt$_extension';
  static const String _icShop = '${_path}icons/ic_shop$_extension';
  static const String _icUserSquare = '${_path}icons/ic_user_square$_extension';
  static const String _icCalendar = '${_path}icons/ic_calendar$_extension';
  static const String _icSearch = '${_path}icons/ic_search$_extension';
  static const String _icMicOutlined = '${_path}icons/ic_mic$_extension';
  static const String _icMicFilled = '${_path}icons/ic_mic_filled$_extension';
  static const String _icHospital = '${_path}icons/ic_hospital$_extension';
  static const String _icDoctor = '${_path}icons/ic_doctor$_extension';
  static const String _icGroomer = '${_path}icons/ic_groomer$_extension';
  static const String _icVideo = '${_path}icons/ic_video$_extension';
  static const String _icBowTie = '${_path}icons/ic_bow_tie$_extension';
  static const String _icShampoo = '${_path}icons/ic_shampoo$_extension';
  static const String _icSpaghetti = '${_path}icons/ic_spaghetti$_extension';
  static const String _icMenu = '${_path}icons/ic_menu$_extension';
  static const String _icNote = '${_path}icons/ic_note$_extension';
  static const String _icPetSpa = '${_path}icons/ic_pet_spa$_extension';
  static const String _icPetHomeSpa =
      '${_path}icons/ic_pet_home_spa$_extension';
  static const String _icStar = '${_path}icons/ic_star$_extension';
  static const String _icStarFilled = '${_path}icons/ic_star_filled$_extension';
  static const String _icCalendarTick =
      '${_path}icons/ic_calendar_tick$_extension';
  static const String _icClock = '${_path}icons/ic_clock$_extension';
  static const String _icArrowDown = '${_path}icons/ic_arrow_down$_extension';
  static const String _icArrowUp = '${_path}icons/ic_arrow_up$_extension';
  static const String _icCalendarCompleted =
      '${_path}icons/ic_calendar_completed$_extension';
  static const String _icCalendarRemove =
      '${_path}icons/ic_calendar_remove$_extension';
  static const String _icCalendarReschedule =
      '${_path}icons/ic_calendar_reschedule$_extension';
  static const String _icVerified = '${_path}icons/ic_verified$_extension';
  static const String _icCopy = '${_path}icons/ic_copy$_extension';
  static const String _icCreditCard = '${_path}icons/ic_credit_card$_extension';
  static const String _icCreditCard2 =
      '${_path}icons/ic_credit_card_2$_extension';
  static const String _icCash = '${_path}icons/ic_cash$_extension';
  static const String _icWallet = '${_path}icons/ic_wallet$_extension';
  static const String _icUpi = '${_path}icons/ic_upi$_extension';
  static const String _icVeterinary = '${_path}icons/ic_veterinary$_extension';
  static const String _icPawHeart = '${_path}icons/ic_paw_heart$_extension';
  static const String _icAddSquareOutlined =
      '${_path}icons/ic_add_square_outlined$_extension';
  static const String _icCamera = '${_path}icons/ic_camera$_extension';
  static const String _icImage = '${_path}icons/ic_image$_extension';
  static const String _icClose1 = '${_path}icons/ic_close_1$_extension';
  static const String _icClose2 = '${_path}icons/ic_close_2$_extension';
  static const String _icFemale = '${_path}icons/ic_female$_extension';
  static const String _icMale = '${_path}icons/ic_male$_extension';
  static const String _icCheckmarkSquare =
      '${_path}icons/ic_checkmark_square$_extension';
  static const String _icImageDelete =
      '${_path}icons/ic_image_delete$_extension';
  static const String _icSettings = '${_path}icons/ic_setting$_extension';
  static const String _icDocumentText =
      '${_path}icons/ic_document_text$_extension';
  static const String _icDocumentUpload =
      '${_path}icons/ic_document_upload$_extension';
  static const String _icLocationPin =
      '${_path}icons/ic_location_pin$_extension';
  static const String _icMapPin = '${_path}icons/ic_map_pin$_extension';
  static const String _icDiscountBadge =
      '${_path}icons/ic_discount_badge$_extension';
  static const String _icDiscount = '${_path}icons/ic_discount$_extension';
  static const String _icDiscount1 = '${_path}icons/ic_discount_1$_extension';
  static const String _icDiscountFilled =
      '${_path}icons/ic_discount_filled$_extension';
  static const String _icCurrentLocation =
      '${_path}icons/ic_current_location$_extension';
  static const String _icLocation = '${_path}icons/ic_location$_extension';
  static const String _icEditFilled = '${_path}icons/ic_edit_filled$_extension';
  static const String _icMorning = '${_path}icons/ic_morning$_extension';
  static const String _icAfternoon = '${_path}icons/ic_afternoon$_extension';
  static const String _icEvening = '${_path}icons/ic_evening$_extension';
  static const String _icCheckboxFilled =
      '${_path}icons/ic_checkbox_filled$_extension';
  static const String _icCheckboxFilledBrown =
      '${_path}icons/ic_checkbox_filled_brown$_extension';
  static const String _icCheckboxOutlined =
      '${_path}icons/ic_checkbox_outlined$_extension';
  static const String _icLocationDenied =
      '${_path}icons/ic_location_denied$_extension';
  static const String _icAddLocation =
      '${_path}icons/ic_add_location$_extension';
  static const String _icLocationDisabled =
      '${_path}icons/ic_location_disabled$_extension';
  static const String _icContactBook =
      '${_path}icons/ic_contact_book$_extension';
  static const String _icGreenCheckmarkBadge =
      '${_path}icons/ic_green_checkmark_badge$_extension';
  static const String _icAward1 = '${_path}icons/ic_award_1$_extension';
  static const String _icCheckmarkBadge =
      '${_path}icons/ic_checkmark_badge$_extension';
  static const String _icPeopleBadge =
      '${_path}icons/ic_people_badge$_extension';
  static const String _icAwardBadge = '${_path}icons/ic_award_badge$_extension';
  static const String _icStarBadge = '${_path}icons/ic_star_badge$_extension';
  static const String _icTitleHighlight =
      '${_path}icons/ic_title_highlight$_extension';
  static const String _icContainerTag =
      '${_path}icons/ic_container_tag$_extension';
  static const String _icShare = '${_path}icons/ic_share$_extension';
  static const String _icCustomerSupport =
      '${_path}icons/ic_customer_support$_extension';
  static const String _icThumbsDown = '${_path}icons/ic_thumbs_down$_extension';
  static const String _icThumbsUp = '${_path}icons/ic_thumbs_up$_extension';
  static const String _icThumbsDownFilled =
      '${_path}icons/ic_thumbs_down_filled$_extension';
  static const String _icThumbsUpFilled =
      '${_path}icons/ic_thumbs_up_filled$_extension';
  static const String _icPaymentFailed =
      '${_path}icons/ic_payment_failed$_extension';
  static const String _icMoreH = '${_path}icons/ic_more_h_raw$_extension';
  static const String _icMicrophoneDisabled =
      '${_path}icons/ic_microphone_disabled$_extension';
  static const String _icMicrophoneEnabled =
      '${_path}icons/ic_microphone_enabled$_extension';
  static const String _icSpeakerDisabled =
      '${_path}icons/ic_speaker_disabled$_extension';
  static const String _icSpeakerEnabled =
      '${_path}icons/ic_speaker_enabled$_extension';
  static const String _icVideoDisabled =
      '${_path}icons/ic_video_disabled$_extension';
  static const String _icVideoEnabled =
      '${_path}icons/ic_video_enabled$_extension';
  static const String _icCallEnd = '${_path}icons/ic_call_end$_extension';
  static const String _icPeople = '${_path}icons/ic_people$_extension';
  static const String _icView = '${_path}icons/ic_view$_extension';
  static const String _icFilter1 = '${_path}icons/ic_filter_1$_extension';
  static const String _icSort = '${_path}icons/ic_sort$_extension';
  static const String _icBookmarkFilled =
      '${_path}icons/ic_bookmark_filled$_extension';
  static const String _icBookmarkOutlined =
      '${_path}icons/ic_bookmark_outlined$_extension';
  static const String _icMaps = '${_path}icons/ic_maps$_extension';
  static const String _icCallCalling =
      '${_path}icons/ic_call_calling$_extension';
  static const String _icCheckmarkCircleFilled =
      '${_path}icons/ic_checkmark_circle_filled$_extension';
  static const String _icHeart = '${_path}icons/ic_heart$_extension';
  static const String _icHeartFilled =
      '${_path}icons/ic_heart_filled$_extension';
  static const String _icOutOfStock =
      '${_path}icons/ic_out_of_stock$_extension';
  static const String _icScooter = '${_path}icons/ic_scooter$_extension';
  static const String _icDeliveryBox =
      '${_path}icons/ic_delivery_box$_extension';
  static const String _icLoyaltyCard =
      '${_path}icons/ic_loyalty_card$_extension';
  static const String _icSavedItems = '${_path}icons/ic_saved_items$_extension';
  static const String _icPeopleAlsoBought =
      '${_path}icons/ic_people_also_bought$_extension';
  static const String _icPackage = '${_path}icons/ic_package$_extension';
  static const String _icUpdate = '${_path}icons/ic_update$_extension';
  static const String _icPets = '${_path}icons/ic_pets$_extension';
  static const String _icConfirmed = '${_path}icons/ic_confirmed$_extension';
  static const String _icPacked = '${_path}icons/ic_packed$_extension';
  static const String _icShipped = '${_path}icons/ic_shipped$_extension';
  static const String _icOutForDelivery =
      '${_path}icons/ic_out_for_delivery$_extension';
  static const String _icDeliveryFailed =
      '${_path}icons/ic_delivery_failed$_extension';
  static const String _icDeliveryRescheduled =
      '${_path}icons/ic_delivery_rescheduled$_extension';
  static const String _icDelivered = '${_path}icons/ic_delivered$_extension';
  static const String _icOrderCanceled =
      '${_path}icons/ic_order_canceled$_extension';
  static const String _icReturnRequested =
      '${_path}icons/ic_return_requested$_extension';
  static const String _icReturnApproved =
      '${_path}icons/ic_return_approved$_extension';
  static const String _icReturnRejected =
      '${_path}icons/ic_return_rejected$_extension';
  static const String _icReturnPickupScheduled =
      '${_path}icons/ic_return_pickup_scheduled$_extension';
  static const String _icReturnPickedUp =
      '${_path}icons/ic_return_picked_up$_extension';
  static const String _icReturnReceived =
      '${_path}icons/ic_return_received$_extension';
  static const String _icReturned = '${_path}icons/ic_returned$_extension';
  static const String _icReplacementRequested =
      '${_path}icons/ic_replacement_requested$_extension';
  static const String _icReplacementCompleted =
      '${_path}icons/ic_replacement_completed$_extension';
  static const String _icRefunded = '${_path}icons/ic_refunded$_extension';
  static const String _icFailed = '${_path}icons/ic_failed$_extension';
  static const String _icFlash = '${_path}icons/ic_flash$_extension';
  static const String _icRupeeCoin = '${_path}icons/ic_rupee_coin$_extension';
  static const String _icDelete2 = '${_path}icons/ic_delete_2$_extension';
  static const String _icSendFilled = '${_path}icons/ic_send_filled$_extension';
  static const String _icWhatsapp = '${_path}icons/ic_whatsapp$_extension';
  static const String _icVeg = '${_path}icons/ic_veg$_extension';
  static const String _icNonVeg = '${_path}icons/ic_non_veg$_extension';

  // Getters
  // static String get scaffoldStarLayer => _scaffoldStarLayer;
  static String get scaffoldEllipseLayer => _scaffoldEllipseLayer;

  static String get donate => _donate;

  static String get zigzag => _zigzag;

  static String get coin => _coin;

  static String get aunCabsLogo => _aunCabsLogo;

  static String get aunLogo => _aunLogo;

  static String get cabsLogo => _cabsLogo;

  static String get icArrowRight => _icArrowRight;

  static String get icArrowRightDouble => _icArrowRightDouble;

  static String get icBackButtonArrow => _icBackButtonArrow;

  static String get icHelp => _icHelp;

  static String get icInfo => _icInfo;

  static String get icFlagIndia => _icFlagIndia;

  static String get icExclamation => _icExclamation;

  static String get icPersonOutlined => _icPersonOutlined;

  static String get icCloseSquareOutlined => _icCloseSquareOutlined;

  static String get icArrowRight2 => _icArrowRight2;

  static String get icDividerVert => _icDividerVert;

  static String get icNotificationOutlined => _icNotificationOutlined;

  static String get icLogout2 => _icLogout2;

  static String get icProfileOutlined => _icProfileOutlined;

  static String get icCircleLock => _icCircleLock;

  static String get icEmailOutlined => _icEmailOutlined;

  static String get icHome => _icHome;

  static String get icHomeFilledBlue => _icHomeFilledBlue;

  static String get icHomeFilledPurple => _icHomeFilledPurple;

  static String get icHomeFilledBrown => _icHomeFilledBrown;

  static String get icOffice => _icOffice;

  static String get icHomeVisit => _icHomeVisit;

  static String get icReceipt => _icReceipt;

  static String get icShop => _icShop;

  static String get icUserSquare => _icUserSquare;

  static String get icCalendar => _icCalendar;

  static String get icSearch => _icSearch;

  static String get icMicOutlined => _icMicOutlined;

  static String get icMicFilled => _icMicFilled;

  static String get icHospital => _icHospital;

  static String get icDoctor => _icDoctor;

  static String get icGroomer => _icGroomer;

  static String get icVideo => _icVideo;

  static String get icBowTie => _icBowTie;

  static String get icShampoo => _icShampoo;

  static String get icSpaghetti => _icSpaghetti;

  static String get icMenu => _icMenu;

  static String get icNote => _icNote;

  static String get icPetSpa => _icPetSpa;

  static String get icPetHomeSpa => _icPetHomeSpa;

  static String get icStar => _icStar;

  static String get icStarFilled => _icStarFilled;

  static String get icCalendarTick => _icCalendarTick;

  static String get icClock => _icClock;

  static String get icArrowDown => _icArrowDown;

  static String get icArrowUp => _icArrowUp;

  static String get icCalendarCompleted => _icCalendarCompleted;

  static String get icCalendarRemove => _icCalendarRemove;

  static String get icCalendarReschedule => _icCalendarReschedule;

  static String get icVerified => _icVerified;

  static String get icCopy => _icCopy;

  static String get icCreditCard => _icCreditCard;

  static String get icCreditCard2 => _icCreditCard2;

  static String get icCash => _icCash;

  static String get icWallet => _icWallet;

  static String get icUpi => _icUpi;

  static String get icVeterinary => _icVeterinary;

  static String get icPawHeart => _icPawHeart;

  static String get icAddSquareOutlined => _icAddSquareOutlined;

  static String get icCamera => _icCamera;

  static String get icImage => _icImage;

  static String get icClose1 => _icClose1;

  static String get icClose2 => _icClose2;

  static String get icFemale => _icFemale;

  static String get icMale => _icMale;

  static String get icCheckmarkSquare => _icCheckmarkSquare;

  static String get icImageDelete => _icImageDelete;

  static String get icSettings => _icSettings;

  static String get icDocumentText => _icDocumentText;

  static String get icDocumentUpload => _icDocumentUpload;

  static String get icLocationPin => _icLocationPin;

  static String get icMapPin => _icMapPin;

  static String get icDiscountBadge => _icDiscountBadge;

  static String get icDiscount => _icDiscount;

  static String get icDiscount1 => _icDiscount1;

  static String get icDiscountFilled => _icDiscountFilled;

  static String get icCurrentLocation => _icCurrentLocation;

  static String get icLocation => _icLocation;

  static String get icEditFilled => _icEditFilled;

  static String get icMorning => _icMorning;

  static String get icAfternoon => _icAfternoon;

  static String get icEvening => _icEvening;

  static String get icCheckboxFilled => _icCheckboxFilled;

  static String get icCheckboxFilledBrown => _icCheckboxFilledBrown;

  static String get icCheckboxOutlined => _icCheckboxOutlined;

  static String get icLocationDenied => _icLocationDenied;

  static String get icAddLocation => _icAddLocation;

  static String get icLocationDisabled => _icLocationDisabled;

  static String get icContactBook => _icContactBook;

  static String get icGreenCheckmarkBadge => _icGreenCheckmarkBadge;

  static String get icAward1 => _icAward1;

  static String get icCheckmarkBadge => _icCheckmarkBadge;

  static String get icPeopleBadge => _icPeopleBadge;

  static String get icAwardBadge => _icAwardBadge;

  static String get icStarBadge => _icStarBadge;

  static String get icTitleHighlight => _icTitleHighlight;

  static String get icContainerTag => _icContainerTag;

  static String get icShare => _icShare;

  static String get icCustomerSupport => _icCustomerSupport;

  static String get icThumbsDown => _icThumbsDown;

  static String get icThumbsUp => _icThumbsUp;

  static String get icThumbsDownFilled => _icThumbsDownFilled;

  static String get icThumbsUpFilled => _icThumbsUpFilled;

  static String get icPaymentFailed => _icPaymentFailed;

  static String get icMoreH => _icMoreH;

  static String get icMicrophoneDisabled => _icMicrophoneDisabled;

  static String get icMicrophoneEnabled => _icMicrophoneEnabled;

  static String get icSpeakerDisabled => _icSpeakerDisabled;

  static String get icSpeakerEnabled => _icSpeakerEnabled;

  static String get icVideoDisabled => _icVideoDisabled;

  static String get icVideoEnabled => _icVideoEnabled;

  static String get icCallEnd => _icCallEnd;

  static String get icPeople => _icPeople;

  static String get icView => _icView;

  static String get icFilter1 => _icFilter1;

  static String get icSort => _icSort;

  static String get icBookmarkFilled => _icBookmarkFilled;

  static String get icBookmarkOutlined => _icBookmarkOutlined;

  static String get icMaps => _icMaps;

  static String get icCallCalling => _icCallCalling;

  static String get icCheckmarkCircleFilled => _icCheckmarkCircleFilled;

  static String get icHeart => _icHeart;

  static String get icHeartFilled => _icHeartFilled;

  static String get icOutOfStock => _icOutOfStock;

  static String get icScooter => _icScooter;

  static String get icDeliveryBox => _icDeliveryBox;

  static String get icLoyaltyCard => _icLoyaltyCard;

  static String get icSavedItems => _icSavedItems;

  static String get icPeopleAlsoBought => _icPeopleAlsoBought;

  static String get icPackage => _icPackage;

  static String get icUpdate => _icUpdate;

  static String get icPets => _icPets;

  static String get icConfirmed => _icConfirmed;

  static String get icPacked => _icPacked;

  static String get icShipped => _icShipped;

  static String get icOutForDelivery => _icOutForDelivery;

  static String get icDeliveryFailed => _icDeliveryFailed;

  static String get icDeliveryRescheduled => _icDeliveryRescheduled;

  static String get icDelivered => _icDelivered;

  static String get icOrderCanceled => _icOrderCanceled;

  static String get icReturnRequested => _icReturnRequested;

  static String get icReturnApproved => _icReturnApproved;

  static String get icReturnRejected => _icReturnRejected;

  static String get icReturnPickupScheduled => _icReturnPickupScheduled;

  static String get icReturnPickedUp => _icReturnPickedUp;

  static String get icReturnReceived => _icReturnReceived;

  static String get icReturned => _icReturned;

  static String get icReplacementRequested => _icReplacementRequested;

  static String get icReplacementCompleted => _icReplacementCompleted;

  static String get icFailed => _icFailed;

  static String get icRefunded => _icRefunded;

  static String get icFlash => _icFlash;

  static String get icRupeeCoin => _icRupeeCoin;

  static String get icDelete2 => _icDelete2;

  static String get icSendFilled => _icSendFilled;

  static String get icWhatsapp => _icWhatsapp;

  static String get icVeg => _icVeg;

  static String get icNonVeg => _icNonVeg;
}

class PNGAssetsPath {
  static const String _path = 'assets/png/';
  static const String _extension = '.png';

  // No Photo
  static const String _icNoPhoto = '${_path}ic_no_photo$_extension';

  static const String _welcomeImg1 = '${_path}splash_img_1$_extension';
  static const String _phoneLogoImg = '${_path}phone_logo_img$_extension';
  static const String _tiktok = '${_path}tiktok$_extension';
  static const String _google = '${_path}google$_extension';
  static const String _facebook = '${_path}facebook$_extension';

  // Getters
  static String get icNoPhoto => _icNoPhoto;
  static String get welcomeImg1 => _welcomeImg1;
  static String get phoneLogoImg => _phoneLogoImg;
  static String get tiktok => _tiktok;
  static String get google => _google;
  static String get facebook => _facebook;

}
// {
//   static const String _path = 'assets/png/';
//   static const String _extension = '.png';
//
//   // No Photo
//   static const String _icNoPhoto = '${_path}ic_no_photo$_extension';
//
//   // Scaffold Layer
//   static const String _scaffoldBgTexture = '${_path}scaffold_layer/landing_bg_texture$_extension';
//
//   // Splash & Onboarding
//   static const String _splash = '${_path}onboarding/welcome$_extension';
//   static const String _obOne = '${_path}onboarding/ob_one$_extension';
//   static const String _obTwo = '${_path}onboarding/ob_two$_extension';
//   static const String _obThree = '${_path}onboarding/ob_three$_extension';
//
//   // Ad Banners
//   static const String _adOne = '${_path}banner_ads/ad_one$_extension';
//   static const String _adTwo = '${_path}banner_ads/ad_two$_extension';
//   static const String _adThree = '${_path}banner_ads/ad_three$_extension';
//   static const String _adFour = '${_path}banner_ads/ad_four$_extension';
//   static const String _adAppbarOne = '${_path}banner_ads/ad_appbar_one$_extension';
//   static const String _adAppbarTwo = '${_path}banner_ads/ad_appbar_two$_extension';
//   static const String _adAppbarThree = '${_path}banner_ads/ad_appbar_three$_extension';
//   static const String _adAppbarFour = '${_path}banner_ads/ad_appbar_four$_extension';
//   static const String _adAppbarFive = '${_path}banner_ads/ad_appbar_five$_extension';
//   static const String _adAppbarSix = '${_path}banner_ads/ad_appbar_six$_extension';
//   static const String _adAppbarSeven = '${_path}banner_ads/ad_appbar_seven$_extension';
//   static const String _adAppbarEight = '${_path}banner_ads/ad_appbar_eight$_extension';
//   static const String _adAppbarNine = '${_path}banner_ads/ad_appbar_nine$_extension';
//   static const String _adAppbarTen = '${_path}banner_ads/ad_appbar_ten$_extension';
//
//   // Service Icons
//   static const String _icBoarding = '${_path}service_icons/ic_boarding$_extension';
//   static const String _icDaycare = '${_path}service_icons/ic_daycare$_extension';
//   static const String _icGrooming = '${_path}service_icons/ic_grooming$_extension';
//   static const String _icTraining = '${_path}service_icons/ic_training$_extension';
//   static const String _icWalking = '${_path}service_icons/ic_walking$_extension';
//   static const String _icVeterinary = '${_path}service_icons/ic_veterinary$_extension';
//
//   // Icons
//   static const String _icPetAllergy = '${_path}icons/ic_pet_allergy$_extension';
//   static const String _icTicks = '${_path}icons/ic_ticks$_extension';
//   static const String _icLocationPin = '${_path}icons/ic_location_pin$_extension';
//   static const String _icScooter = '${_path}icons/ic_scooter$_extension';
//
//   // profile_placeholders
//   static const String _doctorProfile = '${_path}profile_placeholders/doctor_profile$_extension';
//   static const String _doctorProfile2 = '${_path}profile_placeholders/doctor_profile_2$_extension';
//   static const String _groomerProfile = '${_path}profile_placeholders/groomer_profile$_extension';
//   static const String _groomerProfile2 = '${_path}profile_placeholders/groomer_profile_2$_extension';
//   static const String _doctor1 = '${_path}profile_placeholders/doctor_1$_extension';
//   static const String _doctor2 = '${_path}profile_placeholders/doctor_2$_extension';
//   static const String _doctor3 = '${_path}profile_placeholders/doctor_3$_extension';
//   static const String _doctor4 = '${_path}profile_placeholders/doctor_4$_extension';
//   static const String _doctor5 = '${_path}profile_placeholders/doctor_5$_extension';
//   static const String _vetClinic = '${_path}profile_placeholders/vet_clinic$_extension';
//
//   // images
//   static const String _homeVisitAppointment = '${_path}images/home_visit_appointment$_extension';
//   static const String _inClinicAppointment = '${_path}images/in_clinic_appointment$_extension';
//   static const String _onlineVideoConsultation = '${_path}images/online_video_consultation$_extension';
//   static const String _petInsuranceBanner1 = '${_path}images/pet_insurance_banner_1$_extension';
//   static const String _petInsuranceBanner2 = '${_path}images/pet_insurance_banner_2$_extension';
//   static const String _petInsuranceBanner3 = '${_path}images/pet_insurance_banner_3$_extension';
//   static const String _noPetsRegistered = '${_path}images/no_pets_registered$_extension';
//   static const String _cameraAccessDenied = '${_path}images/camera_access_denied$_extension';
//   static const String _galleryAccessDenied = '${_path}images/gallery_access_denied$_extension';
//   static const String _consultInstantlyBanner = '${_path}images/consult_instantly_banner$_extension';
//   static const String _appFooterImage1 = '${_path}images/app_footer_image_1$_extension';
//   static const String _welcomeBanner1 = '${_path}images/welcome_banner_1$_extension';
//   static const String _welcomeBanner2 = '${_path}images/welcome_banner_2$_extension';
//   static const String _welcomeBannerGrooming1 = '${_path}images/welcome_banner_grooming_1$_extension';
//   static const String _appointmentCancelled = '${_path}images/appointment_cancelled$_extension';
//   static const String _locationAccessDenied = '${_path}images/location_access_denied$_extension';
//   static const String _locationAccessDenied2 = '${_path}images/location_access_denied_2$_extension';
//   static const String _internetNotConnected = '${_path}images/internet_not_connected$_extension';
//   static const String _contactsAccessDenied = '${_path}images/contacts_access_denied$_extension';
//   static const String _feedPetsBanner1 = '${_path}images/feed_pets_banner$_extension';
//   static const String _feedPetsBanner2 = '${_path}images/feed_pets_banner_2$_extension';
//   static const String _catDogHeart = '${_path}images/cat_dog_heart$_extension';
//   static const String _cat = '${_path}images/cat$_extension';
//   static const String _dog = '${_path}images/dog$_extension';
//   static const String _dogBathing = '${_path}images/dog_bathing$_extension';
//   static const String _dogHaircut = '${_path}images/dog_haircut$_extension';
//   static const String _dogEarClean = '${_path}images/dog_ear_clean$_extension';
//   static const String _dogNailCut = '${_path}images/dog_nailcut$_extension';
//   static const String _dogTeethClean = '${_path}images/dog_teeth_clean$_extension';
//   static const String _dogPawPadCare = '${_path}images/dog_paw_pad_care$_extension';
//   static const String _dogStyleHaircut = '${_path}images/dog_style_haircut$_extension';
//   static const String _dogBinoculars = '${_path}images/dog_binoculars$_extension';
//   static const String _shopTabBg = '${_path}images/shop_tab_bg$_extension';
//   static const String _pharmacyScreenBg = '${_path}images/pharmacy_screen_bg$_extension';
//   static const String _petMedicine1 = '${_path}images/pet_medicine_1$_extension';
//   static const String _petMedicine2 = '${_path}images/pet_medicine_2$_extension';
//   static const String _petMedicine3 = '${_path}images/pet_medicine_3$_extension';
//   static const String _petMedicine4 = '${_path}images/pet_medicine_4$_extension';
//   static const String _petMedicine5 = '${_path}images/pet_medicine_5$_extension';
//   static const String _petMedicine6 = '${_path}images/pet_medicine_6$_extension';
//   static const String _petMedicine7 = '${_path}images/pet_medicine_7$_extension';
//   static const String _petMedicine8 = '${_path}images/pet_medicine_8$_extension';
//   static const String _petMedicine9 = '${_path}images/pet_medicine_9$_extension';
//   static const String _petMedicine10 = '${_path}images/pet_medicine_10$_extension';
//   static const String _petMedicine11 = '${_path}images/pet_medicine_11$_extension';
//   static const String _petToys1 = '${_path}images/pet_toys_1$_extension';
//   static const String _petSkinCare = '${_path}images/pet_skin_care$_extension';
//   static const String _petTreats1 = '${_path}images/pet_treats_1$_extension';
//   static const String _petVitamins = '${_path}images/pet_vitamins$_extension';
//   static const String _petPainRelief = '${_path}images/pet_pain_relief$_extension';
//   static const String _dogFood1 = '${_path}images/dog_food_1$_extension';
//   static const String _catFood1 = '${_path}images/cat_food_1$_extension';
//   static const String _shoppingBags1 = '${_path}images/shopping_bags_1$_extension';
//   static const String _petShampoo1 = '${_path}images/pet_shampoo_1$_extension';
//   static const String _petEyeCare = '${_path}images/pet_eye_care$_extension';
//   static const String _petDigestiveHealth = '${_path}images/pet_digestive_health$_extension';
//   static const String _petSupplements1 = '${_path}images/pet_suppliments_1$_extension';
//   static const String _dogBowl1 = '${_path}images/dog_bowl_1$_extension';
//   static const String _dogFood2 = '${_path}images/dog_food_2$_extension';
//   static const String _dogLeashe1 = '${_path}images/dog_leashe_1$_extension';
//   static const String _dogToys1 = '${_path}images/dog_toys_1$_extension';
//   static const String _dogTreats1 = '${_path}images/dog_treats_1$_extension';
//   static const String _dogShampoo1 = '${_path}images/dog_shampoo_1$_extension';
//   static const String _dogComb1 = '${_path}images/dog_comb_1$_extension';
//   static const String _catCollars1 = '${_path}images/cat_collars_1$_extension';
//   static const String _catFood2 = '${_path}images/cat_food_2$_extension';
//   static const String _catFoodBowl1 = '${_path}images/cat_food_bowl_1$_extension';
//   static const String _catShampoo1 = '${_path}images/cat_shampoo_1$_extension';
//   static const String _catToys1 = '${_path}images/cat_toys_1$_extension';
//   static const String _catTreats1 = '${_path}images/cat_treats_1$_extension';
//   static const String _catLitter1 = '${_path}images/cat_litter_1$_extension';
//   static const String _catBeds1 = '${_path}images/cat_beds_1$_extension';
//   static const String _dogDrools = '${_path}images/dog_drools$_extension';
//   static const String _dogFermina = '${_path}images/dog_fermina$_extension';
//   static const String _dogOrigen = '${_path}images/dog_origen$_extension';
//   static const String _dogPedigree = '${_path}images/dog_pedigree$_extension';
//   static const String _dogRoyalCanin = '${_path}images/dog_royal_canin$_extension';
//   static const String _catFermina = '${_path}images/cat_farmina$_extension';
//   static const String _catFriskies = '${_path}images/cat_friskies$_extension';
//   static const String _catMeo = '${_path}images/cat_meo$_extension';
//   static const String _catPurepet = '${_path}images/cat_purepet$_extension';
//   static const String _catRoyalCanin = '${_path}images/cat_royal_canin$_extension';
//   static const String _catSheba = '${_path}images/cat_sheba$_extension';
//   static const String _catWishkas = '${_path}images/cat_wishkas$_extension';
//   static const String _petWipes = '${_path}images/pet_wipes$_extension';
//   static const String _petPerfume = '${_path}images/pet_perfume$_extension';
//   static const String _petLitter1 = '${_path}images/pet_litter_1$_extension';
//   static const String _petEyeEarCare = '${_path}images/pet_eye_ear_care$_extension';
//   static const String _product1 = '${_path}images/product_1$_extension';
//   static const String _product2 = '${_path}images/product_2$_extension';
//   static const String _product3 = '${_path}images/product_3$_extension';
//   static const String _product4 = '${_path}images/product_4$_extension';
//   static const String _product5 = '${_path}images/product_5$_extension';
//   static const String _product6 = '${_path}images/product_6$_extension';
//   static const String _product7 = '${_path}images/product_7$_extension';
//   static const String _product8 = '${_path}images/product_8$_extension';
//   static const String _product9 = '${_path}images/product_9$_extension';
//   static const String _product10 = '${_path}images/product_10$_extension';
//   static const String _product11 = '${_path}images/product_11$_extension';
//   static const String _product12 = '${_path}images/product_12$_extension';
//   static const String _product13 = '${_path}images/product_13$_extension';
//   static const String _product14 = '${_path}images/product_14$_extension';
//   static const String _product15 = '${_path}images/product_15$_extension';
//   static const String _product16 = '${_path}images/product_16$_extension';
//   static const String _product17 = '${_path}images/product_17$_extension';
//   static const String _product18 = '${_path}images/product_18$_extension';
//   static const String _product19 = '${_path}images/product_19$_extension';
//   static const String _product20 = '${_path}images/product_20$_extension';
//   static const String _product21 = '${_path}images/product_21$_extension';
//   static const String _product22 = '${_path}images/product_22$_extension';
//   static const String _product23 = '${_path}images/product_23$_extension';
//   static const String _product24 = '${_path}images/product_24$_extension';
//   static const String _product25 = '${_path}images/product_25$_extension';
//   static const String _product26 = '${_path}images/product_26$_extension';
//   static const String _product27 = '${_path}images/product_27$_extension';
//   static const String _product28 = '${_path}images/product_28$_extension';
//   static const String _product29 = '${_path}images/product_29$_extension';
//   static const String _petFleaMedicine1 = '${_path}images/pet_flea_mdeicine_1$_extension';
//   static const String _petWellnessPoster = '${_path}images/pet_wellness_poster$_extension';
//   static const String _brandRoyalCanin = '${_path}images/brand_royal_canin$_extension';
//   static const String _rupeeCoinStack = '${_path}images/rupee_coin_stack$_extension';
//   static const String _picFrosty = '${_path}images/pic_frosty$_extension';
//   static const String _picHazel = '${_path}images/pic_hazel$_extension';
//   static const String _picMhanz = '${_path}images/pic_mhanz$_extension';
//   static const String _picShanz = '${_path}images/pic_shanz$_extension';
//   static const String _productRating1 = '${_path}images/product_rating_1$_extension';
//   static const String _productRating2 = '${_path}images/product_rating_2$_extension';
//   static const String _productRating3 = '${_path}images/product_rating_3$_extension';
//
//
//
//   // pet_types
//   static const String _petTypeBird = '${_path}pet_types/bird$_extension';
//   static const String _petTypeHamster = '${_path}pet_types/hamster$_extension';
//   static const String _petTypeKitten = '${_path}pet_types/kitten$_extension';
//   static const String _petTypePuppy = '${_path}pet_types/puppy$_extension';
//   static const String _petTypeRabbit = '${_path}pet_types/rabbit$_extension';
//   static const String _petTypeTurtle = '${_path}pet_types/turtle$_extension';
//
//
//   // Getters
//   static String get icNoPhoto => _icNoPhoto;
//   static String get scaffoldBgTexture => _scaffoldBgTexture;
//
//   static String get welcome => _splash;
//   static String get obOne => _obOne;
//   static String get obTwo => _obTwo;
//   static String get obThree => _obThree;
//
//   static String get adOne => _adOne;
//   static String get adTwo => _adTwo;
//   static String get adThree => _adThree;
//   static String get adFour => _adFour;
//   static String get adAppbarOne => _adAppbarOne;
//   static String get adAppbarTwo => _adAppbarTwo;
//   static String get adAppbarThree => _adAppbarThree;
//   static String get adAppbarFour => _adAppbarFour;
//   static String get adAppbarFive => _adAppbarFive;
//   static String get adAppbarSix => _adAppbarSix;
//   static String get adAppbarSeven => _adAppbarSeven;
//   static String get adAppbarEight => _adAppbarEight;
//   static String get adAppbarNine => _adAppbarNine;
//   static String get adAppbarTen => _adAppbarTen;
//
//   static String get icBoarding => _icBoarding;
//   static String get icDaycare => _icDaycare;
//   static String get icGrooming => _icGrooming;
//   static String get icTraining => _icTraining;
//   static String get icWalking => _icWalking;
//   static String get icVeterinary => _icVeterinary;
//   static String get icPetAllergy => _icPetAllergy;
//   static String get icTicks => _icTicks;
//   static String get icLocationPin => _icLocationPin;
//   static String get icScooter => _icScooter;
//
//   static String get doctorProfile => _doctorProfile;
//   static String get doctorProfile2 => _doctorProfile2;
//   static String get groomerProfile => _groomerProfile;
//   static String get groomerProfile2 => _groomerProfile2;
//   static String get doctor1 => _doctor1;
//   static String get doctor2 => _doctor2;
//   static String get doctor3 => _doctor3;
//   static String get doctor4 => _doctor4;
//   static String get doctor5 => _doctor5;
//   static String get vetClinic => _vetClinic;
//
//
//   static String get homeVisitAppointment => _homeVisitAppointment;
//   static String get inClinicAppointment => _inClinicAppointment;
//   static String get onlineVideoConsultation => _onlineVideoConsultation;
//   static String get petInsuranceBanner1 => _petInsuranceBanner1;
//   static String get petInsuranceBanner2 => _petInsuranceBanner2;
//   static String get petInsuranceBanner3 => _petInsuranceBanner3;
//   static String get noPetsRegistered => _noPetsRegistered;
//   static String get cameraAccessDenied => _cameraAccessDenied;
//   static String get galleryAccessDenied => _galleryAccessDenied;
//   static String get consultInstantlyBanner => _consultInstantlyBanner;
//   static String get appFooterImage1 => _appFooterImage1;
//   static String get welcomeBanner1 => _welcomeBanner1;
//   static String get welcomeBanner2 => _welcomeBanner2;
//   static String get welcomeBannerGrooming1 => _welcomeBannerGrooming1;
//   static String get appointmentCancelled => _appointmentCancelled;
//   static String get locationAccessDenied => _locationAccessDenied;
//   static String get locationAccessDenied2 => _locationAccessDenied2;
//   static String get internetNotConnected => _internetNotConnected;
//   static String get contactsAccessDenied => _contactsAccessDenied;
//   static String get feedPetsBanner1 => _feedPetsBanner1;
//   static String get feedPetsBanner2 => _feedPetsBanner2;
//   static String get catDogHeart => _catDogHeart;
//   static String get cat => _cat;
//   static String get dog => _dog;
//   static String get dogBathing => _dogBathing;
//   static String get dogHaircut => _dogHaircut;
//   static String get dogEarClean => _dogEarClean;
//   static String get dogNailCut => _dogNailCut;
//   static String get dogTeethClean => _dogTeethClean;
//   static String get dogPawPadCare => _dogPawPadCare;
//   static String get dogStyleHaircut => _dogStyleHaircut;
//   static String get dogBinoculars => _dogBinoculars;
//   static String get shopTabBg => _shopTabBg;
//   static String get pharmacyScreenBg => _pharmacyScreenBg;
//   static String get petMedicine1 => _petMedicine1;
//   static String get petMedicine2 => _petMedicine2;
//   static String get petMedicine3 => _petMedicine3;
//   static String get petMedicine4 => _petMedicine4;
//   static String get petMedicine5 => _petMedicine5;
//   static String get petMedicine6 => _petMedicine6;
//   static String get petMedicine7 => _petMedicine7;
//   static String get petMedicine8 => _petMedicine8;
//   static String get petMedicine9 => _petMedicine9;
//   static String get petMedicine10 => _petMedicine10;
//   static String get petMedicine11 => _petMedicine11;
//   static String get petToys1 => _petToys1;
//   static String get petSkinCare => _petSkinCare;
//   static String get petTreats1 => _petTreats1;
//   static String get petVitamins => _petVitamins;
//   static String get petPainRelief => _petPainRelief;
//   static String get dogFood1 => _dogFood1;
//   static String get catFood1 => _catFood1;
//   static String get shoppingBags1 => _shoppingBags1;
//   static String get petShampoo1 => _petShampoo1;
//   static String get petEyeCare => _petEyeCare;
//   static String get petDigestiveHealth => _petDigestiveHealth;
//   static String get petSupplements1 => _petSupplements1;
//   static String get dogBowl1 => _dogBowl1;
//   static String get dogFood2 => _dogFood2;
//   static String get dogLeashe1 => _dogLeashe1;
//   static String get dogToys1 => _dogToys1;
//   static String get dogTreats1 => _dogTreats1;
//   static String get dogShampoo1 => _dogShampoo1;
//   static String get dogComb1 => _dogComb1;
//   static String get catCollars1 => _catCollars1;
//   static String get catFood2 => _catFood2;
//   static String get catFoodBowl1 => _catFoodBowl1;
//   static String get catShampoo1 => _catShampoo1;
//   static String get catToys1 => _catToys1;
//   static String get catTreats1 => _catTreats1;
//   static String get catLitter1 => _catLitter1;
//   static String get catBeds1 => _catBeds1;
//   static String get dogDrools => _dogDrools;
//   static String get dogFermina => _dogFermina;
//   static String get dogOrigen => _dogOrigen;
//   static String get dogPedigree => _dogPedigree;
//   static String get dogRoyalCanin => _dogRoyalCanin;
//   static String get catFermina => _catFermina;
//   static String get catFriskies => _catFriskies;
//   static String get catMeo => _catMeo;
//   static String get catPurepet => _catPurepet;
//   static String get catRoyalCanin => _catRoyalCanin;
//   static String get catSheba => _catSheba;
//   static String get catWishkas => _catWishkas;
//   static String get petWipes => _petWipes;
//   static String get petPerfume => _petPerfume;
//   static String get petLitter1 => _petLitter1;
//   static String get petEyeEarCare => _petEyeEarCare;
//   static String get product1 => _product1;
//   static String get product2 => _product2;
//   static String get product3 => _product3;
//   static String get product4 => _product4;
//   static String get product5 => _product5;
//   static String get product6 => _product6;
//   static String get product7 => _product7;
//   static String get product8 => _product8;
//   static String get product9 => _product9;
//   static String get product10 => _product10;
//   static String get product11 => _product11;
//   static String get product12 => _product12;
//   static String get product13 => _product13;
//   static String get product14 => _product14;
//   static String get product15 => _product15;
//   static String get product16 => _product16;
//   static String get product17 => _product17;
//   static String get product18 => _product18;
//   static String get product19 => _product19;
//   static String get product20 => _product20;
//   static String get product21 => _product21;
//   static String get product22 => _product22;
//   static String get product23 => _product23;
//   static String get product24 => _product24;
//   static String get product25 => _product25;
//   static String get product26 => _product26;
//   static String get product27 => _product27;
//   static String get product28 => _product28;
//   static String get product29 => _product29;
//   static String get petFleaMedicine1 => _petFleaMedicine1;
//   static String get petWellnessPoster => _petWellnessPoster;
//   static String get brandRoyalCanin => _brandRoyalCanin;
//   static String get rupeeCoinStack => _rupeeCoinStack;
//   static String get picFrosty => _picFrosty;
//   static String get picHazel => _picHazel;
//   static String get picMhanz => _picMhanz;
//   static String get picShanz => _picShanz;
//   static String get productRating1 => _productRating1;
//   static String get productRating2 => _productRating2;
//   static String get productRating3 => _productRating3;
//
//
//
//
//   static String get petTypeBird => _petTypeBird;
//   static String get petTypeHamster => _petTypeHamster;
//   static String get petTypeKitten => _petTypeKitten;
//   static String get petTypePuppy => _petTypePuppy;
//   static String get petTypeRabbit => _petTypeRabbit;
//   static String get petTypeTurtle => _petTypeTurtle;
//
//   String randomProductImage() {
//     final Random random = Random();
//     final int randomNumber = random.nextInt(29) + 1;
//     return '${PNGAssetsPath._path}images/product_$randomNumber${PNGAssetsPath._extension}';
//   }
//
//   String randomPetMedicineImage() {
//     final Random random = Random();
//     final int randomNumber = random.nextInt(11) + 1;
//     return '${PNGAssetsPath._path}images/pet_medicine_$randomNumber${PNGAssetsPath._extension}';
//   }
// }

class LOTTIEAssetsPath {
  static const String _path = 'assets/lottie/';
  static const String _extension = '.json';

  // Lottie Animations
  static const String _cancel = '${_path}lottie_cancel$_extension';
  static const String _doubleArrowRight =
      '${_path}lottie_double_arrow_right$_extension';
  static const String _confirmation = '${_path}lottie_confirmation$_extension';
  static const String _statusCancelled =
      '${_path}lottie_status_cancelled$_extension';
  static const String _statusPending =
      '${_path}lottie_status_pending$_extension';
  static const String _statusRescheduled =
      '${_path}lottie_status_rescheduled$_extension';
  static const String _puff = '${_path}lottie_puff$_extension';

  // Getters
  static String get cancel => _cancel;

  static String get doubleArrowRight => _doubleArrowRight;

  static String get confirmation => _confirmation;

  static String get statusCancelled => _statusCancelled;

  static String get statusPending => _statusPending;

  static String get statusRescheduled => _statusRescheduled;

  static String get puff => _puff;
}

class AudioAssetsPath {
  static const String _path = 'audio/';
  static const String _extension = '.mp3';

  // Audio
  static const String _bookingConfirmedSound =
      '${_path}booking_confirmed_sound$_extension';

  // Getters
  static String get bookingConfirmedSound => _bookingConfirmedSound;
}

class GifAssetsPath {
  static const String _path = 'assets/gifs/';
  static const String _extension = '.gif';

  // GIFs
  static const String _pharmaShopBg = '${_path}pharma_shop_bg$_extension';
  static const String _confirmedBlue = '${_path}confirmed_blue$_extension';
  static const String _confirmedGreen = '${_path}confirmed_green$_extension';
  static const String _confirmedDarkBrown =
      '${_path}confirmed_dark_brown$_extension';
  static const String _confirmedDarkPurple =
      '${_path}confirmed_dark_purple$_extension';
  static const String _cancelledRed = '${_path}cancelled$_extension';

  // Getters
  static String get pharmaShopBg => _pharmaShopBg;

  static String get confirmedBlue => _confirmedBlue;

  static String get confirmedGreen => _confirmedGreen;

  static String get confirmedDarkBrown => _confirmedDarkBrown;

  static String get confirmedDarkPurple => _confirmedDarkPurple;

  static String get cancelledRed => _cancelledRed;
}

class PDFAssetsPath {
  static const String _path = 'assets/pdfs/';

  // PDFs
  static const String _samplePdf = '${_path}sample.pdf';

  // Getters
  static String get samplePdf => _samplePdf;
}

class HTMLAssetsPath {
  static const String _path = 'assets/html/';

  // HTMLs
  static const String _aboutUsHtml = '${_path}about_us.html';
  static const String _privacyPolicyHtml = '${_path}privacy_policy.html';
  static const String _termsAndConditionsHtml =
      '${_path}terms_and_conditions.html';

  // Getters
  static String get aboutUsHtml => _aboutUsHtml;

  static String get privacyPolicyHtml => _privacyPolicyHtml;

  static String get termsAndConditionsHtml => _termsAndConditionsHtml;
}

const String launcherIconPath = 'assets/ic_launcher.png';
