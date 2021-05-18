function x = gaussSimple(A,B)
%     A = [3 2;5 8];
%     B = [4;1];
    x = [];
    n = length(A);
    % Primer: Eliminacion de incognitas
    for k = 1 : n - 1
        for i = k + 1 : n
            for j = k + 1 : n
                A(i,j)= (A(i,k)/A(k,k))*A(k,j) -A(i,j); %a21 = a21/a11*R1 -R2 = 0
            end
            B(i,1) = (A(i,k)/A(k,k))* B(k,1) - B(i,1);
            A(i,k)= 0;
        end
    end
    % Segundo paso: sustitucion  hacia atras
    x(n,1) = B(n,1)/A(n,n);
    for i = n-1 : -1:1
        suma = B(i,1);
        for j = i+1 : n
            suma = suma - A(i,j)*x(j,1);
        end
        x(i,1) = suma/A(i,i);
    end
end