a = sym('a', 'positive');
b = sym('b', 'positive');
A = [
    1,a,b;
    b,1,a;
    a,b,1
];
b = [
    1;
    1;
    1
];
% A*x = [1;1;1]
x = A\b
