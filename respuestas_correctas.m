data = allData;
goodAnswers = 0;
badAnswers = 0;
invalidAnswers = 0;
dataSize = size(allData);
    
newColumna = [];
    
for inst = 1: dataSize(1) %nstancia desde 1 hasta cantidad de instancias
    inst;
    if data(inst,7) == -1
        invalidAnswers = invalidAnswers + 1;
        newColumna = cat(1, newColumna, 0); %Digo que la respuesta es invalida 
    elseif data(inst,7) == data(inst,8)
        goodAnswers = goodAnswers + 1;
        newColumna = cat(1, newColumna, 1); %Digo que la respuesta es correcta
    else
        badAnswers = badAnswers + 1; 
        newColumna = cat(1, newColumna, 2); %Digo que la respuesta es incorrecta
    end
end

goodAnswers = goodAnswers/dataSize(1)*100;
badAnswers = badAnswers/dataSize(1)*100;
invalidAnswers = invalidAnswers/dataSize(1)*100;

figure;
y = [invalidAnswers badAnswers goodAnswers];
allAnswers = bar(y);
title('Porcentaje de respuestas correctas, incorrectas e invalidas')

data = cat(2, data, newColumna);

data = data( data(:,10) == 1 | data(:,10) == 2, :);
v = (data(:,4) < 17 & data(:,5) < 17);
data = cat(2,data,v);
k = find(v == 0);

modifiedFaces = data(k, :);
k = find(v == 1);
normalFaces = data(k,:);

modifiedFacesSize = size(modifiedFaces);
goodAnswers = 0;
badAnswers = 0;
invalidAnswers = 0;

for inst = 1: modifiedFacesSize(1) %nstancia desde 1 hasta cantidad de instancias
    inst;
    if data(inst,7) == -1
        invalidAnswers = invalidAnswers + 1;
        newColumna = cat(1, newColumna, 0); %Digo que la respuesta es invalida 
    elseif data(inst,7) == data(inst,8)
        goodAnswers = goodAnswers + 1;
        newColumna = cat(1, newColumna, 1); %Digo que la respuesta es correcta
    else
        badAnswers = badAnswers + 1; 
        newColumna = cat(1, newColumna, 2); %Digo que la respuesta es incorrecta
    end
end

goodAnswers = goodAnswers/dataSize(1)*100;
badAnswers = badAnswers/dataSize(1)*100;
invalidAnswers = invalidAnswers/dataSize(1)*100;

figure;
y = [invalidAnswers badAnswers goodAnswers]
allAnswers = bar(y)
title('Porcentaje de respuestas correctas, incorrectas e invalidas para trials con caras normales')

normalFacesSize = size(normalFaces);
goodAnswers = 0;
badAnswers = 0;
invalidAnswers = 0;


for inst = 1: normalFacesSize(1) %nstancia desde 1 hasta cantidad de instancias
    inst;
    if data(inst,7) == -1
        invalidAnswers = invalidAnswers + 1;
        newColumna = cat(1, newColumna, 0); %Digo que la respuesta es invalida 
    elseif data(inst,7) == data(inst,8)
        goodAnswers = goodAnswers + 1;
        newColumna = cat(1, newColumna, 1); %Digo que la respuesta es correcta
    else
        badAnswers = badAnswers + 1; 
        newColumna = cat(1, newColumna, 2); %Digo que la respuesta es incorrecta
    end
end

goodAnswers = goodAnswers/dataSize(1)*100;
badAnswers = badAnswers/dataSize(1)*100;
invalidAnswers = invalidAnswers/dataSize(1)*100;

figure;
y = [invalidAnswers badAnswers goodAnswers];
allAnswers = bar(y);
title('Porcentaje de respuestas correctas, incorrectas e invalidas con caras modificadas');

v = ((normalFaces(:,3) == 1 & normalFaces(:,6) == 1) | (normalFaces(:,3) == 3 & normalFaces(:,6) == 2)) & normalFaces(:,10) == 2; %Filas validas
v2 = normalFaces(:,3) == 2 & normalFaces(:,10) == 2; %Filas neutrales
v3 = not(v) & not(v2) & normalFaces(:,10) == 2; %Filas invalidas

cantErroresValidas = sum(v)/badAnswers*100;
cantErroresNeutrales = sum(v2)/badAnswers*100;
cantErroresInvalidas = sum(v3)/badAnswers*100;

figure;
y = [cantErroresValidas cantErroresNeutrales cantErroresInvalidas]
bar(y);
%%TODO: Eliminar filas con respuestas invalidas

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