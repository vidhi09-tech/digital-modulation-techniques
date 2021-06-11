clc;
clear all;
close all;

f = 10;
x = input('sequence');
l = length(x);
t = linspace(0,1,(1*100));
c = cos(2*pi*f.*t);

x1 = [];
for i = 1:l
    if x(i)==1
        h = ones(1,100);
    else
        h = zeros(1,100);
    end
    x1 = [x1 h];
end
x2 =[];
for i = 1:l
    if x(i) == 1
        h1 = cos(2*pi*(f+5).*t);
    else
        h1 = cos(2*pi*(f-5).*t);
    end
    x2 = [x2 h1];
end

subplot(311)
plot(c)
xlabel('time');
ylabel('amplitude');
title('carrier signal');
subplot(312)
plot(x1)
xlabel('time');
ylabel('amplitude');
title('uniploar NRZ signal');
subplot(313)
plot(x2)
xlabel('time');
ylabel('amplitude');
title('fsk modulated signal');
 

N = length(x2);
v = abs(fft(x2,N));
u = fftshift(v);
figure(2)
stem(u)
title('spectrum of fsk');
    