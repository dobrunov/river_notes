import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/note.dart';
import '../viewmodels/note_viewmodel.dart';

final notesProvider = StateNotifierProvider<NoteViewModel, List<Note>>((ref) {
  return NoteViewModel();
});
