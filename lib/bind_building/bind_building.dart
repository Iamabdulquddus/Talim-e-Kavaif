import 'package:get/get.dart';

import '../controllers/resume_controller.dart';

class BindBuilding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    print("calling controllers");

    Get.lazyPut<ResumeController>(
      () => ResumeController(),
    );
  }
}
