class Constant {
    static const List<Map<String, String>> trendingFilter = [
      {'name': 'Day', 'value': 'day'},
      {'name': 'This Week', 'value': 'week'}
    ] ;

    static const List<Map<String, String>> popularFilter = [
      {'name': 'Movies', 'value': 'fetchMovie'},
      {'name': 'Tv Shows', 'value': 'fetchTvShows'}
    ];

    static const List<Map<String , String>> tvFilter = [
      {'name':'Popular', 'value': 'popular'},
      {'name': 'Airing Today', 'value': 'airing_today'},
      {'name': 'On Tv', 'value': 'on_the_air'},
      {'name': 'Top Rated', 'value': 'top_rated'}
    ];

    static const List<Map<String, String>> movieFilter = [
      {'name':'Popular', 'value': 'popular'},
      {'name': 'Now Playing', 'value': 'now_playing'},
      {'name': 'Upcoming', 'value': 'upcoming'},
      {'name': 'Top Rated', 'value': 'top_rated'}
    ];
}