import 'package:equatable/equatable.dart';

import '../../Models/update_Map_Model.dart';

abstract class HomeAppState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomecubitIntialStates extends HomeAppState {}

class GlobalError extends HomeAppState {
  GlobalError(String string);
}

class UpdateMapSuccess extends HomeAppState {
  UpdateMapModel response;

  UpdateMapSuccess({required this.response});

  @override
  List<Object> get props => [response];
}
// class HomeSuccessStates extends HomeAppState {
//   List<ShopData>? items;

//   HomeSuccessStates({this.items});
// }

// class HomeShopFilterSuccessStates extends HomeAppState {
//   List<ShopData>? items;
//   LocationModel model;

//   HomeShopFilterSuccessStates({this.items, required this.model});

//   @override
//   List<Object?> get props => [items, model];
// }

// class GetSavedLocationSuccessStates extends HomeAppState {
//   LocationModel? model;

//   GetSavedLocationSuccessStates({this.model});

//   @override
//   List<Object?> get props => [model];
// }

class HomeLoadingState extends HomeAppState {}

class HomeErrorStates extends HomeAppState {
  final String error;

  HomeErrorStates(this.error);
}

// class CheckOtpSuccessStates extends HomeAppState {
//   final UserResponse userModel;

//   CheckOtpSuccessStates(this.userModel);
// }

class CheckOtpLoadingState extends HomeAppState {}

class CheckOtpErrorStates extends HomeAppState {
  final String error;

  CheckOtpErrorStates(this.error);
}

class ShopDetailsSuccessStates extends HomeAppState {
  // final LoginModel loginModel;

  ShopDetailsSuccessStates();
}

class DeliveryDataSuccessStates extends HomeAppState {
  // final LoginModel loginModel;

  DeliveryDataSuccessStates();
}

class DeliveryDataErrorStates extends HomeAppState {
  final String error;

  DeliveryDataErrorStates(this.error);
}

class MyNotificationLoadingStates extends HomeAppState {}

class MyNotificationSuccessStates extends HomeAppState {
  // final LoginModel loginModel;

  MyNotificationSuccessStates();
}

class MyNotificationErrorStates extends HomeAppState {
  final String error;

  MyNotificationErrorStates(this.error);
}

class AcceptSugLoadingStates extends HomeAppState {}

class AcceptSugSuccessStates extends HomeAppState {
  // final LoginModel loginModel;

  AcceptSugSuccessStates();
}

class AcceptSugErrorStates extends HomeAppState {
  final String error;

  AcceptSugErrorStates(this.error);
}

class ShopDetailsLoadingState extends HomeAppState {}

class ShopDetailsErrorStates extends HomeAppState {
  final String error;

  ShopDetailsErrorStates(this.error);
}

class ShopSuggestionSuccessStates extends HomeAppState {
  // final LoginModel loginModel;

  ShopSuggestionSuccessStates();
}

class ShopSuggestionErrorStates extends HomeAppState {
  final String error;

  ShopSuggestionErrorStates(this.error);
}

class GetCountresLoadingState extends HomeAppState {}

class GetCountresErrorStates extends HomeAppState {
  final String error;

  GetCountresErrorStates(this.error);
}

class OrderScreenSuccessStates extends HomeAppState {
  // final LoginModel loginModel;

  OrderScreenSuccessStates();
}

class GetdigitalShopRatingLoadingState extends HomeAppState {}

class GetdigitalShopRatingErrorStates extends HomeAppState {
  final String error;

  GetdigitalShopRatingErrorStates(this.error);
}

class GetdigitalShopRatingsuccessStates extends HomeAppState {
  // final LoginModel loginModel;

  GetdigitalShopRatingsuccessStates();
}

class OrderScreenLoadingState extends HomeAppState {}

class OrderScreenErrorStates extends HomeAppState {
  final String error;

  OrderScreenErrorStates(this.error);
}

class PostOrderSuccessStates extends HomeAppState {
  // final LoginModel loginModel;

  PostOrderSuccessStates();
}

class QuickFilterLoadingState extends HomeAppState {}

class QuickFilterErrorStates extends HomeAppState {
  final String error;

  QuickFilterErrorStates(this.error);
}

class QuickFilterSuccessStates extends HomeAppState {
  // final LoginModel loginModel;

  QuickFilterSuccessStates();
}

class PostOrderLoadingState extends HomeAppState {}

class PostOrderErrorStates extends HomeAppState {
  final String error;

  PostOrderErrorStates(this.error);
}

class PosQuickOrderSuccessStates extends HomeAppState {
  // final LoginModel loginModel;

  PosQuickOrderSuccessStates();
}

class PosQuickOrderLoadingState extends HomeAppState {}

class PosQuickOrderErrorStates extends HomeAppState {
  final String error;

  PosQuickOrderErrorStates(this.error);
}

class PosRatSuccessStates extends HomeAppState {
  // final LoginModel loginModel;

  PosRatSuccessStates();
}

class PosRatLoadingState extends HomeAppState {}

class PosRatErrorStates extends HomeAppState {
  final String error;

  PosRatErrorStates(this.error);
}

class ReadyQuickPostOrderSuccessStates extends HomeAppState {
  // final LoginModel loginModel;

  ReadyQuickPostOrderSuccessStates();
}

class ReadyQuickPostOrderLoadingState extends HomeAppState {}

class ReadyQuickPostOrderErrorStates extends HomeAppState {
  final String error;

  ReadyQuickPostOrderErrorStates(this.error);
}

class PostCartSuccessStates extends HomeAppState {
  // final LoginModel loginModel;

  PostCartSuccessStates();
}

class PostCartLoadingState extends HomeAppState {}

class PostCartErrorStates extends HomeAppState {
  final String error;

  PostCartErrorStates(this.error);
}

class PostDigitalOrderSuccessStates extends HomeAppState {
  // final LoginModel loginModel;

  PostDigitalOrderSuccessStates();
}

class PostDigitalOrderLoadingState extends HomeAppState {}

class PostDigitalOrderErrorStates extends HomeAppState {
  final String error;

  PostDigitalOrderErrorStates(this.error);
}

class UpdateScadualeSuccessStates extends HomeAppState {
  // final LoginModel loginModel;

  UpdateScadualeSuccessStates();
}

class UpdateScadualeLoadingState extends HomeAppState {}

class UpdateScadualeErrorStates extends HomeAppState {
  final String error;

  UpdateScadualeErrorStates(this.error);
}

class PostGiftOrderSuccessStates extends HomeAppState {
  String? message;

  PostGiftOrderSuccessStates({this.message});

  @override
  List<Object?> get props => [message];
}

class PostGiftOrderLoadingState extends HomeAppState {}

class PostGiftOrderErrorStates extends HomeAppState {
  final String error;

  PostGiftOrderErrorStates(this.error);
}

class PostEditProfileSuccessStates extends HomeAppState {
  // final LoginModel loginModel;

  PostEditProfileSuccessStates();
}

class PostEditProfileLoadingState extends HomeAppState {}

class PostEditProfileErrorStates extends HomeAppState {
  final String error;

  PostEditProfileErrorStates(this.error);
}

class AddVisaCardSuccessStates extends HomeAppState {
  // final LoginModel loginModel;

  AddVisaCardSuccessStates();
}

class AddVisaCardLoadingState extends HomeAppState {}

class PAddVisaCardErrorStates extends HomeAppState {
  final String error;

  PAddVisaCardErrorStates(this.error);
}

class TabDetailsSuccessStates extends HomeAppState {
  // final LoginModel loginModel;

  TabDetailsSuccessStates();
}

class TabDetailsLoadingState extends HomeAppState {}

class TabDetailsErrorStates extends HomeAppState {
  final String error;

  TabDetailsErrorStates(this.error);
}

class QuickSuggestionSuccessStates extends HomeAppState {
  QuickSuggestionSuccessStates();
}

class QuickSuggestionLoadingState extends HomeAppState {}

class QuickSuggestionErrorStates extends HomeAppState {
  final String error;

  QuickSuggestionErrorStates(this.error);
}

class GetCartSuccessStates extends HomeAppState {
  // final LoginModel loginModel;

  GetCartSuccessStates();
}

class GetCartLoadingState extends HomeAppState {}

class GetCartErrorStates extends HomeAppState {
  final String error;

  GetCartErrorStates(this.error);
}

class GetNonReadyQuickSuccessStates extends HomeAppState {
  // final LoginModel loginModel;
  int stepper;

  GetNonReadyQuickSuccessStates({required this.stepper});

  @override
  List<Object?> get props => [stepper];
}

class GetNonReadyQuickLoadingState extends HomeAppState {}

class GetNonReadyQuickErrorStates extends HomeAppState {
  final String error;

  GetNonReadyQuickErrorStates(this.error);
}

class GetPerformaceSuccessStates extends HomeAppState {
  // final LoginModel loginModel;

  GetPerformaceSuccessStates();
}

class GetPerformaceLoadingState extends HomeAppState {}

class GetPerformaceErrorStates extends HomeAppState {
  final String error;

  GetPerformaceErrorStates(this.error);
}

class GetClientTrackingSuccessStates extends HomeAppState {
  // final LoginModel loginModel;

  GetClientTrackingSuccessStates();
}

class GetClientTrackingLoadingState extends HomeAppState {}

class GetClientTrackingErrorStates extends HomeAppState {
  final String error;

  GetClientTrackingErrorStates(this.error);
}

class GetVisaCardSuccessStates extends HomeAppState {
  // final LoginModel loginModel;

  GetVisaCardSuccessStates();
}

class GetVisaCardLoadingState extends HomeAppState {}

class GetVisaCardErrorStates extends HomeAppState {
  final String error;

  GetVisaCardErrorStates(this.error);
}

class DeleteVisaCardSuccessStates extends HomeAppState {
  // final LoginModel loginModel;

  DeleteVisaCardSuccessStates();
}

class DeleteGetVisaCardLoadingState extends HomeAppState {}

class DeleteGetVisaCardErrorStates extends HomeAppState {
  final String error;

  DeleteGetVisaCardErrorStates(this.error);
}

class GetwalletBalanceSuccessStates extends HomeAppState {
  // final LoginModel loginModel;

  GetwalletBalanceSuccessStates();
}

class GetwalletBalanceLoadingState extends HomeAppState {}

class GetwalletBalanceErrorStates extends HomeAppState {
  final String error;

  GetwalletBalanceErrorStates(this.error);
}

class AdsSuccessStates extends HomeAppState {
  // final LoginModel loginModel;

  AdsSuccessStates();
}

class AdsCartLoadingState extends HomeAppState {}

class AdsErrorStates extends HomeAppState {
  final String error;

  AdsErrorStates(this.error);
}

class GetDigitalOrderSuccessStates extends HomeAppState {
  // final LoginModel loginModel;

  GetDigitalOrderSuccessStates();
}

class GetDigitalOrderLoadingState extends HomeAppState {}

class GetDigitalOrderErrorStates extends HomeAppState {
  final String error;

  GetDigitalOrderErrorStates(this.error);
}

class GetQuickOrderSuccessStates extends HomeAppState {
  // final LoginModel loginModel;
  // List<ProductData> items;
  GetQuickOrderSuccessStates();
}

class GetQuickOrderLoadingState extends HomeAppState {}

class GetQuickOrderErrorStates extends HomeAppState {
  final String error;

  GetQuickOrderErrorStates(this.error);
}

class GetQuickFilterSuccessStates extends HomeAppState {
  // final LoginModel loginModel;

  GetQuickFilterSuccessStates();
}

class GetQuickFilterLoadingState extends HomeAppState {}

class GetQuickFilterErrorStates extends HomeAppState {
  final String error;

  GetQuickFilterErrorStates(this.error);
}

class ProfileGiftSuccessStates extends HomeAppState {
  // final LoginModel loginModel;

  ProfileGiftSuccessStates();
}

class ProfileGiftLoadingState extends HomeAppState {}

class ProfileGiftErrorStates extends HomeAppState {
  final String error;

  ProfileGiftErrorStates(this.error);
}

class ProfileSuccessStates extends HomeAppState {
  // final LoginModel loginModel;

  ProfileSuccessStates();
}

class ProfileLoadingState extends HomeAppState {}

class ProfileErrorStates extends HomeAppState {
  final String error;

  ProfileErrorStates(this.error);
}

class OffersSuccessStates extends HomeAppState {
  // final LoginModel loginModel;

  OffersSuccessStates();
}

class OffersLoadingState extends HomeAppState {}

class OffersErrorStates extends HomeAppState {
  final String error;

  OffersErrorStates(this.error);
}

class OneOffersSuccessStates extends HomeAppState {
  // final LoginModel loginModel;

  OneOffersSuccessStates();
}

class OneOffersLoadingState extends HomeAppState {}

class OneOffersErrorStates extends HomeAppState {
  final String error;

  OneOffersErrorStates(this.error);
}

class DeleteCartSuccessStates extends HomeAppState {
  // final LoginModel loginModel;

  DeleteCartSuccessStates();
}

class DeleteCartLoadingState extends HomeAppState {}

class DeleteCartErrorStates extends HomeAppState {
  final String error;

  DeleteCartErrorStates(this.error);
}

class GiveRatingSuccessStates extends HomeAppState {
  // final LoginModel loginModel;

  GiveRatingSuccessStates();
}

class GiveRatingLoadingState extends HomeAppState {}

class DGiveRatingErrorStates extends HomeAppState {
  final String error;

  DGiveRatingErrorStates(this.error);
}

class ConfirmOrderSuccessStates extends HomeAppState {
  // final LoginModel loginModel;

  ConfirmOrderSuccessStates();
}

class ConfirmOrderLoadingState extends HomeAppState {}

class ConfirmOrderErrorStates extends HomeAppState {
  final String error;

  ConfirmOrderErrorStates(this.error);
}

class CancelOrderSuccessStates extends HomeAppState {
  // final LoginModel loginModel;

  CancelOrderSuccessStates();
}

class CancelOrderLoadingState extends HomeAppState {}

class CancelOrderErrorStates extends HomeAppState {
  final String error;

  CancelOrderErrorStates(this.error);
}

class ApplyCouponSuccessStates extends HomeAppState {
  // final LoginModel loginModel;

  ApplyCouponSuccessStates();
}

class ApplyCouponLoadingState extends HomeAppState {}

class ApplyCouponErrorStates extends HomeAppState {
  final String error;

  ApplyCouponErrorStates(this.error);
}

class DeleteAllSuggestionSuccessStates extends HomeAppState {
  // final LoginModel loginModel;

  DeleteAllSuggestionSuccessStates();
}

class DeleteAllSuggestionLoadingState extends HomeAppState {}

class DeleteAllSuggestionErrorStates extends HomeAppState {
  final String error;

  DeleteAllSuggestionErrorStates(this.error);
}

class ShopChangePasswordVisibilityState extends HomeAppState {}

class JoinCallSuccessStates extends HomeAppState {
  // final LoginModel loginModel;

  JoinCallSuccessStates();
}

class JoinCallLoadingState extends HomeAppState {}

class JoinCallErrorStates extends HomeAppState {
  final String error;

  JoinCallErrorStates(this.error);
}

class JoinVoiceCallSuccessStates extends HomeAppState {
  // final LoginModel loginModel;

  JoinVoiceCallSuccessStates();
}

class JoinVoiceCallLoadingState extends HomeAppState {}

class JoinVoiceCallErrorStates extends HomeAppState {
  final String error;

  JoinVoiceCallErrorStates(this.error);
}

class EndCallSuccessStates extends HomeAppState {
  // final LoginModel loginModel;

  EndCallSuccessStates();
}

class EndCallLoadingState extends HomeAppState {}

class EndCallErrorStates extends HomeAppState {
  final String error;

  EndCallErrorStates(this.error);
}

class AcceptSuccessStates extends HomeAppState {
  // final LoginModel loginModel;

  AcceptSuccessStates();
}

class AcceptLoadingState extends HomeAppState {}

class AcceptErrorStates extends HomeAppState {
  final String error;

  AcceptErrorStates(this.error);
}

class RefusedSuccessStates extends HomeAppState {
  // final LoginModel loginModel;

  RefusedSuccessStates();
}

class RefusedLoadingState extends HomeAppState {}

class RefusedErrorStates extends HomeAppState {
  final String error;

  RefusedErrorStates(this.error);
}

class SearchSuccessStates extends HomeAppState {
  // final LoginModel loginModel;

  SearchSuccessStates();
}

class DaateModelSuccessStates extends HomeAppState {
  // final LoginModel loginModel;

  DaateModelSuccessStates();
}

class DaateModelErrorStates extends HomeAppState {
  final String error;

  DaateModelErrorStates(this.error);
}

class SearchLoadingState extends HomeAppState {}

class SearchErrorStates extends HomeAppState {
  final String error;

  SearchErrorStates(this.error);
}

class FavourateSuccessStates extends HomeAppState {
  // final LoginModel loginModel;

  FavourateSuccessStates();
}

class FavourateLoadingState extends HomeAppState {}

class FavourateErrorStates extends HomeAppState {
  final String error;

  FavourateErrorStates(this.error);
}
