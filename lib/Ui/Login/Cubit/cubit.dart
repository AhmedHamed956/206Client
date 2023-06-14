import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/Models/check_blockUser.dart';
import 'package:project/Ui/Login/Cubit/states.dart';
import 'package:project/Ui/home/home_screen.dart';

import '../../../Models/user_Model.dart';
import '../../../Shared/constant.dart';
import '../../../components/component.dart';
import '../../../network/local/cache-helper.dart';
import '../../../network/remote/Dio_helper.dart';
import '../../../network/remote/endPoint.dart';

import '../otp_Screen.dart';

class LoginScreenCubit extends Cubit<LoginAppStates> {
  LoginScreenCubit() : super(LogincubitIntialStates());

  static LoginScreenCubit get(context) => BlocProvider.of(context);

  // LoginModel loginModel;

  Future<void> userlogin({@required phone, context}) async {
    FormData formData = FormData.fromMap({
      "phone": phone,

      // "device_token": user.deviceToken
    });
    emit(ShopLoginLoadingState());

    DioHelper.postdata(url: Login, data: formData).then((value) {
      print(value.data);
      // loginModel = LoginModel.fromjason(value.data);

      emit(ShopLoginSuccessStates());
      print(value.data.hashCode);
    }).catchError((error) {
      emit(ShopLoginErrorStates(error.toString()));
    });
  }

  CheckBlockModel? checkBlockModel;

  Future<void> checkBlock({required phone}) async {
    FormData formData = FormData.fromMap({
      "phone": phone,

      // "device_token": user.deviceToken
    });
    emit(CheckBlockLoadingState());

    DioHelper.postdata(url: check_Block, data: formData).then((value) {
      print(value.data);
      checkBlockModel = CheckBlockModel.fromJson(value.data);

      emit(CheckBlockSuccessStates());
    }).catchError((error) {
      emit(CheckBlockErrorStates(error.toString()));
    });
  }

  Future<void> userlogOut() async {
    FormData formData = FormData.fromMap({
      "user_id": userId,

      // "device_token": user.deviceToken
    });
    emit(ShopLogOutLoadingState());

    DioHelper.postdata(url: Logout, data: formData).then((value) {
      print(value.data);
      // loginModel = LoginModel.fromjason(value.data);

      emit(ShopLogOutSuccessStates());
    }).catchError((error) {
      emit(ShopLogOutErrorStates(error.toString()));
    });
  }

  // UserResponse? userResponse;

  UserModel? userModel;
  Future<void> checkOtp({
    @required code,
    context,
    required String fcmToken,
    required String phone,
  }) async {
    FormData formData =
        FormData.fromMap({"otp": code, 'fcm_token': fcmToken, 'phone': phone});
    emit(CheckOtpLoadingState());

    DioHelper.postdata(url: check_otp, data: formData).then((value) {
      print(value.data);
      userModel = UserModel.fromJson(value.data);

      emit(CheckOtpSuccessStates());
      CacheHelper.saveData(key: 'fcm_token', value: fcmToken);
      CacheHelper.saveData(key: 'userId', value: userModel?.data?.id)
          .then((value) => userId = CacheHelper.getData(key: 'userId'));
      CacheHelper.saveData(key: 'username', value: userModel?.data?.name);
      CacheHelper.saveData(key: 'userphone', value: userModel?.data?.phone);
      CacheHelper.saveData(key: 'userEmail', value: userModel?.data?.email);
      CacheHelper.saveData(key: 'avatar', value: userModel?.data?.image);
      CacheHelper.saveData(key: 'token', value: userModel?.data?.token)
          .then((value) => token = CacheHelper.getData(key: 'token'));
      // }
    }).catchError((error) {
      emit(CheckOtpErrorStates(error.toString()));
    });
  }
  // Future<void> checkOtp(
  //     {@required code, context, required String fcmToken}) async {
  //   FormData formData = FormData.fromMap({"otp": code, 'fcm_token': fcmToken});
  //   emit(CheckOtpLoadingState());

  //   DioHelper.postdata(url: check_otp, data: formData).then((value) {
  //     log("checkOtp ${jsonEncode(value.data)}");

  //     userModel = UserModel.fromJson(value.data);
  //     print(value.data);
  //     // DioHelper.getdata(url: checkIsRep, token: userResponse!.token)
  //     //     .then((check) {
  //     //   log("checkIsRepresentative ${jsonEncode(check.data)}");

  //     //   CheckIsRepresentativeModel checkRepresentative =
  //     //       CheckIsRepresentativeModel.fromJson(check.data);

  //       emit(CheckOtpSuccessStates(
  //           // user: userResponse!,
  //           // type: checkRepresentative.data?.isRepresentative));
  //       CacheHelper.saveData(key: 'fcm_token', value: fcmToken);
  //       CacheHelper.saveData(
  //           key: 'userId', value: userModel.data?.id);
  //       CacheHelper.saveData(key: 'username', value: userModel.data?.name);
  //       CacheHelper.saveData(
  //           key: 'userphone', value: userModel.data?.phone);
  //       CacheHelper.saveData(
  //           key: 'userEmail', value: userModel.data?.email);
  //       CacheHelper.saveData(key: 'avatar', value: userModel.data?.image );
  //       CacheHelper.saveData(key: 'token', value:  userModel.data?.token)
  //           .then((value) => token = CacheHelper.getData(key: 'token'));
  //     // }).catchError((error, s) {
  //     //   // showSnackBar(
  //     //   //     title: langKey == 'ar'
  //     //   //         ? "كود التفعيل غير صحيح"
  //     //   //         : "incorrect otp code");
  //     //   log("checkOtp $error $s");
  //     //   emit(CheckOtpErrorStates(error.toString()));
  //     // });
  //   // }).catchError((error, s) {
  //   //   log("checkOtp $error $s");
  //   //   emit(CheckOtpErrorStates(error.toString()));
  //   // });
  //     });

  // }
}
