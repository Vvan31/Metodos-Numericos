function Rpolinomial()  
    format shortG %formato para poder leer bien los resultados
    
    x = xlsread('epolinomial', 2, 'A:A');
    y = xlsread('epolinomial', 2, 'B:B'); %nombre doc, hoja, rango columna
    
    orden = 2;
    n = length(x);
    A = zeros(orden+1, orden+1);
    B = zeros(orden+1,1);
    %matriz A y B
    for j = 1:orden+1%renglon 
        for i = 1:n
         	B(j,1)= B(j,1)+(y(i)* x(i)^(j-1));
        end
        for m=1:orden+1 %columna 
            for i = 1:n %suma 
                A(j,m) = A(j,m) + x(i)^(m+j-2);
            end
        end
    end
    [ai] = gaussSimple(A,B); %resolver para a0, a1 y a2
    
%     coeficiente de determinacion      
    r2 = 0; %coeficinte de determinacion st-sr/st
    st = 0; %sum i->n(yi -ymedia)^2
    sr = 0; %suma e^2 e= puntos menos la funcion quese aproxima 
    M = mean(y);

    for i = 1:n
        sr = sr + ((y(i) - ai(1,1)) - (ai(2,1)*x(i)) - (ai(3,1)*(x(i)^2)))^2;
        st = st + (y(i)-M)^2;
    end
    r2 = (st-sr)/st;
    fprintf("coeficinte de determinacion: %.5f\n",r2)
    %armar funcion 
    fprintf("y = %.5f ", ai(1,1));
    for i = 2:orden+1
        fprintf(" + %.5fx^%.0f", ai(i,1),i-1);
    end
    fprintf("\n")
end