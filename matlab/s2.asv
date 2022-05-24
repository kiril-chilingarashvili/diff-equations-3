a = sym('a');
b = sym('b');
x = sym('x');
y = sym('y');
z = sym('z');

disp('-------------------')
disp('-------------------')
disp('-------------------')
aval = 0.5;
bval = 1.8;

CritPoints = [
    1/(a + b + 1), 1/(a + b + 1), 1/(a + b + 1);
    0,0,0;
    1,0,0;
    0,1,0;
    0,0,1;
    1-a,1-b,0;
    1-b,0,1-a;
    0,1-a,1-b
];
functions = [
    x-x^2-a*x*y-b*x*z;
    y-y^2-b*x*y-a*y*z;
    z-z^2-a*x*z-b*y*z
];
for i = 1:size(CritPoints,1)
eigenvalues(CritPoints(i, 1),CritPoints(i, 2),CritPoints(i, 3), aval, bval);
end
IC_1 = [0.3,0.3,0.1];
IC_2 = [0.7,0.3,0.7];
IC_3 = [0.2,0.1,0.1];
tspan = [0, 300];
opts = odeset('AbsTol', 1e-7, 'RelTol', 1e-7);
ff = subs(subs(functions, a, aval), b, bval);
odefun = @(t,x_) f4(t,x_,ff);
% disp(odefun(1,[1,1,1]));
[t1, sol1] = ode45(odefun, tspan, IC_1, opts);
[t2, sol2] = ode45(odefun, tspan, IC_2, opts);
[t3, sol3] = ode45(odefun, tspan, IC_3, opts);

figure
plot(sol1(:,1),sol1(:,2), 'LineWidth', 1)
hold on
plot(sol2(:,1), sol2(:,2), 'LineWidth', 1)
plot(sol3(:,1), sol3(:,2), 'LineWidth', 1)
figure
plot(sol1(:,2),sol1(:,3), 'LineWidth', 1)
hold on
plot(sol2(:,2), sol2(:,3), 'LineWidth', 1)
plot(sol3(:,2), sol3(:,3), 'LineWidth', 1)
figure
plot(sol1(:,1),sol1(:,3), 'LineWidth', 1)
hold on
plot(sol2(:,1), sol2(:,3), 'LineWidth', 1)
plot(sol3(:,1), sol3(:,3), 'LineWidth', 1)
figure
plot3(sol1(:,1), sol1(:,2),sol1(:,3), 'LineWidth', 1)
hold on
plot3(sol2(:,1), sol2(:,2), sol2(:,3), 'LineWidth', 1)
plot3(sol3(:,1), sol3(:,2), sol3(:,3), 'LineWidth', 1)

function odefun = f4(t, x_, ff)
% disp('x_');
% disp(x_);
% disp('-----');
x = sym('x');
y = sym('y');
z = sym('z');
odefun = double(simplify(subs(subs(subs(ff, x, x_(1)), y, x_(2)), z, x_(3))));
% disp('odefun');
% disp(size(odefun));
% disp('-------')
end

function Dval  = eigenvalues(xx,yy,zz, aaval, bbval)
x = sym('x');
y = sym('y');
z = sym('z');
a = sym('a');
b = sym('b');

J = [
    1-2*x-a*y-b*z, -a*x, -b*x;
    -b*y, 1-2*y-b*x-a*z, -a*y;
    -a*z, -b*z, 1-2*z-a*x-b*y
];
J0 = subs(J,  x, xx);
J0 = subs(J0, y, yy);
J0 = subs(J0, z, zz);
J0 = simplify(J0);
[V,D]=eig(J0);
D1 = simplify(D(1,1));
D2 = simplify(D(2,2));
D3 = simplify(D(3,3));
Dval = real(subs(subs(simplify(D), a, aaval), b, bbval));
disp(sprintf('x=%s;y=%s;z=%s',real(subs(subs(simplify(xx), a, aaval), b, bbval)),real(subs(subs(simplify(yy), a, aaval), b, bbval)),real(subs(subs(simplify(zz), a, aaval), b, bbval))));
disp(Dval);
disp('-------------------')
end