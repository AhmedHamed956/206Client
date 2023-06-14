import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/Ui/home/states.dart';

import '../../Models/favourate.dart';
import '../../Models/joinCall_model.dart';
import '../../Models/searchResponse.dart';
import '../../Models/shop_details.dart';
import '../../Models/update_Map_Model.dart';
import '../../Shared/constant.dart';
import '../../network/remote/Dio_helper.dart';
import '../../network/remote/endPoint.dart';

class HomeCubit extends Cubit<HomeAppState> {
  HomeCubit() : super(HomecubitIntialStates());

  static HomeCubit get(context) => BlocProvider.of(context);
  UpdateMapModel? updateMapModel;
  Future<void> updateMap(
      {required String lat, required String long, String? search}) async {
    FormData formData = FormData.fromMap({
      "lat": lat,
      'long': long,
      "branch_name": search,
    });

    DioHelper.postdata(url: home, data: formData, token: token).then((value) {
      print("updateMap : ${value.data}");
      updateMapModel = UpdateMapModel.fromJson(value.data);

      emit(UpdateMapSuccess(response: UpdateMapModel.fromJson(value.data)));
    }).catchError((error) {
      emit(GlobalError(error.toString()));
    });
  }

  ShopDetailsModel? shopDetailsModel;
  Future<void> shopdetails({required String shopId}) async {
    FormData formData = FormData.fromMap({});

    emit(ShopDetailsLoadingState());
    DioHelper.postdata(url: 'branch/$shopId', data: formData, token: token)
        .then((value) {
      shopDetailsModel = ShopDetailsModel.fromJson(value.data);
      print("${value.data}");
      // log("shopDetails ${jsonEncode(value.data)}");
      emit(ShopDetailsSuccessStates());
    }).catchError((error, s) {
      log("shopDetails $error $s");
      emit(ShopDetailsErrorStates(error.toString()));
    });
  }

  FavourateModel? favourateModel;
  Future<void> isfavouate(
      {required String shopId, required String isfavourat}) async {
    FormData formData =
        FormData.fromMap({"branch_id": shopId, 'is_favorite': isfavourat});

    emit(FavourateLoadingState());
    DioHelper.postdata(url: isfavourate, data: formData, token: token)
        .then((value) {
      favourateModel = FavourateModel.fromJson(value.data);
      print("${value.data}");
      // log("shopDetails ${jsonEncode(value.data)}");
      emit(FavourateSuccessStates());
    }).catchError((error, s) {
      // log("shopDetails $error $s");
      emit(FavourateErrorStates(error.toString()));
    });
  }

  // Future<void> suggestSearch(
  //     {required String lat, required String long, String? search}) async {
  //   FormData formData = FormData.fromMap({
  //     "lat": lat,
  //     'long': long,
  //     "branch_name": search,
  //   });

  //   DioHelper.postdata(url: home, data: formData, token: token).then((value) {
  //     print("updateMap : ${value.data}");
  //     updateMapModel = UpdateMapModel.fromJson(value.data);

  //     emit(SearchSuccessStates());
  //   }).catchError((error) {
  //     emit(SearchErrorStates(error.toString()));
  //   });
  // }
  SuggestSearchResponse? searchResponse;

  Future<List<String>> suggestSearch(String search) async {
    FormData formData = FormData.fromMap({
      "name": search,
    });
    await DioHelper.postdata(url: branchsearch, data: formData, token: token)
        .then((value) {
      searchResponse = SuggestSearchResponse.fromJson(value.data);

      // log(value.data);
    }).catchError((error) {
      log(error.toString());
      // emit(GetCountresErrorStates(error.toString()));
    });
    return searchResponse?.data ?? [];
  }

  Future<void> joinCall(
    String shopID,
    String type,
  ) async {
    FormData formData = FormData.fromMap({
      "user_id": userId,
      "shop_id": shopID,
      "type": type,
      // "status": status,
    });
    emit(JoinCallLoadingState());

    await DioHelper.postdata(url: joincall, data: formData, token: token)
        .then((value) {
      print(value.data);
      emit(JoinCallSuccessStates());
    }).catchError((error) {
      log(error.toString());
      emit(JoinCallErrorStates(error.toString()));
    });
  }

  JoinCallModel? joinCallModel;

  Future<void> joinVoiceCall(
    String shopID,
    String type,
  ) async {
    FormData formData = FormData.fromMap({
      "user_id": userId,
      "shop_id": shopID,
      "type": type,
      // "status": status,
    });
    emit(JoinVoiceCallLoadingState());

    await DioHelper.postdata(url: joincall, data: formData, token: token)
        .then((value) {
      print(value.data);
      joinCallModel = JoinCallModel.fromJson(value.data);

      emit(JoinVoiceCallSuccessStates());
    }).catchError((error) {
      log(error.toString());
      emit(JoinVoiceCallErrorStates(error.toString()));
    });
  }

  Future<void> vedioCall(
    String shopID,
    String type,
  ) async {
    FormData formData = FormData.fromMap({
      "user_id": userId,
      "shop_id": shopID,
      "type": type,
      // "status": status,
    });
    emit(JoinCallLoadingState());

    await DioHelper.postdata(url: joincall, data: formData, token: token)
        .then((value) {
      print(value.data);
      joinCallModel = JoinCallModel.fromJson(value.data);
      emit(JoinCallSuccessStates());
    }).catchError((error) {
      log(error.toString());
      emit(JoinCallErrorStates(error.toString()));
    });
  }

  Future<void> endCall(String callID, String time, String end) async {
    FormData formData = FormData.fromMap({
      "call_id": callID,
      "time": time,
      "call_end": end,
    });
    emit(EndCallLoadingState());

    await DioHelper.postdata(url: endcall, data: formData, token: token)
        .then((value) {
      print(value.data);
      emit(EndCallSuccessStates());
    }).catchError((error) {
      log(error.toString());
      emit(EndCallErrorStates(error.toString()));
    });
  }

  Future<void> acceptInovice(
    int orderid,
    String status,
  ) async {
    FormData formData = FormData.fromMap({
      "order_id": orderid,
      "status": status,
    });
    emit(AcceptLoadingState());

    await DioHelper.postdata(url: acceptOrRefused, data: formData, token: token)
        .then((value) {
      print(value.data);
      emit(AcceptSuccessStates());
    }).catchError((error) {
      log(error.toString());
      emit(AcceptErrorStates(error.toString()));
    });
  }

  Future<void> refusedInovice(
    int orderid,
    String status,
  ) async {
    FormData formData = FormData.fromMap({
      "order_id": orderid,
      "status": status,
    });
    emit(RefusedLoadingState());

    await DioHelper.postdata(url: acceptOrRefused, data: formData, token: token)
        .then((value) {
      print(value.data);
      emit(RefusedSuccessStates());
    }).catchError((error) {
      log(error.toString());
      emit(RefusedErrorStates(error.toString()));
    });
  }

  // Future<void> suggestSearch({
  //   required String search,
  //   required String lat,
  //   required String long,
  // }) async {
  //   FormData formData = FormData.fromMap({
  //     "branch_name": search,
  //     "lat": lat,
  //     'long': long,
  //   });
  //   emit(SearchLoadingState());

  //   await DioHelper.postdata(
  //     url: home,
  //     data: formData,
  //     token: token,
  //   ).then((value) {
  //     // updateMapModel = UpdateMapModel.fromJson(value.data);

  //     log(value.data);
  //     emit(SearchSuccessStates());
  //   }).catchError((error) {
  //     log(error.toString());
  //     emit(SearchErrorStates(error.toString()));
  //   });
  // }

  // Future<void> shopdetails({required String shopId}) async {
  //   emit(ShopDetailsLoadingState());

  //   DioHelper.getdata(url: 'branch/73', token: token).then((value) {
  //     print("${value.data}");
  //     shopDetailsModel = ShopDetailsModel.fromJson(value.data);

  //     emit(ShopDetailsSuccessStates());
  //   }).catchError((error) {
  //     emit(ShopDetailsErrorStates(error.toString()));
  //   });
  // }
}
