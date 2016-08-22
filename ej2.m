function ejercicio1(x)
z = sin(x).*cos(0)

plot(x,z)

maxZ=max(z)
minZ=min(z)

indiceZmax = find(z == maxZ)
indiceZmin = find(z == minZ)

hold on
plot(x(indiceZmax),maxZ, 'r*');
plot(x(indiceZmin),minZ,'r*');
hold off
end
