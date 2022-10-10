function ris = MCMtraposoidal(alpha_ad)

da1 = 0.1429; da2 = 0.1429; da3 = 0.1429; da4 = 0.1429; da5 = 0.1429; da6 = 0.1429; da7 = 0.1429;
coe1 = 2/pi;
in = [da1 da2 da3 da4 da5 da6 da7];
a11 = coe1*in(1)+in(2)+coe1*in(3);
a12 = -1*coe1*in(5)-in(6)-(coe1*in(7));
a21 = coe1*in(1)*(in(1)*(1-coe1)+0.5*in(2))+(coe1*in(1)+in(2))*(0.5*in(2)+in(3)*(1-coe1))+(coe1*in(1)+in(2)+coe1*in(3))*(coe1*in(3)+in(4)+coe1*in(5));
a22 = (coe1*in(7)+in(6))*(in(5)*(1-coe1)+0.5*in(6))+coe1*in(7)*(0.5*in(6)+(1-coe1)*in(7));
A = (-1)*a12/(a11*a22-a12*a21);
B = a11/(a11*a22-a12*a21);
a1 = in(1); a2 = a1+in(2); a3 = a2+in(3); a4 = a3+in(4);
a5 = a4+in(5); a6 = a5+in(6); a7 = sum(in);
v_y1 = A*coe1*in(1);
p_y1 = A*coe1*(in(1)^2)*(1-coe1); 
v_y2 = v_y1+A*in(2); 
p_y2 = p_y1+A*in(2)*(coe1*in(1)+0.5*in(2));
v_y3 = v_y2+A*coe1*in(3);
p_y3 = p_y2+A*in(3)*(coe1*in(1)+in(2)+(coe1^2)*in(3));
v_y4 = v_y3;
p_y4 = p_y3+A*da4*(coe1*da1+da2+(coe1^2)*da3);
v_y5 = v_y4-B*coe1*da5;
p_y5 = p_y4+A*da5*(coe1*da1+da2+coe1*da3)-B*coe1*(da5^2)*(1-coe1);
v_y6 = v_y5-B*da6;
p_y6 = p_y5+v_y5*da6-B*0.5*da6^2;

if (alpha_ad>=0 && alpha_ad<a1)                     %rise
ris.pos = A*coe1*in(1)*(alpha_ad-coe1*in(1)*sin(alpha_ad/(coe1*in(1))));
ris.vel = A*coe1*in(1)*(1-cos(alpha_ad/(coe1*in(1))));
ris.acc = A*sin(alpha_ad/(coe1*in(1)));

elseif (alpha_ad>=a1 && alpha_ad<a2)                 %dwell
ris.pos = p_y1+v_y1*(alpha_ad-a1)+A*0.5*(alpha_ad-a1)^2;
ris.vel = v_y1+A*(alpha_ad-a1);
ris.acc = A;

elseif (alpha_ad>=a2 && alpha_ad<a3)                 %return
ris.pos = p_y2+v_y2*(alpha_ad-a2)+A*(coe1*in(3))^2*(1-cos((alpha_ad-a2)/(coe1*in(3))));
ris.vel = v_y2+A*coe1*in(3)*sin((alpha_ad-a2)/(coe1*in(3)));
ris.acc = A *cos((alpha_ad-a2)/(coe1*in(3)));

elseif (alpha_ad>=a3 && alpha_ad<a4)                  %dwell
ris.pos = p_y3+v_y3*(alpha_ad-a3);
ris.vel = v_y3;
ris.acc = 0;

elseif (alpha_ad>=a4 && alpha_ad<a5)
ris.pos = p_y4+v_y4*(alpha_ad-a4)-B*coe1*da5*(alpha_ad-a4-coe1*da5*sin((alpha_ad-a4)/(coe1*da5)));
ris.vel = v_y4-B*coe1*da5*(1-cos((alpha_ad-a4)/(coe1*da5)));
ris.acc = -B*sin((alpha_ad-a4)/(coe1*da5));

elseif (alpha_ad>=a5 && alpha_ad<a6)                 
ris.pos = p_y5+v_y5*(alpha_ad-a5)-B*0.5*(alpha_ad-a5)^2;
ris.vel = v_y5-B*(alpha_ad-a5);
ris.acc = -B;

elseif (alpha_ad>=a6 && alpha_ad<a7)
ris.pos = p_y6+v_y6*(alpha_ad-a6)-B*((coe1*da7)^2)*(1-cos((alpha_ad-a6)/(coe1*da7)));
ris.vel = v_y6-B*coe1*da7*sin((alpha_ad-a6)/(coe1*da7));
ris.acc = -B*cos((alpha_ad-a6)/(coe1*da7));

else
ris.pos = 0 ;
ris.vel = 0;
ris.acc = 0;
end
end