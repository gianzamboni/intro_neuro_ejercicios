function position = getResponseCuePosition(imgLeft, imgRight)
	if(imgRight > 16) 
        position = 1;
	elseif(imgLeft > 16)
        position = 2;
    else
        position = randi([1,2], 1);
	end
end

