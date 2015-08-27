BEGIN {
  done = 0;
  pend = 0;
  todo = 0;
  nope = 0;
  lines = 0
  chars = 0
}
/^\*+ DONE/ { done += 1; }
/^\*+ TODO/ { todo += 1; }
/^\*+ PEND/ { pend += 1; }
/^\*+ NOPE/ { nope += 1; }
/^[[:space:]]*[%]/ {
  next; # ignore comment lines
}
/^[*#]/ {
  next; # ignore org lines
}
// {
  lines += 1
  chars += length($0)
}

END {
  printf("%d,%d,%d,%d,%d,%d\n", lines, chars, todo, pend, done, nope);
}
