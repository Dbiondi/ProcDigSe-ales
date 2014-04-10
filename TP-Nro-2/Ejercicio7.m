function TP2Ejercicio7()
    %Frecuencia de muestreo de la señal original
    f_m = 11025;
    %Obtenemos los datos del archivo te.txt
    te = leerTE();
    
    %muestreo las señales a la misma frecuencia que la te.txt
    Ts = 1 / f_m;
    %0.7 * 10^4 muestras, por lo que mi t_fin son 0.7
    ts = 0 : Ts : 0.7 - Ts;
    
    %creo un vector de 12 valores, una para cada tecla del telefono 
    sins_nums = zeros(12,length(ts));
    frec_sins_H = [1209, 1336, 1477];
    frec_sins_V = [697, 770, 852, 941];
    
    %en s voy guardando la posicion de la fila que representa una señal (12 filas x ts columnas)
    s = 1;
    for i = 1 : 3
        for j = 1 : 4
            sins_nums(s,:) = sin(2*pi*frec_sins_H(i).*ts) + sin(2*pi*frec_sins_V(j).*ts);
            s = s + 1;
        end
    end
    
    %ancho del intervalo que voy a utilizar para sacar los numeros de la
    %señal original (numeros sacado a pata)
    interv = 0.7 * 10^4;
    inicio_num = [1.7, 2.6, 3.81, 4.68, 5.61, 6.87, 7.83];
    
    %guardo los 7 numeros de la llamada (te.txt) (codificados, no se cuales son)
    num_tecla = zeros(length(inicio_num),interv);
    
    %obtengo cada numero desde te.txt. Accedo a te con un subindice inicial
    %y uno final y guardo el vector resultante en cada fila de num_tecla 
    for i = 1 : length(inicio_num)
        num_tecla(i,:) = te(inicio_num(i)*10^4 : inicio_num(i)*10^4 + interv - 1);
    end
    
    %guardo los resultados de las comparaciones entre cada numero de te.txt
    %con cada numero del teclado numérico (0 al 9 y * = 10, 0 = 11, # = 12)
    result = zeros(12,1);
    llamada = zeros(1,length(inicio_num));
    for i = 1 : length(inicio_num)
        for j = 1 : 12
            %hago el producto punto. Cuanto mas parecidos los numeros, mas
            %cercano a 0 va a ser el resultado. Como sé que sins_nums es
            %periódica para valores mayores de 1477 (como max), puedo
            %acortar el intervalo desde 1 a 7000 (interv)
            result(j) = dot(num_tecla(i,:),sins_nums(j,(1:interv)));
        end
        
        %guardo el minimo de los valores de result. Ya que hay numeros 
        %negativos, tengo que usar el valor absoluto. Como me devuelve una
        %matriz con numeros repetidos, vale igual que agarre cualquiera de
        %ellos
        [~,b] = min(abs(result(:,1)));
        
        %guardo en el vector llamada aquellos numeros que tengan mayor
        %parecido a los de la llamada te.txt
        llamada(i) = b;
    end
    
    disp('Usted llamó al:');
    disp(llamada);
end

function te = leerTE()
    te = importdata('te.txt');
end
