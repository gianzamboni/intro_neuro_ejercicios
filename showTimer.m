function [] = showTimer(wPtr)
	lastT = GetSecs() + 30;
	tiempo = 30;
	while tiempo > 0
        strT = strcat('Proxima tanda en\n', num2str(tiempo));
        [ny,nx,bbox] = DrawFormattedText(wPtr, strT,'center','center',0);
        %Screen('DrawText', wPtr, strT, nx, ny, [0,0,0,255]);
        Screen(wPtr, 'Flip');
        tiempo = floor(lastT - GetSecs());
	end
end

