function speechrecognizer(filename)
%Speech Recognition Using Correlation Method
%Write Following Command On Command Window with desier file name insted of file name
%Like this --> Speechrecognizer('aalif.wav')
voice=audioread(filename);
x=voice;         %voice variable to x variable%
x=x';            %Convert two coloum to row%
x=x(1,:);        %Convert two row and many coloum to one row & many coloum%
x=x';            %convert one row & many coloum to one coloum & many row%
L=length(x);
t=-((L-1)/2):1:((L-1)/2);
t=t';
subplot(2,2,1);
plot(t,x);
ylabel('Amplitude')
xlabel('Frequency')
y1=audioread('aalif.wav');
y1=y1';
y1=y1(1,:);
y1=y1';
z1=xcorr(x,y1);
m1=max(z1);       %Save Max Amplitude of sequence in m1%
l1=length(z1);
t1=-((l1-1)/2):1:((l1-1)/2);
t1=t1';
subplot(2,2,2);
plot(t1,z1);
ylabel('Amplitude')
xlabel('Frequency')
y2=audioread('baa.wav');
y2=y2';
y2=y2(1,:);
y2=y2';
z2=xcorr(x,y2);
m2=max(z2);
l2=length(z2);
t2=-((l2-1)/2):1:((l2-1)/2);
t2=t2';
subplot(2,2,3);
plot(t2,z2);
ylabel('Amplitude')
xlabel('Frequency')
y3=audioread('honey.wav');
y3=y3';
y3=y3(1,:);
y3=y3';
z3=xcorr(x,y3);
m3=max(z3);
l3=length(z3);
t3=-((l3-1)/2):1:((l3-1)/2);
t3=t3';
subplot(2,2,4);

suptitle('All Voice Graph')
plot(t3,z3);
ylabel('Amplitude')
xlabel('Frequency')
m=400;
Amp=[m m1 m2 m3];
m=max(Amp);
h=audioread('allow.wav.');
L=length(h);
if m<=m1
    soundsc(audioread('aalif.wav'),7.5*L)
        soundsc(h,2*L)
elseif m<=m2
    soundsc(audioread('baa.wav'),8*L)
        soundsc(h,2*L)
elseif m<=m3 
    soundsc(audioread('honey.wav'),7.5*L)
        soundsc(h,2*L)
else
   soundsc(audioread('denied.wav'),7.5*L)
end
