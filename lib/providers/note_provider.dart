import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/note.dart';
import '../models/note_repository.dart';
import '../viewmodels/note_viewmodel.dart';
import '../repositories/in_memory_note_repository.dart';

final noteRepositoryProvider = Provider<NoteRepository>((ref) {
  return InMemoryNoteRepository();
});

final notesProvider = StateNotifierProvider<NoteViewModel, List<Note>>((ref) {
  final repository = ref.watch(noteRepositoryProvider);
  return NoteViewModel(repository);
});
