clc;
clear all;
close all;
d = input('enter the binary data');
a = [];
b = [];
k = length(d);
t = linspace(0,k,150*k);
c = 4*sin(2*pi*2*t);
for i = 1:k;
    if d(i) == 0;
        a = zeros(1,150);
    else
        a = ones(1,150);
    end
    b = [b a];
end
ask_mod = c.*b;
N = length(ask_mod);
v = abs(fft(ask_mod,N));
z = fftshift(v);
figure(1)
subplot(411)
plot(d)
title('data sequence');
subplot(412)
plot(b)
title('uniploar NRZ signal');
axis([0 150*k -2 2]);
subplot(413)
plot(c)
title('carrier signal');
subplot(414)
plot(ask_mod)
title('ask modulated signal');
figure(2)
stem(z)
title('spectrum of ask');