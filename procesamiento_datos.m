procesamiento_datos = function(data)
    goodAnswers = 0;
    badAnswers = 0;
    invalidAnswers = 0;
    dataSize = size(data);
    
    newColummna = []
    
    for inst = 1: dataSize(1) %nstancia desde 1 hasta cantidad de instancias
        if data(1,6) == -1
            invalidAnswer = invalidAnswer + 1;
            newColumna = cat(1, newColumna, 0) %Digo que la respuesta es invalida 
        elseif data(1,6) == data(1,7)
          goodAswers = goodAnswers + 1;
          newColumna = cat(1, newColumna, 1) %Digo que la respuesta es correcta
        else
          badAnswers = badAnswers + 1; 
          newColumna = cat(1, newColumna, 2) %Digo que la respuesta es incorrecta
        end
    end
    
    data = cat(1, data, newColumna);
    
    sexo_mujer_imagen_mujer_correctas = 0;
    sexo_mujer_imagen_hombre_correctas = 0;
    sexo_hombre_imagen_mujer_correctas = 0;
    sexo_hombre_imagen_hombre_correctas = 0;
    
    for(inst = 1 : dataSize(1)
       if(not(data(1,9) == 0)
           
       end
    end    
    
end