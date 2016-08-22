function [sumRow, sumCol] = ejercicio7(x,y)
    [X,Y] = meshgrid (x,y)
    sizeX = size(x)(2);
    sizeY = size(y)(2);
    Z = zeros(sizeX,sizeY))
    c = 0
    while c <= sizeX
        d = 0
        while d <= sizeY
          if X(c,d)*Y(c,d) > 0
              Z(c,d) = X(c,d)*Y(c,d)^3 - (X(c,d)^3)*Y(c,d)
          else
            Z(c,d) = 0
          end
           d = d + 1
        end
        c = c + 1
    end
%     
%     for c = 1:sizeX
%        for d = 1:sizeY
%           if X(c,d)*Y(c,d) > 0
%               Z(c,d) = X(c,d)*Y(c,d)^3 - (X(c,d)^3)*Y(c,d)
%           else
%               Z(c,d) = 0
%        end
%     end
    
    surf(X,Y,Z)

    sumRow=sum(Z)
    sumCol=sum(Z')
end