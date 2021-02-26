clear all
clc;
close all

% Sampling frequency 
fs=16000;
set_num=3;
traindata=cell(1,10);

% Read speech files
for kk=0:9
    temp=cell(1,set_num);
    for j=1:set_num
        fname = sprintf('WAVDATA/num%dset%d.wav',(kk+1),j);

        x=audioread(fname);
        temp{1,j}=x';
    end
    traindata{1,kk+1}=temp;
end


features=[];
for kk=1:10%length(traindata) %length(traindata)=10
    str=sprintf('training data %d',kk );  
    disp(str)
    sample=[];tmp=[];
    for k=1:length(traindata{kk})%%length(traindata{i})=set_num  (Number of train set)
        x=filter( [ 1 -0.9375 ], 1, traindata{kk}{k});
        sample=melcepst(x,fs,'M',9,32,256,80);
        tmp=[tmp;sample];
    end
    lb=kk*ones(size(tmp,1),1);
    tmp=[lb,tmp];
    features=[features;tmp];
end
fid = fopen('data.txt','wt');
for ii = 1:size(features,1)
    fprintf(fid,'%g\t',features(ii,:));
    fprintf(fid,'\n');
end
fclose(fid);