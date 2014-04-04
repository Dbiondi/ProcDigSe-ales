function TP2Ejercicio1()
    %Generamos una senoidal
    f_m=100;
    f=20;
    phi=0;
    t_ini=0;
    t_fin=1;
    a=1;
    
    [t1,s1]=senoidal(f_m,f,phi,t_ini,t_fin,a);
    
    
    %Generamos una cuadrada
    [t2,s2]=cuadrada(f_m,f,phi,t_ini,t_fin,a);
    
    
    %Generamos una aleatoria con media=0 y varianza=1
    s3=randn(1,f_m);
    
    %Generamos una rampa
    
    
    %Valor medio
    
    print('Media Sinusoidal');
    med1=mean(s1);
    print(med1);
    print('Media Cuadrada');
    med2=mean(s2);
    print(med2);
    print('Media Aleatoria');
    med3=mean(s3);
    print(med3);
    print('Media Rampa');
    med4=mean(s4);
    print(med4);
    %valor máximo
    
    print('Valor Maximo Sinusoidal');
    max(s1);
    
    
    %valor mínimo
    print('Valor Minimo Sinusoidal');
    v_min=min(s1);
    print(v_min);
    
    %Amplitud / Equivalente a Norma p con p=infinito
    print('Valor Minimo Sinusoidal');
    v_max=max(abs(s1));
    print(v_max);
    
    %Energía / La energía elevada al cuadrado equivale a la Norma p con p=2
    e1=energia(s1);
    print('Energía Sinusoidal')
    print(e1);
    
    %Acción = Norma p con (p=1)
    norma1=norm(s1,1);
    print('Norma 1 Sinusoidal');
    print(norma1);
    
    %Potencia media
    pot1=potencia(s1);
    print('Potencia Sinusoidal');
    print(pot1);
    
    %Raíz del valor cuadratico medio
    rms1=sqrt(pot1);
    print('Raíz del valor cuadratico medio Sinusoidal');
    print(rms1);
end
    
    

