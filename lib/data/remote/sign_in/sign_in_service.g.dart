// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BodyParam _$BodyParamFromJson(Map<String, dynamic> json) => BodyParam(
      firebaseToken: json['firebase_token'] as String,
    );

Map<String, dynamic> _$BodyParamToJson(BodyParam instance) => <String, dynamic>{
      'firebase_token': instance.firebaseToken,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _SignInService implements SignInService {
  _SignInService(this._dio, {this.baseUrl}) {
    baseUrl ??= 'http://103.221.220.249:9000/api';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<SignInResponse> signIn(bodyParam) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(bodyParam.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<SignInResponse>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/user/signin',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = SignInResponse.fromJson(_result.data!);
    return value;
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
}
