#Jamie Juntorn Thiantanukij 2021610213
#Last Three digits 213 (200, 10, 3)
#pkg load signal

function moddemod = project
  
    %Variables 
  Fc = 1000; #Carrier Frequency
  Fs = Fc*10; #sampling frequency
  Fm1 = 200; #Message Signal 1
  Fm2 = 10; #Message Signal 2
  Fm3 = 3; #Message Signal 3
  ET = 0.1; # End-Time
  t = -0.1:1/Fs:ET; #Time vector
  A =  1;  #Modulation Index
  
    % Equation stuff
  mt = cos(2*pi*Fm1*t) - (1/3)*cos(2*pi*Fm2*t) + (1/5)*cos(2*pi*Fm3*t); #message signal
  cw = A.*(cos(2*pi*Fc*t)); #carrier wave
  xt = mt.*cw; #modded signal
  
  %-----------Modding-------------
  
  %Graph 1
  figure(1);
  subplot(4,1,1)
  plot(t,mt);
  xlabel('Time'), ylabel('Amplitude'); #Message Signal
  grid on
  title('Message Signal')
  
  
  %Graph 2
  figure(1);
  subplot(4,1,2)
  plot(t,cw);
  xlabel('Time'), ylabel('Amplitude'); #Carrier Wave
  grid on
  title('Carrier Wave')
  
  
  %Graph 3
  figure(1);
  subplot(4,1,3)
  grid on;
  plot(t,xt);
  xlabel('Time'), ylabel('Amplitude'); #DSB-SC Signal
  grid on
  title('DSB-SC Signal')

  
  %Graph 4
#  L = length(mt);
  L = length(xt);
  NFFT = 2^nextpow2(L);
#  y_fft = 2*abs(fft(mt,NFFT)/L);
  y_fft = 2*abs(fft(xt,NFFT)/L);
  
  freq = Fs/4*linspace(0,1,NFFT/2+1);
 #freq = Fs/2*linspace(0,1,NFFT/2+1);

  figure(1);
  subplot(4,1,4) #Fourier
  plot(freq,y_fft(1:NFFT/2+1)); 
  grid on
  xlabel('Frequency');
  ylabel('Amplitude');
#  title('Fourier Transform of Message Signal')
  title('Fourier Transform of DSB-SC Signal')


  %------------Channel Distortion----------------
  
  hf = exp(-2i*pi*5*t)+exp(-2i*pi*30*t); #channel charac
  xf = fft(xt); #fast fourier transform -> freq domain
  yf = xf.*hf; #Matrix multiplication 
  yt = ifft(yf); #inverse fourier transform -> time domain
  
    % uncomment to see the graph 
#  figure(3);
#  subplot(4,1,1);
#  plot(t,hf); grid on; title("H(f)")
  
#  figure(3);
#  subplot(4,1,2);
#  plot(t,xf); grid on; title("X(f)")
  
#  figure(3);
#  subplot(4,1,3);
#  plot(t,yf); grid on; title("Y(f)")
  
#  figure(3);
#  subplot(4,1,4);
#  plot(t,yt); grid on; title("Y(t)")
  
  
 %------------Demodding----------------
 
  %Graph 1
  vt = yt.*cw;
  figure(2);
  subplot(4,1,1)
  plot(t,vt,'m');
  xlabel('Time'), ylabel('Amplitude');
  title('Demodulated Signal');
 
 
  %Graph 2
  fvt = vt;
  L = length(fvt);
  NFFT = 2^nextpow2(L);
  y_fft = 2*abs(fft(fvt,NFFT)/L);
  freq = Fs/2*linspace(0,1,NFFT/2+1);
#  freq = Fs*linspace(0,1,NFFT/2+1);
  figure(2);
  subplot(4,1,2)
  plot(freq,y_fft(1:NFFT/2+1),'m'); 
  grid on
  xlabel('Frequency');
  ylabel('Amplitude');
  title('Fourier Transform of Signal');
  
 #LPF
  
  %Graph 3
  Fs1 = Fs/2;
  [b,a]=butter ( 4, 120 / Fs1);
  filtered = filter(b,a,vt);
  figure(2);
  subplot(4,1,3)
  plot(t,filtered,'m'); 
  grid on
  xlabel('Time');
  ylabel('Amplitude');
  title('Filtered Demodulated Signal (Original Message)');

  
  %Graph 4
  [b,a]=butter ( 4, 120 / Fs1);
  filtered = filter(b,a,fvt);
  L = length(filtered );
  NFFT = 2^nextpow2(L);
  y_fft = 2*abs(fft(filtered ,NFFT)/L);
#  freq = Fs*linspace(0,1,NFFT/2+1);
#  freq = Fs/2*linspace(0,1,NFFT/2+1);
  freq = Fs/4*linspace(0,1,NFFT/2+1);
  subplot(4,1,4)
  plot(freq,y_fft(1:NFFT/2+1),'m'); 
  grid on
  xlabel('Frequency');
  ylabel('Amplitude');
  title('Filtered Fourier Transform of Signal');
 
endfunction
