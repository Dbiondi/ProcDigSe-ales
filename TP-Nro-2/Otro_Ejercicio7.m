function TP2Ejercicio7()
    %Calculo de Sumas de Senoidales, que representan los números de un
    %teclado telefonico
    
    Frec_V=[1209, 1336, 1477];
    Frec_H=[697, 770, 852, 941];
    
    f_m=11025;
    T=1/f_m;
    t_ini=0;
    t_fin=0.7; 
    
    t=t_ini:T:t_fin-T;    
    Mat_signal=zeros(12,length(t)); 
    
    s=1;
    for i=1:3
        for j=1:4
            Mat_signal(s,:)=(sin(2*pi*Frec_V(i).*t))+(sin(2*pi*Frec_H(j).*t));
            s=s+1;
        end
    end
    %10=*
    %11=0
    %12=#

    signal=importdata('te.txt');
    rango=0.7; %0.7*(10^4)
    V_ini=[1.7, 2.6, 3.81, 4.68, 5.61, 6.87, 7.83];
    Num_signal=zeros(length(V_ini),rango*(10^4));

    for i=1:length(V_ini)
        Num_signal(i,:)=signal(V_ini(i)*(10^4):(V_ini(i)*(10^4)+rango*(10^4))-1);
    end


    V_similar=zeros(12,1);
    V_resultado=zeros(1,length(V_ini));

    for i=1:length(V_ini)
        for j=1:12
            V_similar(j)=dot(Num_signal(i,:),Mat_signal(j,(1:(rango*(10^4)))));
        end
        [~,p]=min(abs(V_similar(:,1)));
        V_resultado(i)=p;
    end

    disp('Numero Discado');
    for i=1:length(V_resultado);
        if (V_resultado(i)==10)
            disp('*');
        else
            if (V_resultado(i)==11)
                disp('0');
            else
                if (V_resultado(i)==12)
                    disp('#');
                else
                    disp(V_resultado(i));
                end
            end
        end
    end
end
