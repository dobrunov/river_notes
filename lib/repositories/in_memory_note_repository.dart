import '../models/note.dart';
import '../models/note_repository.dart';

class InMemoryNoteRepository implements NoteRepository {
  List<Note> _notes = [];

  @override
  List<Note> getNotes() {
    return _notes;
  }

  @override
  void addNote(Note note) {
    _notes = [..._notes, note];
  }

  @override
  void deleteNote(Note note) {
    _notes = _notes.where((n) => n.id != note.id).toList();
  }

  @override
  void updateNote(Note note) {
    _notes = _notes.map((n) => n.id == note.id ? note : n).toList();
  }
}
