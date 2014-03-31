function [me,va] = calculos_med_var_erg(mat,f,c)

%Inicializo v
va = zeros(1,f);
me = zeros(1,f);
medias = zeros(1,c);
varianzas = zeros(1,c);

%Primero calculo y almaceno las medias y las varianzas
for i = 1:f %Avanza sobre t
	tg = zeros(1,c);


	for j = 1:c %avanza sobre las diferentes señales
		tg(i) = mat(i,j);%devuelve la señal de la matriz mats fila i
    end

	%Calculo la media
	medias(i) = mean(tg); 

	%Calculo la varianza - Porque no esta centrada en 1???
	varianzas(i) = var(tg);

    end

me = mean(medias);
va = mean(varianzas);

end
