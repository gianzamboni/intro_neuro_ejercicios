
[X,Y] = meshgrid (x,y)
Z= sin(X).*cos(Y)

surf(X,Y,Z)

sumrow=sum(Z)
sumcol=sum(Z')