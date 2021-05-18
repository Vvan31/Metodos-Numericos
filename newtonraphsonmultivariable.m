function newtonraphsonmultivariable()
    syms  x y z f1(x,y,z) f2(x,y,z) f3(x,y,z) 
    %valores iniciales%
    x0=1; y0=1; z0=1; 
    x1=0; y1=0;z1=0;
    Es = 0.05;
    Ea=Es+2;
    while Ea>= Es
        %deriv de f1 
        df1x=3; 
        df1y=z0*sin(y0*z0);
        df1z=y0*sin(y0*z0);
        
        %derivadas de f2
        df2x=2*x0;
        df2y=-1250*y0;  
        df2z=0;
        
        %derivadas de f3
        df3x=-y0*exp(-x0*y0);
        df3y=-x0*exp(-x0*y0);
        df3z=20;
        
        %funciones 
        f1 =3*x0 - cos(y0*z0) - 0.5;
        f2 = x0^2 - 625*(y0^2);
        f3 = exp(-x0*y0) + 20*z0 + (10*pi - 3)/3;
        
        %Se arma la matriz y se resuelve con gauss
        A =[df1x df1y df1z; df2x df2y df2z; df3x df3y df3z];
        B = [-f1;-f2;-f3];
        hjk = gaussSimple(A,B);
        %se suman los resultados a las variables
        x1 = x0 + hjk(1);
        y1 = y0 + hjk(2);
        z1 = z0 + hjk(3);
        fprintf('la respuesta es x: %.2f, y: %.2f y z: %.2f\n', x1, y1,z1)
        
        %error 
        Ea = abs((x1-x0)/x1)*100;
        x0=x1;
        y0=y1;
        Z0 = z1;
    end
end


