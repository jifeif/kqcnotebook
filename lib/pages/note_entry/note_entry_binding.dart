import 'package:get/get.dart';
import 'note_entry_controller.dart';

class NoteEntryBinding extends Bindings {
    @override
    void dependencies() {
    Get.lazyPut<NoteEntryController>(() => NoteEntryController());
    }
}
