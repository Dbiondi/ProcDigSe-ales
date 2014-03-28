function[t,s]=senoidal(f_m,f,phi,t_ini,t_fin,a)
	t_n=1/f_m; %Calculamos el periodo con la frecuencia de muestreo f_m
	t=t_ini:t_n:t_fin-t_n; %Creamos el vector para recorrer las muestras
	s=a*sin(2*pi*f*t+phi); %Calculamos la función senoidal para cada muestra
	stem(t,s); %Graficamos
end
