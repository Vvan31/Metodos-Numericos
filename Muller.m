function Muller(x0,x1,x2,epsilon_s)
    syms f(x)
    f(x)=input('Ingresa funcion \n');
    x(1)=x0;
    x(2)=x1;
    x(3)=x2;
    i=4;

    epsilon_a(3)=epsilon_s+0.1;

    while epsilon_a(i-1)>= epsilon_s
        k(i)=i-3;
        h0=x(i-2)-x(i-3);
        h1=x(i-1)-x(i-2);
        d0=double(f(x(i-2))-f(x(i-3)))/(x(i-2)-x(i-3));
        d1=double(f(x(i-1))-f(x(i-2)))/(x(i-1)-x(i-2));
        c=f(x(i-1));
        a=(d1-d0)/(h0+h1);
        b=a*h1+d1;

        if abs(b+sqrt(b^2-4*a*c)) > abs(b-sqrt(b^2-4*a*c))
            x(i)=x(i-1)-((2*c)/(b+sqrt(b^2-4*a*c)));
        else
           x(i)=x(i-1)-((2*c)/(b-sqrt(b^2-4*a*c))); 
        end

        epsilon_a(i)=abs((x(i)-x(i-1))/x(i))*100;
        i=i+1;
    end

    x=double(x);

    varNames={'i','Xr','Ea'};
    T=table([k(4:end)'],[x(4:end)'],[epsilon_a(4:end)'],'VariableNames',varNames)

end
