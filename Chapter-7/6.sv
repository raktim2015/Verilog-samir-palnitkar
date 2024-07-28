This is a problem of intra-assignment delays

a = #delay (b+c)
    It means take the value of b, c and evaluate (b+c) at time 0, then wait delay time units to assign the result

Time        values
0           b=1, c=0, d=X
10          b=0, c=0, d=X
25          b=0, c=0, d=1