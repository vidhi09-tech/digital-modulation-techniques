clc;
close all;
clear all;
data=input('enter the input: ');
a=[];
b=[];
L=length(data);
t=linspace(0,L,100*L);
A=2;
f=2;
c=A*sin(2*pi*f*t);
for i=1:L
    if data(i)==1
        a=ones(1,100);
    else
        a=-1*ones(1,100);
    end
    b=[b a];
end
z=c.*b;
N = length(z);
v = abs(fft(z,N));
u = fftshift(v);

figure(1)
subplot(4,1,1)
plot(data)
title('data sequence');
subplot(4,1,2)
plot(b)
axis([0 800 -1.5 1.5]);
title('uniploar NRZ signal');
subplot(4,1,3)
plot(c)
title('carrier signal');
subplot(4,1,4)
plot(z,'r')
title('psk modulated signal');

figure(2)
stem(u)
title('spectrum of psk');