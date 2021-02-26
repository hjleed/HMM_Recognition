clear all;
close all
clc;

[raw_sp,fs,nb]=wavread('raw_speech.wav');

total_sec=floor(length(raw_sp)/fs )

vc_set=zeros(fs,total_sec);

for i=1:total_sec
   
vc_set(:,i)=raw_sp(fs*(i-1)+1:fs*i);

end
% vc_set(:,1)
% figure;
% plot(1:fs,vc_set(:,24))

rep=total_sec/11;

for r=1:rep
for k=0:10
wavwrite(vc_set(:,k+(1+(r-1)*11)),fs,strcat('num',num2str(k),'set',num2str(r),'.wav'));
end
end