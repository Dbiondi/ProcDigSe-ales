function[t,s]=sinc(f_m,f,phi,t_ini,t_fin,a)
    t_n=1/f_m; %Calculamos el periodo con la frecuencia de muestreo f_m
	  t=t_ini:t_n:(t_fin-t_n) %Creamos el vector de muestras
       x=2*pi*f*t+phi; %Calculamos la senoidal para cada muestras
       if x==0
           s=1;
       else
           s=a*(sin(x))./x;
       end
   stem(t,s); %Graficamos
end
