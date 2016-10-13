function [] = errorPercentage(data, titulo)
%ERRORPERCENTAGE Summary of this function goes here
%   Detailed explanation goes here
    badAnswersPositions = (data(:,7) ~= -1) & (data(:,7) ~= data(:,8)); %Vector con 1s donde la respuesta es incorrecta.
    badAnswers = sum(badAnswersPositions);%Cantidad de respuestas incorrectas

    %Filas validas/neutrales/invalidas respecto de las posiciones del cue.
    filasValidas = ((data(:,3) == 1 & data(:,6) == 1) | (data(:,3) == 3 & data(:,6) == 2)) & data(:,10) == 2;
    filasNeutrales = data(:,3) == 2 & data(:,10) == 2;
    filasInvalidas = not(filasValidas) & not(filasNeutrales) & data(:,10) == 2;
    
    erroresValidas = sum(filasValidas)/badAnswers*100;
    erroresNeutrales = sum(filasNeutrales)/badAnswers*100;
    erroresInvalidas = sum(filasInvalidas)/badAnswers*100;
    
    figure;
    x = {'Valido','Neutral','Invalido'};
    y = [erroresValidas, erroresNeutrales, erroresInvalidas];
    bar(y); %Dibujo el grafo
    title(titulo); %Con este titulo
    set(gca, 'XTick', 1:3, 'XTickLabel', x);
end

