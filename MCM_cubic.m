function ris = MCM_cubic(x,par)



ris.acc = 6*(1-2*x);
ris.vel = 6*x*(1-x);
ris.pos = x*(3*x-2*x^2);

end