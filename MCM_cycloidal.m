function ris = MCM_cycloidal(x,par)



ris.acc = 2 * pi *sin(2*pi*x);
ris.vel = 1 - cos(2*pi*x);
ris.pos = x - sin(2*pi*x)/(2 * pi);

end