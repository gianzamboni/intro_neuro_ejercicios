function [sumRow, sumCol] = ejercicio4(x,y)
    [X,Y] = meshgrid (x,y)
    Z= sin(X).*cos(Y)
    
    surf(X,Y,Z)

    sumRow=sum(Z)
    sumCol=sum(Z')
end