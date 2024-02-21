import 'package:findu_developing_testing/models/user.dart';

mixin MockUser {
  static final List<User> items = [
    User(
        name: 'Kenny Morales',
        city: 'Grand Island',
        state: 'NE',
        satScore: 1400,
        desiredCollegeSize: 2000),
  ];

  static User fetchAny() {
    return MockUser.items[0];
  }

  static User fetch(int index) {
    return MockUser.items[index];
  }
}
