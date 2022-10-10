function ris = MCM_sshape(x,par)

xv = par.v;
xw = par.w;

if xv<0 ||xv> xw || xw<0 || xw>1
    return;
end
cv = 2/(1-xv+xw);
cap = 2 / (xv * (1-xv+xw));
cam = 2/((1-xw)*(1-xv+xw));

if x<=xv
    ris.acc = cap ;
    ris.vel = cap*x;
    ris.pos = 0.5*cap*x^2;

elseif x>xv && x<xw
    ris.acc = 0 ;
    ris.vel = cap*xv;
    ris.pos = cap*xv*(x-xv/2);
else
    ris.acc = -cam;
    ris.vel = cap*xv-cam*(x-xw);
    ris.pos = cap * xv *(x-xv/2)-cam/2*(x-xw)^2;
end


end









