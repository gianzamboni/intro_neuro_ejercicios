z = sin(x).*cos(0)

plot(x,z)

maxX=max(z)
minX=min(z)

hold on
plot(x,maxX);
plot(x,minX);
hold off
