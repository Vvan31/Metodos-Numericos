function biseccion()
syms f(x)
g = 9.81; %gravedad 
c = 15; %coeficiente de friccion
v = 36; %velocidad 
t = 10; %tiempo 
%encontrar la masa 
f(x) = -2.75*x^3 +18*x^2 - 21*x-12
xl = 2;%valores iniciales 
xu = 2.5;
xr = 10;
Ev = 0;
Ea = 0;
while (f(xl)*f(xr))~= 0
    Ea = (((xl+xu)/2)- xr)/((xl+xu)/2);
    xr = (xl+xu)/2;
    Ev  = (59.9593 - xr)/59.9593;
    fprintf('El valor de f(%.3f)f(%.3f) = %.3f\n El valor de xr = %.3f\n Ea = %.3f Ev = %.3f\n',xl,xu, f(xl)*f(xu), xr, Ea, Ev);
    
    if  ((f(xl)*f(xr))<0)
        xu = xr;
    else
        xl = xr;
    end
end
disp(xr)
end