function TP2Ejercicio6()
    %Inicializo las variables
    f_m=10;
    t_ini=0;
    t_fin=1;
    
    %Calcúlo el Período.
    T=1/f_m;
    %Genero el vector de Períodos.
    t=t_ini:T:t_fin-T;
   
    %Vector de alfas (Coeficientes de la combinación)
    alpha=[5 18 23 5 8 43 54 12 9 11];
    
    %Vector de senos
    sins=zeros(1,length(alpha));
    %Vector suma de senos
    sins_total=zeros(1,length(alpha));
    %Vector de frecuencias bases
    f=[1,2,3,4,5,6,7,8,9,10];
    
    %Combinación lineal de las 10 señales con frecuencias base
    %y alfas diferentes
    for i=1:10
        sins(i, :)=sin(2*pi*f(i).*t);
        sins_total=sins_total+sins(i,:)*alpha(i);
    end
    
    %Vector donde acumulo los resultados del producto punto
    parecidos=zeros(1,length(sins));
    
    %Medimos el grado de parecido (Producto punto)
    for i=1:10
        parecidos(i)=dot(sins(i,:),sins_total)/dot(sins(i,:),sins(i,:));
    end
    
    figure;
    subplot(2,1,1);
    bar(sins_total);
    title('Alfa y Frecuencias diferentes con Fase cero');
    subplot(2,1,2);
    bar(parecidos);
    title('Nivel de parecido, Alfa y Frecuencia diferentes con Fase cero');
    
    %PARTE B
    
    fases=[2,34,7,8,9,12,45,22,10,6];
    fases_pi=zeros(1,length(fases));
    
    for i=1:10
        fases_pi(i)=fases(i)*pi;
    end
    
    for i=1:10
        sins(i, :)=sin(2*pi*f(i).*t+fases(i));
        sins_total=sins_total+sins(i,:)*alpha(i);
    end
    
    %Vector donde acumulo los resultados del producto punto
    parecidos=zeros(1,length(sins));
    
    %Medimos el grado de parecido (Producto punto)
    for i=1:10
        parecidos(i)=dot(sins(i,:),sins_total)/dot(sins(i,:),sins(i,:));
    end
    
    figure
    subplot(2,1,1);
    bar(sins_total);
    title('Alfa y Frecuencias diferentes con Fase diferentes');
    subplot(2,1,2);
    bar(parecidos);
    title('Nivel de parecido, Alfa y Frecuencia diferentes con Fase diferentes');
    
%     PARTE C
%     Genero una señal cuadrada
%     cuad=zeros(1,length(t));
%     cuad_total=zeros(1,length(cuad));
%     
%     for j=1:length(cuad);
%         for i=1:length(cuad);
%               x=mod((2*pi*5.5*t(i)+fases(i)),2*pi);
%               if x<pi
%                   cuad(i,j)=1;
%               else
%                   cuad(i,j)=-1;
%               end
%         end
%     end
%     
%     for i=1:10
%         cuad_total=cuad_total+cuad(i,:)*alpha(i);
%     end
%     %Vector donde acumulo los resultados del producto punto
%     parecidos=zeros(1,length(cuad));
%     
%     for i=1:10
%         parecidos(i)=dot(cuad(i,:),cuad_total)/dot(cuad(i,:),cuad(i,:));
%     end

%     Creamos una senial cuadrada de 5,5 Hz
frec = 5.5;
cuad = sign(sin(2*pi*frec*t));

    for i=1:10
        parecidos(i) = sum(sins(i,:) .* cuad);
    end

    figure
    bar(parecidos);
    title('Nivel de parecido, Func Cuadrada Alfa y Frecuencia diferentes con Fase cero');
end
