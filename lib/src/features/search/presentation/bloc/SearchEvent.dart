abstract class SearchEvent {}

class SearchQueryChanged extends SearchEvent {
  final String query;
  final String filter;

  SearchQueryChanged(this.query, this.filter);
}
