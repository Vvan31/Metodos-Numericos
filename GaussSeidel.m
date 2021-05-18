function GaussSeidel (A,B, epsilon_s)
    %Ejemplos de formato para matrices 
%     A = [3 2;5 8];
%     B = [4;1];
    C = [A B]; %union para tamano
    n =length(C(:,1));
    %poner zeros en iteracion inicial 
    x0=zeros(1,n);
    x=x0;
    
    error = epsilon_s+10;%error
    k = zeros(1,n); %itracion para error 
    
    while error >epsilon_s %mientras sea mayor que el error 
        k = x; %resultado anterior 
        for i = 1:n
            suma=0;
            for j = 1:n
                if i~=j
                    suma = suma + A(i,j) * x(j);
                end
            end
            x(i) = (B(i) - suma) / A(i,i);
            fprintf('\n resultado : %10.4f',x(i));
        end
        fprintf('\n');
        error = ((x-k)/x)*100;
        disp((x-k)/x)
    end
end