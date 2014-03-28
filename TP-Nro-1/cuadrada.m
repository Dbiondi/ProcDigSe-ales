function[t,s]=cuadrada(f_m,f,phi,t_ini,t_fin,a)
    t_n=1/f_m;
  	t=t_ini:t_n:(t_fin-t_n) 
    s=zeros(1,length(t))
    for i=1:length(s);
    x=mod((2*pi*f*t(i)+phi),2*pi);
      if x<pi
          s(i)=1;
      else
          s(i)=-1;
      end
    end
    stem(t,s);
end
