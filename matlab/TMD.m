%Define parameters 
m1 = 1.0;
m2 = 0.05;
k1 = 1.0;
k2 = 0.02;
b1 = 0.001;
b2 = 0.02;
om = 0.95;%[0.7,1.3];

%Numerically solve DE
x0 = [0;0;0;0];
tvec = linspace(0,7000,35000);
A = [
    0,                  0,          1.0,                0;
    0,                  0,          0,                  1.0;
    -(k1+k2)/m1,        k2/m1,      -(b1+b2)/m1,        b2/m1;
    k2/m2,              -k2/m2,     b2/m2,              -b2/m2
];
[t,x] = ode45(@(t,x) A*x + [0;0;sin(om*t);0],tvec,x0);

%Plot steady state solution
lt = length(t);
per = 2*pi/om;
[~,idx] = min(abs(t-(t(end)-5*per)));
plot(t(idx:lt),x(idx:lt,1),'b','linewidth',3); hold on;
plot(t(idx:lt),x(idx:lt,2),'r','linewidth',3); 
xlim([t(idx),t(lt)]); xlabel('$t$','interpreter','latex'); ylabel('$x(t)$','interpreter','latex');
legend('Building','TMD','location','northeast'); title('Steady State Solution');
set(gca,'fontsize',25)
disp(['Amplitude of building''s oscillation: ',num2str(max(x(idx:lt,1)),4)]);

