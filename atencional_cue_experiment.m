%Inicializamos la pantalla
screenNum=0;
res=[1280 1024];
clrdepth=32;
[wPtr,rect]=Screen('OpenWindow',screenNum,0,[0 0 res(1) res(2)],clrdepth);
%Colores
black=BlackIndex(wPtr);
white = WhiteIndex(wPtr);
gray = [128 128 128];

imagen = imread('3.jpg','jpg');

Screen('FillRect',wPtr,gray);  %Pintamos la pantalla de gris
Screen('FillOval', wPtr, black, [640 512 660 532]); %Circulo de fijacion en el centro de la pantalla
Screen(wPtr, 'Flip');

HideCursor;
tic
while toc<1 %segundos
;
end

cueCoords = [[320 256 350 286]; [960 256 990 286]; [635 507 665 537] ];   % Defino una matriz con las posiciones del cue atencional. Primer fila: Periferico izquierdo, Segunda fila: Periferico derecho, Tercer fila: Neutral
fila = randi([1, 3], 1);  %Hacemos random entre 1 y 3 para decidir que cue atencional usar.

faceCoords = [];

Screen('FillRect',wPtr,gray);  %Pintamos la pantalla de gris
Screen('FillOval', wPtr, black, [640 512 660 532]); %Circulo de fijacion en el centro de la pantalla
Screen('FillOval', wPtr, black, cueCoords(fila, :)); %Cue perfiferico a la izquierda; Usamos las coordenadas indicadas por fila (el numero random).
Screen(wPtr, 'Flip');

tic
while toc<1
;
end


Screen('PutImage', wPtr, imagen, [220 412 420 656]);
Screen('PutImage', wPtr, imagen, [860 412 1060 656]);
Screen('FillOval', wPtr, black, [640 512 660 532]); %Circulo de fijacion en el centro de la pantalla
Screen(wPtr,'Flip');


tic
while toc<1
;
end


while ~KbCheck; end % wait for a key press

Screen(wPtr,'Flip');
