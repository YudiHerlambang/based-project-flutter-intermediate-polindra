abstract class DetailClubState {}

class DetailClubStateSuccess extends DetailClubState {
  final bool? isFavorite;

  DetailClubStateSuccess(this.isFavorite);
}

class DetailClubStateIdle extends DetailClubState {}

class DetailClubStateLoading extends DetailClubState {}

class DetailClubStateError extends DetailClubState {}
