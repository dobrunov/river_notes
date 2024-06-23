import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'note.dart';

final notesProvider = StateNotifierProvider<NotesNotifier, List<Note>>((ref) {
  return NotesNotifier();
});

class NotesNotifier extends StateNotifier<List<Note>> {
  NotesNotifier() : super([]);

  void addNote(Note note) {
    state = [...state, note];
  }

  void deleteNote(Note note) {
    state = state.where((n) => n.id != note.id).toList();
  }

  void updateNote(Note updatedNote) {
    state = state.map((note) => note.id == updatedNote.id ? updatedNote : note).toList();
  }
}
