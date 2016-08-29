%Inicializamos la pantalla
screenNum=0;
res=[1280 1024];
clrdepth=32;
[wPtr,rect]=Screen('OpenWindow',screenNum,0,[0 0 res(1) res(2)],clrdepth);
%Colores
black=BlackIndex(wPtr);
white = WhiteIndex(wPtr);
gray = [128 128 128];

Screen('FillRect',wPtr,gray);  %Pintamos la pantalla de gris
Screen('FillOval', wPtr, black, [640 512 660 532]); %Circulo de fijacion en el centro de la pantalla
Screen(wPtr, 'Flip');

HideCursor;
tic
while toc<1 %segundos
;
end

Screen('FillRect',wPtr,gray);  %Pintamos la pantalla de gris
Screen('FillOval', wPtr, black, [640 512 660 532]); %Circulo de fijacion en el centro de la pantalla
Screen('FillOval', wPtr, black, [320 256 350 286]); %Cue perfiferico a la izquierda
Screen(wPtr, 'Flip');

tic
while toc<1
;
end

Screen('FillRect',wPtr,gray);  %Pintamos la pantalla de gris
Screen('FillOval', wPtr, black, [640 512 660 532]); %Circulo de fijacion en el centro de la pantalla
Screen('FillOval', wPtr, black, [960 256 990 286]); %Cue periferico a la derecha
Screen(wPtr, 'Flip');

tic
while toc<1
;
end

Screen('FillRect',wPtr,gray);  %Pintamos la pantalla de gris
Screen('FillOval', wPtr, black, [640 512 660 532]); %Circulo de fijacion en el centro de la pantalla
Screen('FillOval', wPtr, black, [635 507 665 537]); %Cue periferico a la derecha
Screen(wPtr, 'Flip');

tic
while toc<1
;
end

Screen('CloseAll');
ShowCursor;