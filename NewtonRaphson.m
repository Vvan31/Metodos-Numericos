function NewtonRaphson(xini, Es)
syms f(x)
f(x)=input('cual es la funcion? ');

Vv = [];
Vv = double(solve(f==0, x));

df(x) = diff(f,x);
x(1) = xini;
Ea(1)=Es+1;
i = 1;

while Ea(i)>= Es
    i= i+1;
    k(i)= i-2;
    x(i) = x(i-1)-(f(x(i-1))/df(x(i-1)));
    Ea(i) = abs((x(i)-x(i-1))/x(i))*100;
end

fprintf('El valor incial de x_0 = %.3f\n', xini);
x = double(x);
fprintf('Las raices exactas son: %.3f\n', Vv);
 T = table([k(2:end)'],[x(2:end)'],[Ea(2:end)'],...
    'VariableNames',{'i','x_i+1','Epsilon_a'});
disp(T)
end