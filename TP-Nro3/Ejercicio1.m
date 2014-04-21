function TP3Ejercio1()
T=0.001;
Fm = 1/T;
t_ini = 0;
t_fin = 1;
t=t_ini:T:t_fin-T;

s = sin(2*pi*10*t) + 4*sin(2*pi*20*t);

subplot(5,2,1);
plot(s);

%Calculo de la TDF
fsp=fftp(s);
subplot(5,2,2);
plot(fsp);

%Teorema de Parseval

e=energia(s);
f=energia(fsp);
f= f * (1/length(t));


disp('Si los valores correspondientes a la Energía de la Función y de TDF de la Funcion son iguales, entonces cumple con el Teorema de Parseval');

disp(e);

disp(f);

if e==f
    disp('Cumple con el Teorema Parseval');
else
    disp('No cumple con el Teorema Parseval');
end

%Primera Modificacion (s1+s2+4)
s=sin(2*pi*10*t) + 4*sin(2*pi*20*t);

subplot(5,2,3);
plot(s);

fsp=fftp(s);
subplot(5,2,4);
plot(fsp);

%Conclusion: En la mitad del rango se modifica la amplitud siendo esta 1000 veces el valor de la traslación de la funcion

%Segunda Modificacion (f1=10 f2=11)

s=sin(2*pi*10*t) + 4*sin(2*pi*11*t);

subplot(5,2,5);
plot(s);

fsp=fftp(s);
subplot(5,2,6);
plot(fsp);

%Conclusion: Se mantiene la amplitud máxima de 2000, pero en valores más próximos a la mitad del rango

%Tercera Modificacion (f1=10 f2=10.5)

s=sin(2*pi*10*t) + 4*sin(2*pi*10.5*t);

subplot(5,2,7);
plot(s);

fsp=fftp(s);
subplot(5,2,8);
plot(fsp);

%Conclusion: Disminuye la amplitud maxima, y esta se da en valores más próximos a la mitad del rango

%Cuarta Modificacion (Intervalo de tiempo [0...0.72])

t_ini = 0;
t_fin = 0.72;
t=t_ini:T:t_fin-T;

s = sin(2*pi*10*t) + 4*sin(2*pi*20*t);

subplot(5,2,9);
plot(s);

fsp=fftp(s);
subplot(5,2,10);
plot(fsp);

%Conclusion: La mitad del rango se modifica de 500 a aprox 350 y se disminuye la amplitud maxima

end

function [fsp] = fftp(s)
	%Calcula la transformada y la postprocesa para mostrarla correctamente
	fs = abs(fft(s));%Fundamental el valor absoluto aca!
	N = length(fs);
	vm = floor(N/2);%En el caso que la longitud sea impar???

	fsp = zeros(1,N);%Vector de valores acomodados inicializado

	%Valores negativos
	for i = 1:vm
		fsp(i) = fs(vm + i);%desde vm +1 hasta N 
    end
	%Valores positivos
	for i = vm+1:N 
		fsp(i) = fs(i - vm);%desde 1 hasta vm +1 
    end
end

function [e]=energia(s)
    n=length(s);
    e=0;
    for i=1:1:n
        e=e+abs(s(i))^2;
    end
end
