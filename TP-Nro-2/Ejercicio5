function [t,s]=TP2Ejercicio5(op)
    if (op~=1 && op~=2)
        disp('Elija solo entre la opción 1 y 2');
        return 
    else
        %Número de cant de funciones de Legendre.
        %Generamos la señal de la página 61 del libro de teoría
        T=1/1000; %Periodo
        t=-1:T:1-T; 
        n=length(t); 
        s=zeros(1,n);

        %Funcion escalon
        y=escalon(t);
        switch(op)
            case 1
                y_aprox_tres = aprox_tres(t);
                error_cuadratico_tres = (norm(y - y_aprox_tres, 2))^2;
                disp('Error Cuadratico para Gauss Legendre con n=3');
                disp(error_cuadratico_tres);
                plot(t, y, 'k', t, y_aprox_tres, 'r');
            case 2
                y_aprox_cinco = aprox_cinco(t, sqrt(3/2), - sqrt(7/32), sqrt(11/128));
                error_cuadratico_cinco = (norm(y - y_aprox_cinco, 2))^2;
                disp('Error Cuadratico para Gauss Legendre con n=5');
                disp(error_cuadratico_cinco);
                plot(t, y, 'k', t, y_aprox_cinco, 'r');
        end
    end
end
