┌──────────────┐
│    Users     │
├──────────────┤
│ PK user_id   │
│ UQ username  │
│ UQ email     │
│ password     │
│ date_created │
└──────┬───────┘
       │
       │ 1
       │
       │ N
┌──────▼────────────┐
│      Ratings      │
├───────────────────┤
│ PK/FK user_id     │
│ PK/FK movie_id    │
│ rating            │
│ review            │
│ rating_date       │
└────────┬──────────┘
         │ N
         │
         │ 1
┌────────▼──────────┐
│      Movies       │
├───────────────────┤
│ PK movie_id       │
│ title             │
│ overview          │
│ release_date      │
│ runtime           │
│ budget            │
│ revenue           │
│ vote_average      │
│ vote_count        │
└────────┬──────────┘
         │
         │ 1
         │
         │ N
┌────────▼──────────┐
│    MovieGenre     │
├───────────────────┤
│ PK/FK movie_id    │
│ PK/FK genre_id    │
└────────┬──────────┘
         │ N
         │
         │ 1
┌────────▼──────────┐
│      Genres       │
├───────────────────┤
│ PK genre_id       │
│ UQ genre_name     │
└───────────────────┘