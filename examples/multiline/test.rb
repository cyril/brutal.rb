# Brutal test suite

# ------------------------------------------------------------------------------

actual = begin
  # This is a useless comment.
  -42.abs
end

raise unless actual.to_s == "42"

# ------------------------------------------------------------------------------

actual = begin
  # This is a useless comment.
  -42.-(2)
end

raise unless actual.to_s == "-44"
