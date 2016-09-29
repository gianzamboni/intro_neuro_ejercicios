function infoInstancia = makeVector(gender, cuePosition, imgRight, imgLeft, responseCuePosition, answer, tiempo, secs)
     
    if responseCuePosition == 1
        if (or(imgLeft <= 8,and(imgLeft >= 17, imgLeft <= 24)))
            correctAnswer = 1;
        else 
            correctAnswer = 0;
        end
    else
        if (or(imgRight <= 8,and(imgRight >= 17, imgRight <= 24)))
            correctAnswer = 1;
        else 
            correctAnswer = 0;   
        end
    end
    
    responseTime = secs - tiempo;
    
    infoInstancia = gender;
    infoInstancia = cat(2, infoInstancia, cuePosition);
	infoInstancia = cat(2, infoInstancia, imgRight);
    infoInstancia = cat(2, infoInstancia, imgLeft);
	infoInstancia = cat(2, infoInstancia, responseCuePosition);  
    infoInstancia = cat(2, infoInstancia, answer);
    infoInstancia = cat(2, infoInstancia, correctAnswer);
    infoInstancia = cat(2, infoInstancia, responseTime);
    
end

