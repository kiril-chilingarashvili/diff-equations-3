load('Reference.mat')

%Define parameters 
m1 = 1;
m2 = 0.05;
k1 = 1;
%k2 = 0.02;
b1 = 0.001;
b2 = 0.02;
k2Sweep = linspace(0,0.5,100);
om = 1;
%Numerically solve DE at each forcing frequency
ampBuilding=zeros(length(k2Sweep));
for i=1:length(k2Sweep)

    k2 = k2Sweep(i);
    
    %Copy code to solve DE here
    x0 = [0;0;0;0];
    tvec = linspace(0,7000,35000);
    A = [
        0,                  0,          1.0,                0;
        0,                  0,          0,                  1.0;
        -(k1+k2)/m1,        k2/m1,      -(b1+b2)/m1,        b2/m1;
        k2/m2,              -k2/m2,     b2/m2,              -b2/m2
    ];
    [t,x] = ode45(@(t,x) A*x + [0;0;sin(om*t);0],tvec,x0);

    %Compute steady state solution and extract building oscillation amplitude 
    lt = length(t);
    per = 2*pi/om;
    [~,idx] = min(abs(t-(t(end)-5*per)));
    ampBuilding(i) = max(x(idx:lt,1));

end

%Plot
plot(OmRef,ampRef,'r'); hold on;
plot(k2Sweep,ampBuilding,'k');
xlim([0.7,1.3]); ylabel('Max. Amp. of Building'); xlabel('$\Omega$');
legend('Without TMD','With TMD')
