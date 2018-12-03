import sys
from itertools import groupby

twos = 0
threes = 0
for line in sys.stdin:
    sort_line = sorted(line)
    counts = {len(list(gs)) for g, gs in groupby(sort_line)}
    if 2 in counts:
        twos += 1
    if 3 in counts:
        threes += 1

print(twos * threes)
