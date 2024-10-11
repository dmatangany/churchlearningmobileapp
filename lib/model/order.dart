import 'dart:ffi';

import '/model/courseModule.dart';
import '/model/tutor.dart';

class Order {
   Tutor? tutor;
   CourseModule? courseModule;
   String? date;
   int? quantity;

  Order({
    this.date,
    this.tutor,
    this.courseModule,
    this.quantity,
  });
}
