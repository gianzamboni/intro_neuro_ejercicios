function [vector, cantArchivos] = getImagesName(directory)
	files = dir(directory);  % Conseguimos todos los archivos del directorio
	fileSizes = size(files);  % Cantidad de archivos del directorio
	cantArchivos = fileSizes(1); 
	vector = [];
	% Los primeros 2 archivos del directorio son '.' y '..'. Estos dos no nos
	% sirven y los salteamos, el resto asumimos que son todas imagenes jpg y
	% metemos todos los nombres en un vector
	for c = 3:cantArchivos
    	vector = cat(1,vector,[files(c).name]);
 	end
 	cantArchivos = cantArchivos - 2;
end