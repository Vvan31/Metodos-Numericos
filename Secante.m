function Secante()
syms f(x)
xi_1 = 1;
xini = 3;
Es = 10;
f(x)= sin(x)+cos(1+x^2)-1;

Vv = [];
Vv = double(solve(f==0, x));
fprintf(' vv: %.3f\n', Vv);

df(1) = (f(xini)- f(xi_1)/(xini - xi_1));
x(1) = xini;
x(2) = x(1)-(f(x(1))/df(1));
df(2) = (f(x(2))- f(x(1))/(x(2) - x(1)));
Ea(1)= Es+1;
Ea(2)= abs((x(2)-x(1))/x(2))*100;

i = 2;
while Ea(i)>= Es
    i= i+1;
    k(i)= i-2;
    df(i) = (f(x(i-1))- f(x(i-2))/(x(i-1) - x(i-2)));
    x(i) =  x(i-1)-(f(x(i-1))/df(i));
    Ea(i) = abs((x(i)-x(i-1))/x(i))*100;
end

fprintf('El valor incial de x_0 y x_-1 = %.3f ,  %.3f\n', xini,xi_1);
x = double(x);
fprintf('Las raices exactas son: %.3f\n', Vv);
 T = table([k(2:end)'],[x(2:end)'],[Ea(2:end)'],...
    'VariableNames',{'i','x_i+1','Epsilon_a'});
disp(T)
end