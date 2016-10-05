data = allData
goodAnswers = 0;
badAnswers = 0;
invalidAnswers = 0;
dataSize = size(allData);
    
newColumna = []
    
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
    
data = cat(2, data, newColumna);
   
%%TODO: Eliminar filas con respuestas invalidas

sexo_mujer_correctas = 0;
sexo_hombre_correctas = 0;
sexo_mujer_imagen_mujer_correctas = 0;
sexo_mujer_imagen_hombre_correctas = 0;
sexo_hombre_imagen_mujer_correctas = 0;
sexo_hombre_imagen_hombre_correctas = 0;

v = (data(:,4) < 17 & data(:,5) < 17);
data = cat(2,data,v);


for inst = 1: dataSize(1)
	if data(inst,2) == 0
        if and(data(inst,8) == 0, data(inst,10) == 1)
            sexo_mujer_correctas = sexo_mujer_correctas + 1;
            sexo_mujer_imagen_mujer_correctas = sexo_mujer_imagen_mujer_correctas + 1;
        elseif and(data(inst,8) == 1, data(inst,10) == 1)
            sexo_mujer_correctas = sexo_mujer_correctas + 1;
            sexo_mujer_imagen_hombre_correctas = sexo_mujer_imagen_hombre_correctas + 1;
        end
	else
        if and(data(inst,8) == 0, data(inst,10) == 1)
            sexo_hombre_correctas = sexo_hombre_correctas + 1;
            sexo_hombre_imagen_mujer_correctas = sexo_hombre_imagen_mujer_correctas + 1;
        elseif and(data(inst,8) == 1, data(inst,10) == 1)
            sexo_hombre_correctas = sexo_hombre_correctas + 1;
            sexo_hombre_imagen_hombre_correctas = sexo_hombre_imagen_hombre_correctas + 1;
        end
	end
end

sin_distracciones = 0;      
correctas_sin_distracciones = 0;
sexo_mujer_correctas_sin_distracciones = 0;
sexo_hombre_correctas_sin_distracciones = 0;
sexo_mujer_imagen_mujer_correctas_sin_distracciones = 0;
sexo_mujer_imagen_hombre_correctas_sin_distracciones = 0;
sexo_hombre_imagen_mujer_correctas_sin_distracciones = 0;
sexo_hombre_imagen_hombre_correctas_sin_distracciones = 0;

incorrectas_sin_distracciones = 0;
sexo_mujer_incorrectas_sin_distracciones = 0;
sexo_hombre_incorrectas_sin_distracciones = 0;
sexo_mujer_imagen_mujer_incorrectas_sin_distracciones = 0;
sexo_mujer_imagen_hombre_incorrectas_sin_distracciones = 0;
sexo_hombre_imagen_mujer_incorrectas_sin_distracciones = 0;
sexo_hombre_imagen_hombre_incorrectas_sin_distracciones = 0;


for inst = 1: dataSize(1)
    if data(inst,11)== 1
        sin_distracciones = sin_distracciones + 1;
        if data(inst,2) == 0
            if and(data(inst,8) == 0, data(inst,10) == 1)
                sexo_mujer_correctas_sin_distracciones = sexo_mujer_correctas_sin_distracciones + 1;
                sexo_mujer_imagen_mujer_correctas_sin_distracciones = sexo_mujer_imagen_mujer_correctas_sin_distracciones + 1;
            elseif and(data(inst,8) == 1, data(inst,10) == 1)
                sexo_mujer_correctas = sexo_mujer_correctas_sin_distracciones + 1;
                sexo_mujer_imagen_hombre_correctas = sexo_mujer_imagen_hombre_correctas_sin_distracciones + 1;
            end
        else
            if and(data(inst,8) == 0, data(inst,10) == 1)
                sexo_hombre_correctas_sin_distracciones = sexo_hombre_correctas_sin_distracciones + 1;
                sexo_hombre_imagen_mujer_correctas_sin_distracciones = sexo_hombre_imagen_mujer_correctas_sin_distracciones + 1;
            elseif and(data(inst,8) == 1, data(inst,10) == 1)
                sexo_hombre_correctas_sin_distracciones = sexo_hombre_correctas_sin_distracciones + 1;
                sexo_hombre_imagen_hombre_correctas_sin_distracciones = sexo_hombre_imagen_hombre_correctas_sin_distracciones + 1;
            end
        end
    end
end



for inst = 1: dataSize(1)
    if data(inst,11)== 1
        sin_distraccione