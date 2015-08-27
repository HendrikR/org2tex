awk -e '
BEGIN { LATEX = 0; IGNORECASE=1; NOPE = 0; }
/^#\+begin_latex/ { LATEX = 1; next; }
/^#\+end_latex/   { LATEX = 0; next; }
/^[*]+ /          { if (length($1) <= NOPE) { NOPE = 0;} }
/^[*]+ NOPE /     { if (NOPE == 0 || length($1) <  NOPE) { NOPE = length($1); } }
/^[*]+ .* :HIDE:/ { if (NOPE == 0 || length($1) <  NOPE) { NOPE = length($1); } }
{
  if (LATEX==1 && NOPE==0) print $0;
  else print "%%%org " $0 "\n";
}
' $1
