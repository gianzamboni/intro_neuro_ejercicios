screenNum=0;
res=[1280 1024];
clrdepth=32;
[wPtr,rect]=Screen('OpenWindow',screenNum,0,[0 0 res(1) res(2)],clrdepth);
black=BlackIndex(wPtr);
white = WhiteIndex(wPtr);
red = [255 0 0];
green = [0 255 0];

[xCenter, yCenter] = RectCenter(rect)
Screen('FillRect',wPtr,red);
Screen('FillRect', wPtr, green, [640 512 680 552]);
Screen(wPtr, 'Flip');

image = imread('man.png');

imTexture_V1 = Screen('makeTexture',wPtr,image);

HideCursor;
tic
while toc<1 %segundos
;
end

Screen('FillRect',wPtr, black);
Screen('FillOval', wPtr, green, [0 0 2 5]*100);
Screen('DrawTexture', wPtr , imTexture_V1); %Fill the buffer with the first texture
Screen(wPtr, 'Flip');

HideCursor;
tic
while toc<1%segundos
;
end

Screen('FillRect',wPtr, red);
Screen('FillOval', wPtr, green, [0 0 2 2]*100);
Screen(wPtr, 'Flip');

HideCursor;
tic
while toc<1 %segundos
;
end

Screen('FillRect',wPtr, black);
Screen('FillOval', wPtr, green, [0 0 2 2]*100);
Screen(wPtr, 'Flip');

HideCursor;
tic
while toc<1 %segundos
;
end

Screen('CloseAll');
ShowCursor;