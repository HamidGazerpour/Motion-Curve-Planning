function out = AccCosAsim(x,xv)

if xv<0 || xv>0.999
    return;
end

if x <= xv
    out.acc = 2/xv;
    out.vel = out.acc *x;
    out.pos = 0.5 *out.acc *x^2;
else
    out.acc = -2/(1-xv);
    out.vel = 2/(1-xv) *(1-x);
    out.pos = 2/(1-xv) *(x-x^2/2-xv/2);
end