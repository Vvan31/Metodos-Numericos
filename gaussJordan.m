function X = GaussJordan(A,B)
%Ejemplos de formato para matrices 
%     A = [3 2;5 8];
%     B = [4;1];
    X = []; %para mostrar la repuesta x1, x2, x...n
    C = [A B]; %union para reducir a 0 
    n =length(C(:,1));
    for k=1 : n
        if C(k,k) > 0
            C(k,:) = C(k,:)/C(k,k); % se convierte a 1 y se divide toda la fila 
        end
        for j=1 : n
            if j~= k %si j en la columna k no son iguales 
               % se resta al renglon el pivote multiplicado al numero que se quiere hacer 0
                C(j,:)=-C(j,k)*C(k,:)+C(j,:); 
            end
        end
    end
    X = C(:,n+1); %Respuestas
%     fprintf("La solucion es:\n ")
%     disp(X)
end

