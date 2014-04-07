function TP2Ejercicio6()
    T=1/10;
    t=0:T:1-T;
    
    alpha=[5 18 23 5 8 43 54 12 9 11];
    sins=zeros(1,length(alpha));
    sins_total=zeros(1,length(alpha));
    
    %Combinación lineal de las 10 señales con frecuencias de 1 a 10 y alfas
    %diferentes
    for i=1:10
        sins(i, :)=sin(2*pi*i.*t);
        sins_total=sins_total+sins(i, :)*alpha(i);
    end
    
    %Producto punto entre la comninacion lineal y cada una de las señales
    
    parecidos=zeros(1,length(sins));
    for i=1:10
        parecidos(i)=sum(sins(i, :).*sins_total)/dot(sins(i, :),sins(i, :));
    end
  
    bar(parecidos);
end
