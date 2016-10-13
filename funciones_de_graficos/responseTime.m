function [ output_args ] = responseTime(data, titulo)
%RESPONSETIME Summary of this function goes here
%   Detailed explanation goes here
    %Filas validas/neutrales/invalidas respecto de las posiciones del cue.
    filasValidas = ((data(:,3) == 1 & data(:,6) == 1) | (data(:,3) == 3 & data(:,6) == 2)) & data(:,10) == 2;
    filasNeutrales = data(:,3) == 2 & data(:,10) == 2;
    filasInvalidas = not(filasValidas) & not(filasNeutrales) & data(:,10) == 2;
   
    dataFV = data(filasValidas, 9);
    dataFN = data(filasNeutrales, 9);
    dataFI = data(filasInvalidas, 9);
    
    tiempoRtaValidas = mean(dataFV);
    tiempoRtaNeutrales = mean(dataFN);
    tiempoRtaInvalidas = mean(dataFI);
    
    errorRtaValidas = std(dataFV)/sqrt(length(dataFV));
    errorRtaNeutrales = std(dataFN)/sqrt(length(dataFN));
    errorRtaInvalidas = std(dataFI)/sqrt(length(dataFI));
    
    figure;
    x = {'Valido','Neutral','Invalido'};
    y = [tiempoRtaValidas, tiempoRtaNeutrales, tiempoRtaInvalidas];
    error = [errorRtaValidas, errorRtaNeutrales, errorRtaInvalidas];
    errorbar(y,error); %Dibujo el grafo
    title(titulo); %Con este titulo
    set(gca, 'XTick', 1:3, 'XTickLabel', x);
    
end

