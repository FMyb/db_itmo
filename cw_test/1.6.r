pi{TeamName}
  (pi{TeamId, TeamName, ContestId}(Teams nj Sessions)
  ∖ pi{TeamId, TeamName, ContestId}(sigma{Accepted = 1}(Teams nj Sessions nj Runs)))
