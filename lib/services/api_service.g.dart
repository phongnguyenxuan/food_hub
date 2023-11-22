// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _APIService implements APIService {
  late Dio _dio;
  late HiveService _hiveService;
  _APIService({this.baseUrl}) {
    baseUrl ??= 'https://common-api-v1.vercel.app/';
    _dio = Dio();
    _hiveService = HiveService();
    _dio.interceptors.add(QueuedInterceptorsWrapper(
      onRequest: (options, handler) async {
        String? token = _hiveService.getAccessToken();
        if (token != null && token != '') {
          // options.headers['Authorization'] = "Bearer $token";
          options.headers['Authorization'] = "Bearer $token";
        }
        return handler.next(options);
      },
      onError: (e, handler) async {
        print("error fetch api: $e");
        if (e.response?.statusCode == 401) {
          refreshToken(e, handler);
          // print("helllo my fire");
        }
        // return handler.next(e);
      },
    ));
  }

  String? baseUrl;

  Future<void> refreshToken(
      DioException e, ErrorInterceptorHandler handler) async {
    try {
      String? refreshToken = _hiveService.getRefreshToken();
      final Map<String, dynamic> _data = <String, dynamic>{};
      _data.addAll({
        "refresh_token": refreshToken,
      });
      await _dio
          .post("$baseUrl$refreshTokenPath", data: _data)
          .then((value) async {
        if (value.statusCode == 200) {
          Map<String, dynamic>? map = value.data;
          Map<String, dynamic> results = map?["results"];
          String newToken = results["token"];
          _hiveService.updateToken(newToken);
          e.requestOptions.headers["Authorization"] = "Bearer $newToken";
          _dio
              .request(e.requestOptions.path,
                  options: Options(
                      method: e.requestOptions.method,
                      headers: e.requestOptions.headers))
              .then((res) {});
        }
        logOut();
      });
      // if (res.statusCode == 200) {
      //   Map<String, dynamic>? map = res.data;
      //   Map<String, dynamic> results = map?["results"];
      //   String newToken = results["token"];
      //   print("new token $newToken");
      //   _hiveService.updateToken(newToken);
      //   e.requestOptions.headers["Authorization"] = "Bearer $newToken";
      //   print("path ${e.requestOptions.path}");
      //   final clonereq = await _dio.request(
      //     "$baseUrl${e.requestOptions.path}",
      //     options: Options(
      //       method: "GET",
      //       headers: e.requestOptions.headers
      //     )
      //   );
      //   print("fffffsss ${clonereq.headers}");
      //   return handler.resolve(clonereq);
      // }
      // logOut();
    } on DioException catch (_) {
      print("heheheheheh $_");
      logOut();
      return handler.reject(e);
    }
  }

  @override
  Future<UserModel?> signIn(
    String email,
    String password,
    BuildContext context,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data.addAll({"email": email, "password": password});
    try {
      final _result = await _dio
          .fetch<Map<String, dynamic>>(_setStreamType<UserModel>(Options(
        method: 'POST',
        headers: _headers,
        extra: _extra,
      )
              .compose(
                _dio.options,
                'user/sign-in',
                queryParameters: queryParameters,
                data: _data,
              )
              .copyWith(
                  baseUrl: _combineBaseUrls(
                _dio.options.baseUrl,
                baseUrl,
              ))));
      if (_result.statusCode == 200) {
        final respo = RespoModel.fromJson(_result.data!);
        final value = UserModel.fromJson(respo.results!);
        _hiveService.updateToken(value.token);
        _hiveService.updateRefreshToken(value.refreshToken);
        print("hello sigin in ${value.refreshToken}");
        _hiveService.updateUserID(value.id);
        return value;
      }
      return null;
    } on DioException catch (e) {
      final respo = RespoModel.fromJson(e.response!.data);
      if (context.mounted) {
        showMessage(respo.msg!, context);
      }
      return null;
    }
  }

  @override
  Future<UserModel?> signUp(
    String userName,
    String email,
    String password,
    BuildContext context,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data.addAll({
      "user_name": userName,
      "email": email,
      "password": password,
    });
    try {
      final _result = await _dio
          .fetch<Map<String, dynamic>>(_setStreamType<UserModel>(Options(
        method: 'POST',
        headers: _headers,
        extra: _extra,
      )
              .compose(
                _dio.options,
                'user/sign-up',
                queryParameters: queryParameters,
                data: _data,
              )
              .copyWith(
                  baseUrl: _combineBaseUrls(
                _dio.options.baseUrl,
                baseUrl,
              ))));
      await sendVerification(email);
      final result = RespoModel.fromJson(_result.data!);
      final value = UserModel.fromJson(result.results!);
      _hiveService.updateToken(value.token);
      _hiveService.updateRefreshToken(value.refreshToken);
      _hiveService.updateUserID(value.id);
      if (context.mounted) {
        Navigator.of(context).pushNamedAndRemoveUntil(
            VerifyScreen.id, ModalRoute.withName(VerifyScreen.id));
      }
      return value;
    } on DioException catch (e) {
      EasyLoading.dismiss();
      final respo = RespoModel.fromJson(e.response!.data);

      if (context.mounted) {
        showMessage(respo.msg!, context);
      }
      return null;
    }
  }

  @override
  Future<void> logOut() async {
    _hiveService.removeReToken();
    _hiveService.removeToken();
    _hiveService.removeUserID();
  }

  @override
  Future<UserModel?> getProfile() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    try {
      String? id = _hiveService.getUserID();
      final _result = await _dio
          .fetch<Map<String, dynamic>>(_setStreamType<UserModel>(Options(
        method: 'GET',
        headers: _headers,
        extra: _extra,
      )
              .compose(
                _dio.options,
                'user/profile?id=$id',
                queryParameters: queryParameters,
                // data: _data,
              )
              .copyWith(
                  baseUrl: _combineBaseUrls(
                _dio.options.baseUrl,
                baseUrl,
              ))));
      final respo = RespoModel.fromJson(_result.data!);
      final value = UserModel.fromJson(respo.results!);
      return value;
    } on DioException catch (_) {
      return null;
    }
  }

  @override
  Future<void> sendVerification(
    String email,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data.addAll({"email": email});
    EasyLoading.show();
    await _dio.fetch<void>(_setStreamType<void>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'mail/send-verification-code',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        ))));
    EasyLoading.dismiss();
  }

  @override
  Future<void> verification(String code, BuildContext context) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data.addAll({"code": code});
    try {
      EasyLoading.show();
      final _respo = await _dio.fetch<void>(_setStreamType<void>(Options(
        method: 'POST',
        headers: _headers,
        extra: _extra,
      )
          .compose(
            _dio.options,
            'mail/verify-code',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(
              baseUrl: _combineBaseUrls(
            _dio.options.baseUrl,
            baseUrl,
          ))));
      if (_respo.statusCode == 200 && context.mounted) {
        Navigator.of(context).pushNamedAndRemoveUntil(
            MainScreen.id, ModalRoute.withName(MainScreen.id));
      }
      EasyLoading.dismiss();
    } on DioException catch (e) {
      EasyLoading.dismiss();
      final respo = RespoModel.fromJson(e.response!.data);
      if (context.mounted) {
        showMessage(respo.msg!, context);
      }
    }
  }

  // FOOD HUB
  @override
  Future<List<CategoriesModel>?> getCategories() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    try {
      final _result = await _dio.fetch<Map<String, dynamic>>(
          _setStreamType<List<CategoriesModel>>(Options(
        method: 'GET',
        headers: _headers,
        extra: _extra,
      )
              .compose(
                _dio.options,
                'food-hub/categories',
                queryParameters: queryParameters,
                // data: _data,
              )
              .copyWith(
                  baseUrl: _combineBaseUrls(
                _dio.options.baseUrl,
                baseUrl,
              ))));
      List l = _result.data!['result'];
      List<CategoriesModel> listCate = [];
      for (var element in l) {
        CategoriesModel c = CategoriesModel.fromJson(element);
        listCate.add(c);
      }
      return listCate;
    } on DioException catch (_) {
      return null;
    }
  }

  showMessage(String code, BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return ShowMessage(code: code);
      },
    );
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(
    String dioBaseUrl,
    String? baseUrl,
  ) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }

  @override
  Future<List<RestaurantsModel>?> getRestaurants() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    try {
      final _result = await _dio.fetch<Map<String, dynamic>>(
          _setStreamType<List<RestaurantsModel>>(Options(
        method: 'GET',
        headers: _headers,
        extra: _extra,
      )
              .compose(
                _dio.options,
                'food-hub/restaurants',
                queryParameters: queryParameters,
                // data: _data,
              )
              .copyWith(
                  baseUrl: _combineBaseUrls(
                _dio.options.baseUrl,
                baseUrl,
              ))));
      List l = _result.data!['result'];
      List<RestaurantsModel> listRes = [];
      for (var element in l) {
        RestaurantsModel r = RestaurantsModel.fromJson(element);
        listRes.add(r);
      }
      return listRes;
    } on DioException catch (_) {
      return null;
    }
  }

  @override
  Future<RestaurantModel?> getRestaurantDetail(String id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    try {
      EasyLoading.show();
      final _result = await _dio
          .fetch<Map<String, dynamic>>(_setStreamType<RestaurantModel>(Options(
        method: 'GET',
        headers: _headers,
        extra: _extra,
      )
              .compose(
                _dio.options,
                'food-hub/restaurant?id=$id',
                queryParameters: queryParameters,
                // data: _data,
              )
              .copyWith(
                  baseUrl: _combineBaseUrls(
                _dio.options.baseUrl,
                baseUrl,
              ))));
      EasyLoading.dismiss();
      final value = RestaurantModel.fromJson(_result.data?['result']);
      return value;
    } on DioException catch (_) {
      return null;
    }
  }
  
  @override
  Future<DishModel?> getDishDetail(String id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    try {
      EasyLoading.show();
      final _result = await _dio
          .fetch<Map<String, dynamic>>(_setStreamType<DishModel>(Options(
        method: 'GET',
        headers: _headers,
        extra: _extra,
      )
              .compose(
                _dio.options,
                'food-hub/dish?id=$id',
                queryParameters: queryParameters,
                // data: _data,
              )
              .copyWith(
                  baseUrl: _combineBaseUrls(
                _dio.options.baseUrl,
                baseUrl,
              ))));
      EasyLoading.dismiss();
      final value = DishModel.fromJson(_result.data?['result']);
      return value;
    } on DioException catch (_) {
      return null;
    }
  }
}
