function [imgLeft, imgRight] = chooseImages(cantImagenes, separador)
    imgRight = randi([1, cantImagenes], 1); %Random para decidir que imagen poner a la derecha
    imgLeft = randi([1, cantImagenes], 1); %Random par decidir que imagen poner a la izquierda
	if(imgRight > separador)
        imgLeft = randi([1, separador], 1);
    else
        while imgLeft == imgRight
            imgLeft = randi([1, cantImagenes], 1);
        end
	end
end

