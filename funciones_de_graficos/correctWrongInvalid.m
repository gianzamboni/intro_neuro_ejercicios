function [newColumna] = correctWrongInvalid(data, titulo, showInvalid)
%CORRECTWRONGINVALIDTOTAL Summary of this function goes here
%   Detailed explanation goes here
    dataSize = size(data);  %Tamaño de la matriz
    newColumna = zeros(dataSize(1),1); %Vector lleno de ceros (hay tantos ceros como filas tenga la matriz)

    goodAnswersPositions = data(:,7) == data(:,8); %Vector con 1s donde la respuesta es correcta
    goodAnswers = sum(goodAnswersPositions)/dataSize(1)*100; %Porcentaje de respuestas correctas
    newColumna(goodAnswersPositions) = 1; %Pongo un 1 en las posiciones del vector que corresponden a respuestas validas
    
    badAnswersPositions = (data(:,7) ~= -1) & (data(:,7) ~= data(:,8)); %Vector con 1s donde la respuesta es incorrecta.
    badAnswers = sum(badAnswersPositions)/dataSize(1)*100; %Porcentaje de respuestas incorrectas
    newColumna(badAnswersPositions) = 2; %Pongo un 2 en las posiciones del vector que corresponden a respuestas invalidas
    
    figure; %Creo una ventana nueva
    
    if showInvalid
        invalidAnswersPositions = data(:,7) == -1;   %Vector con 1 donde la respuesta es invalida
        invalidAnswers = sum(invalidAnswersPositions)/dataSize(1)*100; %Porcentaje de repuestas invalidas
        x = {'No respondidas','Incorrectas','Correctas'};  %Nombre para las 3 barras
        y = [invalidAnswers badAnswers goodAnswers]; %Pongo 3 barras con esos valores
    else
        x = {'Incorrectas','Correctas'};  %Nombre para las 3 barras
        y = [badAnswers goodAnswers]; %Pongo 3 barras con esos valores
    end
    
    bar(y); %Dibujo el grafo
    title(titulo); %Con este titulo
    set(gca, 'XTick', 1:3, 'XTickLabel', x);   
    xlabel('Tipo de repuesta');
    ylabel('Porcentaje');
    
end

