load('allData.mat');

% [sujeto, sexo_sujeto, cue, imgD, imgI, responseCue, Rta, RtaEsperada, Tiempo ]
							% sexo_sujeto = 0 mujer
							%               1 hombre
							% cue =  1 Izquierda
							%        2 Neutral
							%        3 Derecha
							% responseCue =  1 Izquierda
							%                2 Derecha
							% Rta =          0 mujer
							%                1 hombre

                            
newColumna = correctWrongInvalid(allData, 'Respuestas totales', true);
allData = cat(2, allData, newColumna);

%Esta es una matriz que solo tiene las filas que corresponde a respuestas correctas e incorrectas.
data = allData( allData(:,10) == 1 | allData(:,10) == 2, :);
%responseTime(data, 'Tiempos de respuesta promedio');

lasDosSonNormales = (data(:,4) < 17) & (data(:,5) < 17); % Hay 1s donde las dos caras son normales

modifiedFaces = data(lasDosSonNormales == 0, :);  %Todas las filas con 1 cara modificada
%correctWrongInvalid(modifiedFaces, 'Respuestas con caras modificadas', false);
%errorPercentage(modifiedFaces,'Error con caras modificadas');
%responseTime(modifiedFaces, 'Tiempos de respuesta promedio - Caras modificadas');


normalFaces = data(lasDosSonNormales == 1,:); %Todas las filas 2 con caras normales
%correctWrongInvalid(normalFaces, 'Respuestas con caras normales', false);
%errorPercentage(normalFaces,'Error con caras normales');
%responseTime(normalFaces, 'Tiempos de respuestas promedio - Caras normales');

sujetosHombres = data(data(:,2) == 1,:);
%errorPercentage(sujetosHombres, 'Errores de los hombres');

sujetosMujeres = data(data(:,2) == 0,:);
%errorPercentage(sujetosMujeres, 'Errores de las mujeres');


sujetosHombresNormales = sujetosHombres(sujetosHombres(:,4) < 17 & sujetosHombres(:,5) < 17, :);

targetMujer = sujetosHombresNormales(:,8) == 0;

hombresTargetMujer = sujetosHombresNormales(targetMujer, :);
%errorPercentage(hombresTargetMujer, 'Error de hombres cuando objetivo es mujer');
%responseTime(hombresTargetMujer, 'Tiempo de respuesta en hombres cuando objetivo es mujer');

hombresTargetHombre = sujetosHombresNormales(targetMujer == 0, :);
%errorPercentage(hombresTargetHombre, 'Error de hombres cuando objetivo es hombre');
%responseTime(hombresTargetHombre, 'Tiempo de respuesta en hombres cuando objetivo es hombre');

sujetosMujeresNormales = sujetosMujeres(sujetosMujeres(:,4) < 17 & sujetosMujeres(:,5) < 17, :);

targetMujer = sujetosMujeresNormales(:,8) == 0;

mujeresTargetMujer = sujetosMujeresNormales(targetMujer, :);
errorPercentage(mujeresTargetMujer, 'Error de mujeres cuando objetivo es mujer');
responseTime(mujeresTargetMujer, 'Tiempo de respuesta en mujeres cuando objetivo es mujer');

mujeresTargetHombre = sujetosMujeresNormales(targetMujer == 0, :);
errorPercentage(mujeresTargetHombre, 'Error de mujeress cuando objetivo es hombre');
responseTime(mujeresTargetHombre, 'Tiempo de respuesta en mujeres cuando objetivo es hombre');


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