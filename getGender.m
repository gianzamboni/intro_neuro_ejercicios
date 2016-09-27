function gender = getGender(wPtr, titlePosition, womanPosition, manPosition)
	buttons = [0 0 0];
	gender = -1;
	while not(and(any(buttons), gender >= 0))  % Espera repuesta del mouse durante un tiempo acotado, sino sigue.
    	[x,y,buttons] = GetMouse(wPtr);
    	if any(buttons)
            and(and(x > womanPosition(1), x < womanPosition(3)), and(y > womanPosition(2), y < womanPosition(4)))
            and(and(x > manPosition(1), x < manPosition(3)), and(y > manPosition(2), y < manPosition(4)))
        	if and(and(x > womanPosition(1), x < womanPosition(3)), and(y > womanPosition(2), y < womanPosition(4)))
            	gender = 0;
        	elseif and(and(x > manPosition(1), x < manPosition(3)), and(y > manPosition(2), y < manPosition(4)))
            	gender = 1;
        	end
    	end
	end
end
