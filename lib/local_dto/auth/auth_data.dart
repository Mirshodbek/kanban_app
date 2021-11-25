import 'package:hive/hive.dart';
import 'package:kanban_app/constants/constants.dart';
part 'auth_data.g.dart';
@HiveType(typeId: Constants.typeIdAuthData)
class AuthData extends HiveObject {
  @HiveField(0)
  final String? username;
  @HiveField(1)
  final String? password;
  @HiveField(2)
  final String? token;

  AuthData({
    this.username,
    this.password,
    this.token,
  });
}
