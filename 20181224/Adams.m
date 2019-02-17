
f=@(x,y)-x^2*y^2;

for l=(0:4)
    y=3;
    yn_1=3;
    yn_2=3;
    yn_3=3;
    
    h=0.1/2^l;
    y0=3/(1+1.5^3);
    
    x=0;
    k1=f(x,y);
    k2=f(x+0.5*h,y+0.5*h*k1);
    k3=f(x+0.5*h,y+0.5*h*k2);
    k4=f(x+h,y+h*k3);
    y=y+h/6*(k1+2*k2+2*k3+k4);%now n=1, y is the value when x = h
    
    x=h;
    k1=f(x,y);
    k2=f(x+0.5*h,y+0.5*h*k1);
    k3=f(x+0.5*h,y+0.5*h*k2);
    k4=f(x+h,y+h*k3);
    yn_1=y;%now n=2,y is the value when x = 2h
    y=y+h/6*(k1+2*k2+2*k3+k4);
    
    x=2*h;
    k1=f(x,y);
    k2=f(x+0.5*h,y+0.5*h*k1);
    k3=f(x+0.5*h,y+0.5*h*k2);
    k4=f(x+h,y+h*k3);
    yn_2=yn_1;%now n=3,y is the value when x = 3h
    yn_1=y;
    y=y+h/6*(k1+2*k2+2*k3+k4);
    
    for x = (3*h:h:1.5-h)
        temp=y;
        y=y+h/24*(55*f(x,y)-59*f(x-h,yn_1)+37*f(x-2*h,yn_2)-9*f(x-3*h,yn_3));
        
        
        y=temp+h/24*(9*f(x+h,y)+19*f(x,temp)-5*f(x-h,yn_1)+f(x-2*h,yn_2));
        yn_3=yn_2;
        yn_2=yn_1;
        yn_1=temp;
    end
    if l ~= 0
        fprintf("ok=%.15e\n",log(err/(y0-y))/log(2))
    end
    err = y0-y;
    if l~=4
        fprintf("h=%.15e,err=%.15e,",h,err);
    end
end

