
%Inicializamos la pantalla y variables a usar
screenNum=0;
[wPtr,rect]=Screen('OpenWindow',screenNum,0);
Screen('TextFont', wPtr, 'Courier New');
Screen('TextSize', wPtr, 50);
Screen('TextStyle', wPtr, 1+2);

%Colores
black=BlackIndex(wPtr);
white = WhiteIndex(wPtr);
gray = [128 128 128];

%Accesos a pantalla
middlePointY = rect(4)/2;
quarterPointY = middlePointY / 2;
middlePointX = rect(3)/2;
quarterPointX = middlePointX / 2;
octavePointX = quarterPointX / 2;
octavePointY = quarterPointY / 2;

%Coordenadas de objetos
manPosition = [  (3*quarterPointX-52) (middlePointY-118)    (3*quarterPointX+52) (middlePointY + 119)]; %pantalla de elecci�n de sexo
titlePosition = [(middlePointX - 300) (quarterPointY - 100) (middlePointX + 300) (quarterPointY + 100)];  %pantalla de elecci�n de sexo
womanPosition = [(quarterPointX-64)   (middlePointY-118)    (quarterPointX + 63) (middlePointY + 119)]; %pantalla de elecci�n de sexo

puntoDeFijacion = [(middlePointX-10) (middlePointY-10) (middlePointX+10) (middlePointY+10)];

imgLeftPosition = [ (quarterPointX-181)    (middlePointY-245) (quarterPointX+181)   (middlePointY+245)];
imgRightPosition = [(3*quarterPointX-181)  (middlePointY-245) (3*quarterPointX+181) (middlePointY+245)];

% Defino una matriz con las posiciones del cue atencional. Primer fila: Periferico izquierdo, Segunda fila: Periferico derecho, Tercer fila: Neutral
cueCoords = [[(3*octavePointX-28)	(3*octavePointY-28) (3*octavePointX+28)	(3*octavePointY+28)]; 
             [(middlePointX-28)     (middlePointY-28) (middlePointX+28)     (middlePointY+28)]; 
             [(5*octavePointX-28)	(3*octavePointY-28) (5*octavePointX+28)	(3*octavePointY+28)] ];
%Vectoor para el responseCue. Primer fila: Izquierda. Segunda Fila: Derecha
barCoords = [[(middlePointX-60) (middlePointY-10) (middlePointX-20) (middlePointY+10)]; 
             [(middlePointX+20) (middlePointY-10) (middlePointX+60) (middlePointY+10)]];

%Imagenes y nombres de imagenes que voy a usar
[vImg, cantImagenes] = getImagesName('Imagenes');
woman = imread('woman.jpg', 'jpg');
man = imread('man.jpg', 'jpg');
title = imread('titulo.jpg', 'jpg');
explicacion = imread('explicacion.jpg', 'jpg');
%Elementos pertinentes al experimento
fullData = [];
counter = 0 ;
infoInstancia = [];    % [ sexo_sujeto, cue, imgD, imgI, responseCue, Rta, RtaEsperada, Tiempo ]
							% sexo_sujeto = 0 mujer
							%               1 hombre
							% cue =  1 Izquierda
							%        2 Neutral
							%        3 Derecha
							% responseCue =  1 Izquierda
							%                2 Derecha
							% Rta =          1 Botón izquierdo - mujer
							%                3 Botón derecho - hombre



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%% GENRE SCREEN %%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Screen('FillRect',wPtr,gray);  %Pintamos la pantalla de gris
Screen('PutImage', wPtr, title, titlePosition);
Screen('PutImage', wPtr, woman, womanPosition);
Screen('PutImage', wPtr, man, manPosition);
Screen(wPtr, 'Flip');

gender = getGender(wPtr, womanPosition, manPosition);

Screen('FillRect',wPtr,gray);  %Pintamos la pantalla de gris
Screen(wPtr, 'Flip');



Screen('FillRect',wPtr,gray);  %Pintamos la pantalla de gris
Screen('PutImage', wPtr, explicacion, rect);
tiempo = Screen(wPtr, 'Flip');

keyIsDown = 0;
     
while keyIsDown == 0
    [keyIsDown,secs,keyCode] = KbCheck;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%% TRIALS %%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
HideCursor;

while(counter < 160)
	
    
    if(counter == 0)
        strT = 'Primeras pruebas. Presione una tecla para empezar';
        [ny,nx,bbox] = DrawFormattedText(wPtr, strT,'center','center',0);
        %Screen('DrawText', wPtr, strT, nx, ny, [0,0,0,255]);
        Screen(wPtr, 'Flip');
        keyIsDown = 0;
        while keyIsDown == 0
            [keyIsDown,secs,keyCode] = KbCheck;
        end
    elseif counter == 20
        
        strT = 'Ahora si, viene el experimento. Presione una tecla para empezar';
        [ny,nx,bbox] = DrawFormattedText(wPtr, strT,'center','center',0);
        %Screen('DrawText', wPtr, strT, nx, ny, [0,0,0,255]);
        Screen(wPtr, 'Flip');
        keyIsDown = 0;
        while keyIsDown == 0
            [keyIsDown,secs,keyCode] = KbCheck;
        end
    end
    
    if and(mod(counter,40) == 0, counter > 0) 
        showTimer(wPtr)
    end
    
    if counter < 20
        cuePosition = -1;
    else
        cuePosition = randi([1, 3], 1);  %Hacemos random entre 1 y 3 para decidir que cue atencional usar.
    end
    [imgLeft, imgRight] = chooseImages(cantImagenes, 16); %Elegimos la imagenes
    responseCuePosition = getResponseCuePosition(imgLeft, imgRight); %Posicionamos la barra.
    


    %Leemos las imagenes elegidas
	imagenRight = imread(cat(2,'Imagenes/', vImg(imgRight,:)), 'jpg');
	imagenLeft = imread(cat(2,'Imagenes/', vImg(imgLeft,:)), 'jpg');

	% Presentacion del punto de fijacion en el centro de la pantalla
	Screen('FillRect',wPtr,gray);  %Pintamos la pantalla de gris
	Screen('FillOval', wPtr, black, puntoDeFijacion); %Circulo de fijacion en el centro de la pantalla
    tiempo = Screen(wPtr, 'Flip');

    while (GetSecs()-tiempo)< 1
    end

	% Presentacion del Cue atencional periferico 
    if(counter > 20)
        Screen('FillRect',wPtr,gray);  %Pintamos la pantalla de gris
        Screen('FillOval', wPtr, black, puntoDeFijacion); %Circulo de fijacion en el centro de la pantalla
        Screen('FillOval', wPtr, black, cueCoords(cuePosition, :)); %Usamos las coordenadas indicadas por cuePosition (el numero random).
        tiempo = Screen(wPtr, 'Flip');

        % Dura 40 ms
        while (GetSecs()-tiempo)< 0.4 %0.4
        end

    end
    
	%Volvemos a presentar el punto de fijacion durante 60 ms
    Screen('FillRect',wPtr,gray);  %Pintamos la pantalla de gris
	Screen('FillOval', wPtr, black, puntoDeFijacion); %Circulo de fijacion en el centro de la pantalla
    tiempo = Screen(wPtr, 'Flip');

    while (GetSecs()-tiempo)< 0.6 %0.6
    end
	
    % Presentamos las caras durante 500mseg
    Screen('FillRect',wPtr,gray);  %Pintamos la pantalla de gris
	Screen('PutImage', wPtr, imagenLeft, imgLeftPosition);
    Screen('PutImage', wPtr, imagenRight, imgRightPosition);
    Screen('FillOval', wPtr, black, puntoDeFijacion); %Circulo de fijacion en el centro de la pantalla
    tiempo = Screen(wPtr,'Flip');

    while (GetSecs()-tiempo)< 0.5 %0.5
    end
	
    %Volvemos a presentar el punto de fijacion durante 200ms
    Screen('FillRect',wPtr,gray);  %Pintamos la pantalla de gris
	Screen('FillOval', wPtr, black, puntoDeFijacion); %Circulo de fijacion en el centro de la pantalla
	Screen(wPtr, 'Flip');
	
    while (GetSecs()-tiempo)< 0.2 %0.2
    end
    
    % Presentamos la clave para que indique que genero habia en ese lado de la pantalla (barra negra)
    Screen('FillRect',wPtr,gray);  %Pintamos la pantalla de gris
	Screen('FillOval', wPtr, black, puntoDeFijacion); %Circulo de fijacion en el centro de la pantalla
    Screen('FillRect', wPtr, black, barCoords(responseCuePosition,:));
	tiempo = Screen(wPtr,'Flip');

	% dura 300 mseg la presentacion y es el tiempo en el que tiene que
	% repsonder el sujeto
    
    while (GetSecs()-tiempo)< 0.3 %0.3
    end
	
	Screen('FillRect',wPtr,gray);  %Pintamos la pantalla de gris
    Screen('FillOval', wPtr, black, puntoDeFijacion); %Circulo de fijacion en el centro de la pantalla
	tiempo = Screen(wPtr, 'Flip');
	
    keyIsDown = 0;
     
    while and((GetSecs()-tiempo)< 2, keyIsDown == 0)
        [keyIsDown,secs,keyCode] = KbCheck;
    end
	 
    if KbName(keyCode) == 'm'
        answer = 0;
    elseif KbName(keyCode) == 'v'
        answer = 1;
    else
        answer = -1;
    end
    
    %Agregamos al vector de info los datos elegidos
    infoInstancia = makeVector(gender, cuePosition, imgRight, imgLeft, responseCuePosition, answer, tiempo, secs);
    fullData = cat(1, fullData, infoInstancia);
	counter = counter + 1;

end

fullData

Screen('CloseAll');
ShowCursor; 