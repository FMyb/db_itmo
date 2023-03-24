pi{TeamName}
  (Teams nj
  (pi{TeamId, ContestId}(Teams cjoin Contests)
    ∖ pi{TeamId, ContestId}(sigma{Accepted = 1}(Sessions nj Runs))))
