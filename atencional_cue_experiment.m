
%Inicializamos la pantalla y variables globales
screenNum=0;
[wPtr,rect]=Screen('OpenWindow',screenNum,0, [0,0,1024,1000]);

Screen('TextFont', wPtr, 'Courier New');
Screen('TextSize', wPtr, 200);
Screen('TextStyle', wPtr, 1+2);


black=BlackIndex(wPtr);
white = WhiteIndex(wPtr);
gray = [128 128 128];

middlePointY = rect(4)/2;
quarterPointY = middlePointY / 2;
middlePointX = rect(3)/2;
quarterPointX = middlePointX / 2;
octavePointX = quarterPointX / 2;
octavePointY = quarterPointY / 2;

[vImg, cantImagenes] = getImagesName('Imagenes');

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
woman = imread('woman.jpg', 'jpg');
man = imread('man.jpg', 'jpg');
title = imread('titulo.jpg', 'jpg');

titlePosition = [(middlePointX - 300) (quarterPointY - 100) (middlePointX + 300) (quarterPointY + 100)];
womanPosition = [(quarterPointX-64) (middlePointY-118) (quarterPointX + 63) (middlePointY + 119)];
manPosition = [(3*quarterPointX-52) (middlePointY-118) (3*quarterPointX+52) (middlePointY + 119)];
Screen('FillRect',wPtr,gray);  %Pintamos la pantalla de gris
Screen('PutImage', wPtr, title, titlePosition);
Screen('PutImage', wPtr, woman, womanPosition);
Screen('PutImage', wPtr, man, manPosition);
Screen(wPtr, 'Flip');

buttons = [0 0 0];
responseTime = 0;
gender = -1;
while not(and(any(buttons), gender >= 0))  % Espera repuesta del mouse durante un tiempo acotado, sino sigue.
	[x,y,buttons] = GetMouse(wPtr);
	if any(buttons)
		if and(and(x > (quarterPointX - 64), x < (quarterPointX + 63)), and(y > (middlePointY-118), y < (middlePointY+119)))
			gender = 0;
		elseif and(and(x > (3*quarterPointX-52), x < (3*quarterPointX+52)), and(y > (middlePointY-118), y < (middlePointY+119)))
			gender = 1;
		end
	end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%% TRIALS %%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
HideCursor;
while(counter < 50)

	if(and(mod(counter,40) == 0, not(counter==0)))
		lastT = GetSecs() + 60;
		tiempo = 0;
		while tiempo > 0
			strT = num2str(floor(tiempo))
			[ny,nx,bbox] = DrawFormattedText(wPtr, strT,'center','center',0);
			Screen('FillRect',wPtr,gray);  %Pintamos la pantalla de gris
			Screen('DrawText', wPtr, strT, nx, ny, [0,0,0,255]);
			Screen(wPtr, 'Flip');
			tiempo = lastT - GetSecs();
		end
	end
	
   		
%     infoInstancia = [gender];

%     HideCursor;
%     cueCoords = [[(3*octavePointX-28) (octavePointY-23) (3*octavePoint+28) (octavePointY+23)]; [(middlePointX-23) (middlePointY-23) (middlePointX+23) (middlePointY+23)]; [(3*(middlePointX-quarterPointX/2)-23) ((middlePointY-quarterPointX/2)-23) (3*(middlePointX-quarterPointX/2)+23) ((middlePointX-quarterPointX/2)+23)] ];   % Defino una matriz con las posiciones del cue atencional. Primer fila: Periferico izquierdo, Segunda fila: Periferico derecho, Tercer fila: Neutral
%     fila = randi([1, 3], 1);  %Hacemos random entre 1 y 3 para decidir que cue atencional usar.
%     infoInstancia = cat(2, infoInstancia, [fila]);
	
%     %Hacemos dos randoms para elegir las dos imagenes que se van a presentar en
%     %pantalla
%     imgRight = randi([1, cantImagenes], 1);
%     imgLeft = randi([1, cantImagenes], 1); 
   
%     if(imgRight > 16)
%             imgLeft = randi([1, 16], 1);
%     else
%         while imgLeft == imgRight
%             imgLeft = randi([1, cantImagenes], 1);
%         end
%     end
	
%     infoInstancia = cat(2, infoInstancia, [imgRight]);
%     infoInstancia = cat(2, infoInstancia, [imgLeft]);
	
%     %Elegimos una imagen de a
%     imagenRight = imread(cat(2,'Imagenes/', vImg(imgRight,:)), 'jpg');
%     imagenLeft = imread(cat(2,'Imagenes/', vImg(imgLeft,:)), 'jpg');

%     barCoords = [[(middlePointX-60) (middlePointY-10) (middlePointX-20) (middlePointY+10)]; [(middlePointX+20) (middlePointY-10) (middlePointX+60) (middlePointY+10)]];
	
%     if(imgRight > 16) 
%         ALaIzquierda = 1;
%     elseif(imgLeft > 16)
%         ALaIzquierda = 2;
%     else
%         ALaIzquierda = randi([1,2], 1);
%     end
	
%     infoInstancia = cat(2, infoInstancia, [ALaIzquierda]);
%     % 
%     % if (quienVaALaIzquierda == 1) 
%     %     imagenLeft  = imread(img1, 'jpg');
%     %     imagenRight = imread(img2,'jpg');
%     % else
%     %     imagenLeft  = imread(img2, 'jpg');
%     %     imagenRight = imread(img1, 'jpg');
%     % end

%     % Presentacion del punto de fijacion en el centro de la pantalla
	
%     Screen('FillRect',wPtr,gray);  %Pintamos la pantalla de gris
%     Screen('FillOval', wPtr, black, [(middlePointX-10) (middlePointY-10) (middlePointX+10) (middlePointY+10)]); %Circulo de fijacion en el centro de la pantalla
%     Screen(wPtr, 'Flip');

%     % Dura 1 segundo
%     tic
%     while toc<1 %segundos
%     ;
%     end

	
%     % Presentación del Cue atencional periferico 
%     %if(counter > 20)
%         Screen('FillRect',wPtr,gray);  %Pintamos la pantalla de gris
%         Screen('FillOval', wPtr, black, [(middlePointX-10) (middlePointY-10) (middlePointX+10) (middlePointY+10)]); %Circulo de fijacion en el centro de la pantalla
%         Screen('FillOval', wPtr, black, cueCoords(fila, :)); %Cue perfiferico a la izquierda; Usamos las coordenadas indicadas por fila (el numero random).
%         Screen(wPtr, 'Flip');

%         % Dura 40 ms
	
%         tic
%         while toc<0.04
%         ;
%         end

%     %end
%     %Volvemos a presentar el punto de fijacion durante 60 ms
	
%     Screen('FillRect',wPtr,gray);  %Pintamos la pantalla de gris
%     Screen('FillOval', wPtr, black, [(middlePointX-10) (middlePointY-10) (middlePointX+10) (middlePointY+10)]); %Circulo de fijacion en el centro de la pantalla
%     Screen(wPtr, 'Flip');

%     tic
%     while toc<0.06
%     ;
%     end
	
%     % Presentamos las caras durante 500mseg
	
%     Screen('FillRect',wPtr,gray);  %Pintamos la pantalla de gris
%     Screen('PutImage', wPtr, imagenLeft, [(quarterPointX-181)  (middlePointY-245) (quarterPointX+181) (middlePointY+245)]);
%     Screen('PutImage', wPtr, imagenRight, [(3*quarterPointX-181)  (middlePointY-245) (3*quarterPointX+181) (middlePointY+245)]);
%     Screen('FillOval', wPtr, black, [(middlePointX-10) (middlePointY-10) (middlePointX+10) (middlePointY+10)]); %Circulo de fijacion en el centro de la pantalla
%     Screen(wPtr,'Flip');

%     tic
%     while toc<0.6 %0.25
%     ;
%     end
	
%     %Volvemos a presentar el punto de fijacion durante 200ms
%         Screen('FillRect',wPtr,gray);  %Pintamos la pantalla de gris
%         Screen('FillOval', wPtr, black, [(middlePointX-10) (middlePointY-10) (middlePointX+10) (middlePointY+10)]); %Circulo de fijacion en el centro de la pantalla
%         Screen(wPtr, 'Flip');
	
%         tic
%         while toc<0.2
%             ;
%         end
%     % Presentamos la clave para que indique que genero habia en ese lado de la pantalla (barra negra) 
	
%     Screen('FillRect',wPtr,gray);  %Pintamos la pantalla de gris
%     Screen('FillOval', wPtr, black, [(middlePointX-10) (middlePointY-10) (middlePointX+10) (middlePointY+10)]); %Circulo de fijacion en el centro de la pantalla
%     Screen('FillRect', wPtr, black, barCoords(ALaIzquierda,:));
%     Screen(wPtr,'Flip');

%     % dura 300 mseg la presentacion y es el tiempo en el que tiene que
%     % repsonder el sujeto
	
%     tic
%     while toc<0.3
%     ;
%     end
	
%     Screen('FillRect',wPtr,gray);  %Pintamos la pantalla de gris
%     Screen('FillOval', wPtr, black, [(middlePointX-10) (middlePointY-10) (middlePointX+10) (middlePointY+10)]); %Circulo de fijacion en el centro de la pantalla
%     Screen(wPtr, 'Flip');
	

%         tic
%         pressedButton = find(buttons);
%         if(pressedButton == 1)
%             infoInstancia = cat(2, infoInstancia, 0);
%         elseif (pressedButton == 3)
%             infoInstancia = cat(2, infoInstancia, 1);
%         else
%             infoInstancia = cat(2, infoInstancia, -1);
%         end
		
%         if infoInstancia(5)
%            if (or(infoInstancia(4) <= 8,and(infoInstancia(4) >= 17, infoInstancia(4) <= 24)))
%                correctAnswer = 1;
%            else 
%                correctAnswer = 0;
%            end
%         else
%             if (or(infoInstancia(3) <= 8,and(infoInstancia(3) >= 17, infoInstancia(3) <= 24)))
%                correctAnswer = 1;
%            else 
%                correctAnswer = 0;   
%             end
%         end
%         %%%%%TODO: AGREGAR REPUESTA ESPERADA AL INFO INSTANCIA
%         if infoInstancia(5) == 1;
%             infoInstancia = cat(2, infoInstancia, correctAnswer);
%         else
%             infoInstancia = cat(2, infoInstancia, correctAnswer);
%         end
		
%         responseTime = toc;
%         infoInstancia = cat(2, infoInstancia, responseTime);
	
%         fullData = cat(1, fullData, infoInstancia);
	counter = counter + 1;
		
%          tic
%         while toc<1
%         ;
%         end
		

end

fullData

Screen('CloseAll');
ShowCursor; 