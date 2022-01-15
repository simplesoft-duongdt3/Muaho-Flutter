import '../../../../common/object_parse_ext.dart';

class GiftManagementResponse {
    final String? id;

    GiftManagementResponse({
        required this.id,
    });

    factory GiftManagementResponse.fromJson(Map<String, dynamic> json) {
        return GiftManagementResponse(
            id: json.parseString('id'),
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = {};
        data['id'] = id;
        return data;
    }
}