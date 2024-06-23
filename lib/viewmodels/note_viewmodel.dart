import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/note.dart';
import 'package:uuid/uuid.dart';

class NoteViewModel extends StateNotifier<List<Note>> {
  NoteViewModel() : super([]);

  final Uuid uuid = const Uuid();

  void addNote(String title, String content) {
    final newNote = Note(
      id: uuid.v4(),
      title: title,
      content: content,
    );
    state = [...state, newNote];
  }

  void deleteNote(Note note) {
    state = state.where((n) => n.id != note.id).toList();
  }

  void updateNote(Note updatedNote) {
    state = state.map((note) => note.id == updatedNote.id ? updatedNote : note).toList();
  }
}
