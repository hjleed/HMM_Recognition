
clear all
clc;
close all


load( 'hmm_data.mat' , 'hmm')
load( 'setting.mat' , 'fs','bin','fil_num','set_num','loop_num')
rec_set=10-set_num;
traindata=cell(1,10);
fs=16000;
addpath('VOICEBOX')


% Recognize
 for i=1:10
        
%     fname=sprintf('%d1a.wav',i-1);
       fname = sprintf('WAVDATA/num%dset%d.wav',(i),rec_set);
  
     x=audioread(fname);
     x=filter([1 -0.9375],1,x);
     m=melcepst(x,16000, 'M',bin,fil_num,256,80);
     for j=1:10
       pout(j)=viterbi(hmm{j},m);
     end
        [d,n]=max(pout);
        fprintf('word number %d is recognized as %d\n' , i,n)
        
 end