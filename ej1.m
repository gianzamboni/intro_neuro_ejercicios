A = x' * (y.^3) - y' * (x.^3)
surf(x,y,A)
sumCols = sum(A);
sumRows = sum(A');