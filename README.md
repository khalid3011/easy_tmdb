# **easyTMDB**

easy way to fetch data from THE MOVIE DATABASE

*last update **02.02.2021***

<br /><br />

### **Iinitialize easyTMDB**
<br/>

Collect YOUR ***TMDB*** KEY from [THE MOVIE DB](https://www.themoviedb.org/settings/api)
```dart
  EasyTMDB easyTMDB = EasyTMDB("YOUR TMDB KEY");
```




<br /><br />

# Auth
| Function Name          | Return Type           | Required Perameter | Optional Perameter |
| -------------          | -----------------     | ------------------ | ------------------ |
| requestToken           | RequestTokenResponse  | -----------------  | ------------------ |
| askPermissionUrl       | String*               | String token       | bool autoGenerateToken = false |
| askPermissionWithLogin | CreateSessionResponse | String username, String password, String token  | bool autoGenerateToken = false |
| createSession          | CreateSessionResponse | String token       | ------------------ |
| signIn                 | CreateSessionResponse | String username, String password  | ------------------ |




<br /><br />

# User
| Function Name       | Return Type         | Required Perameter | Optional Perameter  |
| -------------       | -----------------   | ------------------ | ------------------- |
| userDetails         | UserDetails         | String sessionId   | ------------------- |
| userCreatedList     | UserCreatedList     | String sessionId   | int page, String language |
| userFavoriteMovie   | UserFavoriteMovie   | String sessionId   | int page, String language, String sortBy, |
| userFavoriteTv      | UserFavoriteTv      | String sessionId   | int page, String language, String sortBy  |
| userRatedMovie      | UserRatedMovie      | String sessionId   | int page, String language, String sortBy  |
| userRatedTvShows    | UserRatedTvShow     | String sessionId   | int page, String language, String sortBy  |
| userMovieWatchlist  | UserMovieWatchList  | String sessionId   | int page, String language, String sortBy  |
| userTvWatchlist     | UserTvWatchList     | String sessionId   | int page, String language, String sortBy  |





<br /><br />

# Movie
| Function Name     | Return Type        | Required Perameter | Optional Perameter |
| -------------     | -----------------  | ------------------ | ------------------ |
| image             | MovieImage         | int movieId        | ------------------ |
| credits           | MovieCredits       | int movieId        | ------------------ |
| details           | MovieDetails       | int movieId        | String language |
| similar           | MovieSimilar       | int movieId    | int page: 1, String language, bool random: false|
| topRated          | MovieTopRated      | ----------- | int page: 1, String language, bool random: false |
| popular           | MoviePopular       | ----------- | int page: 1, String language, bool random: false |
| upcoming          | MovieUpcoming      | ----------- | int page: 1, String language, bool random: false |
| latest            | MovieLatest        | ----------- | String language |
| latestWithMore    | List\<MovieDetails>| int movieId        | bool validImagePath, int items |
| detailsWithMore   | List\<MovieDetails>| int startMovieId   | String language, int endMovieId, int items, bool validImagePath = false, bool decrement = true, bool adult = false |
| nowPlaying        | MovieNowPlaying    | ----------- | int page: 1, String language, bool random: false |
| video             | Video              | int movieId        | ------------------ |


   


<br /><br />

# Tv
| Function Name     | Return Type        | Required Perameter | Optional Perameter |
| -------------     | -----------------  | ------------------ | ----------- |
| image             | TvImage            | int tvId           | ----------- |
| credits           | TvCredits          | int tvId           | ----------- |
| details           | TvDetails          | int tvId           | String language |
| similar           | TvSimilar          | int tvId           | int page: 1, String language, bool random: false |
| topRated          | TvTopRated         | -----------        | int page: 1, String language, bool random: false |
| popular           | TvPopular          | -----------        | int page: 1, String language, bool random: false |
| latest            | TvLatest           | -----------        | String language |
| latestWithMore    | List\<TvDetails>   | -----------        | bool validImagePath, int items |
| detailsWithMore   | List\<TvDetails>   | int startTvId | int endTvId, int items, bool validImagePath = false, bool decrement = true |
| onTheAir          | TvOnTheAir         | -----------        | int page: 1, String language, bool random: false |
| airingToday       | TvAiringToday      | -----------        | int page: 1, String language, bool random: false |
| video             | Video              | int tvId           | ----------- |
  




<br /><br />

# Seasons
| Function Name      | Return Type    | Required Perameter              | Optional Perameter |
| -------------      | -----------    | ----------------------------    | ------------------ |
| Seasons            | Season         | int tvId, int seasonNumber      | String language    |
| detailsAllSeason   | List\<Season>  | int tvId, int totalSeasonNumber | String language    |




<br /><br />

# Episode
| Function Name | Return Type        | Required Perameter                            | Optional Perameter |
| ------------- | -----------------  | -------------------------------------         | ------------------ |
| details       | SeasonEpisodes     | int tvId, int seasonNumber, int episodeNumber | String language    |




<br /><br />

# Peoples
| Function Name | Return Type        | Required Perameter | Optional Perameter        |
| ------------- | -----------------  | ------------------ | ------------------------- |
| details       | PeopleDetails      | int personId       | ------------------------- |
| image         | PeopleImage        | int personId       | ------------------------- |
| movieCredits  | PeopleMovieCredits | int personId       | ------------------------- |
| tvCredits     | PeopleTvCredits    | int personId       | ------------------------- |
| popular       | PeoplePopular      | ------------------ | int page, String language |





<br /><br />

# Trending
| Function Name | Return Type        | 
| ------------- | -----------------  | 
| movieDay      | TrendingMovie      | 
| movieWeek     | TrendingMovie      | 
| tvDay         | TrendingTv         | 
| tvWeek        | TrendingTv         | 
| allDay        | TrendingAll        | 
| allWeek       | TrendingAll        |





<br /><br />

# Search
| Function Name | Return Type        | Required Perameter | Optional Perameter |
| ------------- | -----------------  | ------------------ | ----------- |
| movie | SearchMovie | String query | String language, int page, bool includeAdult, String region, int year, int primaryReleaseYear |
| tv            | SearchTv           | String query       | String language, int page, bool includeAdult, int firstAirDateYear |
| people        | SearchPeople       | String query       | String language, int page, bool includeAdult, String region |
| company       | SearchCompany      | String query       | int page |
| keyword       | SearchKeyword      | String query       | int page |
| collection    | SearchCollections  | String query       | String language, int page |
| multi         | SearchMulti        | String query       | String language, int page, bool includeAdult, String region |





<br /><br />

# FindExternal
| Function Name | Return Type | Required Perameter                   | 
| ------------- | ----------- | ----------------------------------   | 
| externalItem  | Find        | String id, String externalSourceName |





<br /><br />

# Discover
| Function Name | Return Type        | Required Perameter         | 
| ------------- | -----------------  | -------------------------  | 
| movie         | DiscoverMovie      | Map\<String, dynamic> data | 
| tv            | DiscoverTv         | Map\<String, dynamic> data | 





<br /><br />

# Genre
| Function Name     | Return Type          | 
| -------------     | -----------------    | 
| movie             | Genres               | 
| tv                | Genres               | 
| movieWithoutFetch | List\<GenreDetails>  | 
| tvWithoutFetch    | List\<GenreDetails>  | 




<br /><br />

# ImageSize
| Function Name | Return Type                                  |
| ------------- | --------------------------------------       |
| posterSize    | w92, w154, w185, w500, w780, original        |
| logoSize      | w45, w92, w154, w185, w300, w500, original   | 
| backdropSize  | w185, w300, w780, original                   | 
| profileSize   | w45, w185, w632, original                    | 
| stillSize     | w92, w185, w300, original                    | 



# How to user
```dart
   easyTMDB.movie().popular().then((value) {
      print(value.toJson());
   });
``` 