function [t,s]=TP2Ejercicio5(op)
    if (op~=1 && op~=2)
        disp('Elija solo entre la opción 1 y 2');
        return 
    else
        T=1/1000; %Periodo
        t=-1:T:1-T; 
        n=length(t); 
        s=zeros(1,n);

        % Generamos una funcion escalon
        y=escalon(t);
        switch(op)
            case 1 
                %Gauss Legendre con n=3
                y_aprox_tres = aprox_tres(t);
                %Calculo del error cuadratico
                error_cuadratico_tres = (norm(y - y_aprox_tres, 2))^2;
                disp('Error Cuadratico para Gauss Legendre con n=3');
                disp(error_cuadratico_tres);
                plot(t, y, 'k', t, y_aprox_tres, 'r');
            case 2 
                %Gauss Legendre con n=5
                y_aprox_cinco = aprox_cinco(t, sqrt(3/2), - sqrt(7/32), sqrt(11/128));
                %Calculo del error cuadratico
                error_cuadratico_cinco = (norm(y - y_aprox_cinco, 2))^2; %E
                disp('Error Cuadratico para Gauss Legendre con n=5');
                disp(error_cuadratico_cinco);
                plot(t, y, 'k', t, y_aprox_cinco, 'r');
        end
    end
end

function [y]=escalon(t)    
n=length(t);
    for i=1:n
        if t(i)<0
            y(i)=-1;
        else
            y(i)=1;
        end
    end
end

function [aprox]=aprox_tres(t) 
    for i = 1 : length(t)
		aprox(i) = (45/16)*t(i) - (35/16)*t(i)^3;
    end
end
    
function [aprox] = aprox_cinco(t, a1, a3, a5)
	for i = 1 : length(t)
		aprox(i) = a1 * (sqrt(3/2)*t(i)) + a3 * (sqrt(7/2)*((5/2)*t(i)^3 - (3/2)*t(i))) + a5 * (sqrt(11/128) * (15*t(i) - 70*t(i)^3 + 63*t(i)^5));
    end
end   
