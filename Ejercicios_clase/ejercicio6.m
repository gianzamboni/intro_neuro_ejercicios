function [sumRow, sumCol] = ejercicio6(x,y)
    [X,Y] = meshgrid (x,y)
    sizeX = size(x)(2);
    sizeY = size(y)(2);
    Z = zeros(sizeX,sizeY))
    for c = 1:sizeX
       for d = 1:sizeY
          if X(c,d)*Y(c,d) > 0
              Z(c,d) = X(c,d)*Y(c,d)^3 - (X(c,d)^3)*Y(c,d)
          else
              Z(c,d) = 0
       end
    end
    
    surf(X,Y,Z)

    sumRow=sum(Z)
    sumCol=sum(Z')
end