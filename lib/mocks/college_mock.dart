import 'package:findu_developing_testing/models/college.dart';

mixin MockCollege {
  static final List<College> items = [
    College(name: 'Harvard University', city: 'Cambridge', state: 'Massachusetts'),
    College(name: 'Stanford University', city: 'Stanford', state: 'Massachusetts'),
    College(name: 'Massachusetts Institute of Technology', city: 'Cambridge', state: 'Massachusetts'),
  ];

  static College fetchAny() {
    return MockCollege.items[0];
  }

  static List<College> fetchAll() {
    return MockCollege.items;
  }

  static College fetch(int index) {
    return MockCollege.items[index];
  }
}
