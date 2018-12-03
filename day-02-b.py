import sys
from itertools import product

def num_diffs(a, b):
    return sum(ai != bi for ai, bi in zip(a, b))

box_ids = [bi.strip() for bi in sys.stdin]

for bi1, bi2 in product(box_ids, box_ids):
    if num_diffs(bi1, bi2) == 1:
        print(bi1, bi2)