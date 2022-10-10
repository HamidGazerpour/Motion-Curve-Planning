function ris=mymotioncurve1(alpha,h)
% parameters

xv1=0.5; xv2=0.5;
a1=60; a2=360;
in=[0 a1 a2];

if alpha>= in(1) && alpha < in(2)           % rise
    da=(in(2)-in(1));
    alpha_ad=(alpha-in(1))/da;
    out=AccCosAsim(alpha_ad,xv1);
    ris.pos=h*out.pos;
    ris.vel=h/deg2rad(da)*out.vel;
    ris.acc=h/(deg2rad(da))^2*out.acc;
elseif alpha>=in(2) && alpha < in(3)       % dwell
    da=(in(3)-in(2));
    alpha_ad=(alpha-in(2))/da;
    out=0;
    ris.pos=h;
    ris.vel=0;
    ris.acc=0;

else
    da=0;
    alpha_ad=0;
    ris.pos=0;
    ris.vel=0;
    ris.acc=0;
end
end