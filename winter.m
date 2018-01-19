[y,fs]=audioread('kayit.wav');
pOrig = audioplayer(y,fs);
N=size(y,1);
figure
subplot(2,1,1);
stem(1:N, y(:,1));
title('kanal 1');
subplot(2,1,2);
stem(1:N, y(:,2));
title('kanal 2');
df = fs / N;
w = (-(N/2):(N/2)-1)*df;
f = fft(y(:,1),N)/N;
y2 = fftshift(f);
figure;
subplot(2,1,1)
plot(w,abs(y2));
n = 2;
beginFreq = 7000 / (fs/2);
endFreq = 12000 / (fs/2);
[b,a] = butter(n, [beginFreq, endFreq], 'bandpass');
fOut = filter(b, a, y);
b=2*b;
s=2*a;
p = audioplayer(fOut, fs);
p.play;
subplot(2,1,2)
plot(fOut)
