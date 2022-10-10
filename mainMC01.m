close all; clear all; clc;

i=1;

for x=0:0.1:360
res=mymotioncurve(x,0.06);

t(i)=(x);
p(i)=res.pos;
v(i)=res.vel;
a(i)=res.acc;
i=i+1;
end

% figure;
% plot(t,p,'-',t,v,'--',t,a,':','LineWidth',2); grid;legend('Pos','Vel','Acc')

figure;
subplot(2,1,1);plot(t,p,'-',t,v,'--',t,a,':','LineWidth',2); grid;legend('Pos','Vel','Acc');
title('h = 0.06')

i=1;

for x=0:0.1:360
res=mymotioncurve(x,0.16);

t(i)=(x);
p(i)=res.pos;
v(i)=res.vel;
a(i)=res.acc;
i=i+1;
end
subplot(2,1,2);plot(t,p,'-',t,v,'--',t,a,':','LineWidth',2); grid;legend('Pos','Vel','Acc');
title('h = 0.16')

figure;
i=1;
for x=0:0.1:360
res=mymotioncurve2(x,0.16);

t(i)=(x);
p(i)=res.pos;
v(i)=res.vel;
a(i)=res.acc;
i=i+1;
end

subplot(3,1,1);plot(t,p,'-',t,v,'--',t,a,':','LineWidth',2); grid;legend('Pos','Vel','Acc');
title('Cubic Motion Curve')
i=1;
for x=0:0.1:360
res=mymotioncurve3(x,0.16);

t(i)=(x);
p(i)=res.pos;
v(i)=res.vel;
a(i)=res.acc;
i=i+1;
end

subplot(3,1,2);plot(t,p,'-',t,v,'--',t,a,':','LineWidth',2); grid;legend('Pos','Vel','Acc');
title('Cycloidal Motion Curve')
i=1;
for x=0:0.1:360
res=mymotioncurve4(x,0.16);

t(i)=(x);
p(i)=res.pos;
v(i)=res.vel;
a(i)=res.acc;
i=i+1;
end

subplot(3,1,3);plot(t,p,'-',t,v,'--',t,a,':','LineWidth',2); grid;legend('Pos','Vel','Acc');
title('S-shape Motion Curve')