load('allData.mat');

% [sujeto, sexo_sujeto, cue, imgD, imgI, responseCue, Rta, RtaEsperada, Tiempo ]
							% sexo_sujeto = 0 mujer
							%               1 hombre
							% cue =  1 Izquierda
							%        2 Neutral
							%        3 Derecha
							% responseCue =  1 Izquierda
							%                2 Derecha
							% Rta =          1 Botón izquierdo - mujer
							%                3 Botón derecho - hombre

                            
newColumna = correctWrongInvalid(allData, 'Respuestas totales', true);
allData = cat(2, allData, newColumna);

%Esta es una matriz que solo tiene las filas que corresponde a respuestas correctas e incorrectas.
data = allData( allData(:,10) == 1 | allData(:,10) == 2, :);
lasDosSonNormales = (data(:,4) < 17) & (data(:,5) < 17); % Hay 1s donde las dos caras son normales

modifiedFaces = data(lasDosSonNormales == 0, :);  %Todas las filas con 1 cara modificada
normalFaces = data(lasDosSonNormales == 1,:); %Todas las filas 2 con caras normales

correctWrongInvalid(modifiedFaces, 'Respuestas con caras modificadas', false);
correctWrongInvalid(normalFaces, 'Respuestas con caras normales', false);

errorPercentage(normalFaces,'Error con caras normales');
errorPercentage(modifiedFaces,'Error con caras modificadas');

sujetosHombres = allData(allData(:,2) == 1);
sujetosMujeres = allData(allData(:,2) == 0);

%correctWrongInvalid(sujetosHombres)
%correctWrongInvalid(sujetosMujeres)

% sexo_mujer_correctas = 0;
% sexo_hombre_correctas = 0;
% sexo_mujer_imagen_mujer_correctas = 0;
% sexo_mujer_imagen_hombre_correctas = 0;
% sexo_hombre_imagen_mujer_correctas = 0;
% sexo_hombre_imagen_hombre_correctas = 0;
% 

% 
% 
% for inst = 1: dataSize(1)
% 	if data(inst,2) == 0
%         if and(data(inst,8) == 0, data(inst,10) == 1)
%             sexo_mujer_correctas = sexo_mujer_correctas + 1;
%             sexo_mujer_imagen_mujer_correctas = sexo_mujer_imagen_mujer_correctas + 1;
%         elseif and(data(inst,8) == 1, data(inst,10) == 1)
%             sexo_mujer_correctas = sexo_mujer_correctas + 1;
%             sexo_mujer_imagen_hombre_correctas = sexo_mujer_imagen_hombre_correctas + 1;
%         end
% 	else
%         if and(data(inst,8) == 0, data(inst,10) == 1)
%             sexo_hombre_correctas = sexo_hombre_correctas + 1;
%             sexo_hombre_imagen_mujer_correctas = sexo_hombre_imagen_mujer_correctas + 1;
%         elseif and(data(inst,8) == 1, data(inst,10) == 1)
%             sexo_hombre_correctas = sexo_hombre_correctas + 1;
%             sexo_hombre_imagen_hombre_correctas = sexo_hombre_imagen_hombre_correctas + 1;
%         end
% 	end
% end
% 
% sin_distracciones = 0;      
% correctas_sin_distracciones = 0;
% sexo_mujer_correctas_sin_distracciones = 0;
% sexo_hombre_correctas_sin_distracciones = 0;
% sexo_mujer_imagen_mujer_correctas_sin_distracciones = 0;
% sexo_mujer_imagen_hombre_correctas_sin_distracciones = 0;
% sexo_hombre_imagen_mujer_correctas_sin_distracciones = 0;
% sexo_hombre_imagen_hombre_correctas_sin_distracciones = 0;
% 
% incorrectas_sin_distracciones = 0;
% sexo_mujer_incorrectas_sin_distracciones = 0;
% sexo_hombre_incorrectas_sin_distracciones = 0;
% sexo_mujer_imagen_mujer_incorrectas_sin_distracciones = 0;
% sexo_mujer_imagen_hombre_incorrectas_sin_distracciones = 0;
% sexo_hombre_imagen_mujer_incorrectas_sin_distracciones = 0;
% sexo_hombre_imagen_hombre_incorrectas_sin_distracciones = 0;
% 
% 
% for inst = 1: dataSize(1)
%     if data(inst,11)== 1
%         sin_distracciones = sin_distracciones + 1;
%         if data(inst,2) == 0
%             if and(data(inst,8) == 0, data(inst,10) == 1)
%                 sexo_mujer_correctas_sin_distracciones = sexo_mujer_correctas_sin_distracciones + 1;
%                 sexo_mujer_imagen_mujer_correctas_sin_distracciones = sexo_mujer_imagen_mujer_correctas_sin_distracciones + 1;
%             elseif and(data(inst,8) == 1, data(inst,10) == 1)
%                 sexo_mujer_correctas = sexo_mujer_correctas_sin_distracciones + 1;
%                 sexo_mujer_imagen_hombre_correctas = sexo_mujer_imagen_hombre_correctas_sin_distracciones + 1;
%             end
%         else
%             if and(data(inst,8) == 0, data(inst,10) == 1)
%                 sexo_hombre_correctas_sin_distracciones = sexo_hombre_correctas_sin_distracciones + 1;
%                 sexo_hombre_imagen_mujer_correctas_sin_distracciones = sexo_hombre_imagen_mujer_correctas_sin_distracciones + 1;
%             elseif and(data(inst,8) == 1, data(inst,10) == 1)
%                 sexo_hombre_correctas_sin_distracciones = sexo_hombre_correctas_sin_distracciones + 1;
%                 sexo_hombre_imagen_hombre_correctas_sin_distracciones = sexo_hombre_imagen_hombre_correctas_sin_distracciones + 1;
%             end
%         end
%     end
%end