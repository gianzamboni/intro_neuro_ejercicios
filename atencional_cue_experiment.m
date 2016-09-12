%Inicializamos la pantalla
screenNum=0;
res=[1280 1024];
clrdepth=32;
[wPtr,rect]=Screen('OpenWindow',screenNum,0);
%Colore
black=BlackIndex(wPtr);
white = WhiteIndex(wPtr);
gray = [128 128 128];


rect
middlePointY = rect(4)/2;
quarterPointY = middlePointY / 2;
middlePointX = rect(3)/2;
quarterPointX = middlePointX / 2;

files = dir('Imagenes');  % Conseguimos todos los archivos del directorio
fileSizes = size(files);  % Cantidad de archivos del directorio
cantArchivos = fileSizes(1); 
vImg = [];
% Los primeros 2 archivos del directorio son '.' y '..'. Estos dos no nos
% sirven y los salteamos, el resto asumimos que son todas imagenes jpg y
% metemos todos los nombres en un vector
for c = 3:cantArchivos
   vImg = cat(1,vImg,[files(c).name]);
end
 
cantImagenes = cantArchivos - 2;  %La cantidad de imagenes del directorio

resultados = [];
counter = 0;


while(counter < 1)
   
    infoInstancia = [];    % [ sexo_sujeto, cue, imgD, imgI, responseCue, Rta, RtaEsperada, Tiempo ]
                           % sexo_sujeto = 0 mujer
                           %               1 hombre
                           % cue =  1 Izquierda
                           %        2 Neutral
                           %        3 Derecha
                           % responseCue =  1 Izquierda
                           %                2 Derecha
                           % Rta =          1 Botón izquierdo
                           %                3 Botón derecho
    
    %%%%%%%%% TODO %%%%%%%%%%%%%
    %%%%% AGREGAR QUE EL USUARIO INDIQUE SEXO %%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%
    woman = imread('woman.jpg', 'jpg');
    man = imread('man.jpg', 'jpg');
    title = imread('titulo.jpg', 'jpg');
    
    middlePointX
    middlePointY
    Screen('FillRect',wPtr,gray);  %Pintamos la pantalla de gris
    Screen('PutImage', wPtr, title, [(middlePointX - 300) (quarterPointY - 100) (middlePointX + 300) (quarterPointY + 100)]);
    Screen('PutImage', wPtr, woman, [(quarterPointX-64) (middlePointY-118) (quarterPointX + 63) (middlePointY + 119)]);
    Screen('PutImage', wPtr, man, [(3*quarterPointX-52) (middlePointY-118) (3*quarterPointX+52) (middlePointY + 119)]);
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
    
    infoInstancia = cat(2, infoInstancia, [gender]);
    
    HideCursor;
    cueCoords = [[(quarterPointX-15) (quarterPointY-15) (quarterPointX+15) (quarterPointY+15)]; [(middlePointX-15) (middlePointY-15) (middlePointX+15) (middlePointY+15)]; [(3*quarterPointX-15) (quarterPointY-15) (3*quarterPointX+15) (quarterPointY+15)] ];   % Defino una matriz con las posiciones del cue atencional. Primer fila: Periferico izquierdo, Segunda fila: Periferico derecho, Tercer fila: Neutral
    fila = randi([1, 3], 1);  %Hacemos random entre 1 y 3 para decidir que cue atencional usar.
    infoInstancia = cat(2, infoInstancia, [fila]);
    
    %Hacemos dos randoms para elegir las dos imagenes que se van a presentar en
    %pantalla
    imgRight = randi([1, cantImagenes], 1); 
    imgLeft = randi([1, cantImagenes], 1); 
    while(imgLeft == imgRight) 
      imgLeft = randi([1, cantImagenes], 1);
    end

    infoInstancia = cat(2, infoInstancia, [imgRight]);
    infoInstancia = cat(2, infoInstancia, [imgLeft]);
    
    %Elegimo una imagen de a
    imagenRight = imread(cat(2,'Imagenes/', vImg(imgRight,:)), 'jpg');
    imagenLeft = imread(cat(2,'Imagenes/', vImg(imgLeft,:)), 'jpg');

    barCoords = [[(middlePointX-60) (middlePointY-10) (middlePointX-20) (middlePointY+10)]; [(middlePointX+20) (middlePointY-10) (middlePointX+60) (middlePointY+10)]];
    ALaIzquierda = randi([1,2], 1);
    infoInstancia = cat(2, infoInstancia, [ALaIzquierda]);
    % 
    % if (quienVaALaIzquierda == 1) 
    %     imagenLeft  = imread(img1, 'jpg');
    %     imagenRight = imread(img2,'jpg');
    % else
    %     imagenLeft  = imread(img2, 'jpg');
    %     imagenRight = imread(img1, 'jpg');
    % end

    Screen('FillRect',wPtr,gray);  %Pintamos la pantalla de gris
    Screen('FillOval', wPtr, black, [(middlePointX-10) (middlePointY-10) (middlePointX+10) (middlePointY+10)]); %Circulo de fijacion en el centro de la pantalla
    Screen(wPtr, 'Flip');

    tic
    while toc<0.5 %segundos
    ;
    end

    

    Screen('FillRect',wPtr,gray);  %Pintamos la pantalla de gris
    Screen('FillOval', wPtr, black, [(middlePointX-10) (middlePointY-10) (middlePointX+10) (middlePointY+10)]); %Circulo de fijacion en el centro de la pantalla
    Screen('FillOval', wPtr, black, cueCoords(fila, :)); %Cue perfiferico a la izquierda; Usamos las coordenadas indicadas por fila (el numero random).
    Screen(wPtr, 'Flip');

    tic
    while toc<0.5
    ;
    end

    Screen('FillRect',wPtr,gray);  %Pintamos la pantalla de gris
    Screen('PutImage', wPtr, imagenLeft, [220 412 420 656]);
    Screen('PutImage', wPtr, imagenRight, [860 412 1060 656]);
    Screen('FillOval', wPtr, black, [(middlePointX-10) (middlePointY-10) (middlePointX+10) (middlePointY+10)]); %Circulo de fijacion en el centro de la pantalla
    Screen(wPtr,'Flip');

    tic
    while toc<0.5
    ;
    end

    %Pantalla de la barra negra
    Screen('FillRect',wPtr,gray);  %Pintamos la pantalla de gris
    Screen('FillOval', wPtr, black, [(middlePointX-10) (middlePointY-10) (middlePointX+10) (middlePointY+10)]); %Circulo de fijacion en el centro de la pantalla
    Screen('FillRect', wPtr, black, barCoords(ALaIzquierda,:));
    Screen(wPtr,'Flip');

    tic
    while toc<0.5
    ;
    end
    
    Screen('FillRect',wPtr,gray);  %Pintamos la pantalla de gris
    Screen('FillOval', wPtr, black, [(middlePointX-10) (middlePointY-10) (middlePointX+10) (middlePointY+10)]); %Circulo de fijacion en el centro de la pantalla
    Screen(wPtr, 'Flip');
    

    
        pressedButton = find(buttons);
        infoInstancia = cat(2, infoInstancia, pressedButton);
        infoInstancia = cat(2, infoInstancia, responseTime);
    
        infoInstancia
        counter = counter + 1;
end

Screen('CloseAll');
ShowCursor; 