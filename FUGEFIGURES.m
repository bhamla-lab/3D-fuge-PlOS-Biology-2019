angularvelocity1=table2array(onehandle1full(:,2));
times1=table2array(onehandle1full(:,1));
angularvelocity2 = table2array(onehandlefull2(2:end,2));
angularvelocity2 = angularvelocity2*max(angularvelocity1)/max(angularvelocity2);
times2=table2array(onehandlefull2(2:end,1));
diff=times1(end)-times2(1);
times2=times2+diff;
fullvel = [angularvelocity1; angularvelocity2];
timeful= [times1;times2];
plot(timeful,fullvel); %'bo', 'MarkerSize',5,'MarkerEdgeColor', 'k','MarkerFaceColor','g');

angularvelocity1=table2array(Aaronpart2(:,2));
times1=table2array(Aaronpart2(:,1));
angularvelocity2=table2array(Aaronpart1(2:end,2));
times2=table2array(Aaronpart1(2:end,1));
diff=times1(end)-times2(1);
times2=times2+diff;
angularvelocity1=angularvelocity1*max(angularvelocity2)/max(angularvelocity1);
fullvel = [angularvelocity1; angularvelocity2];
timeful= [times1;times2];
plot(timeful,fullvel); %'bo', 'MarkerSize',5,'MarkerEdgeColor', 'k','MarkerFaceColor','g');

%angularvelocity2=table2array(Gaurav3dfuge(:,2))/10;
%times2=table2array(Gaurav3dfuge(:,1));
angularvelocity2filtered=smooth(fullvel,0.3,'loess');
counter=1;
name=fullvel;
name2=timeful;
gap=5;
%for i=1:gap:(numel(name))
% blah=min(numel(name)-i,gap);
%[val,position]=max(abs(name(i:(i+blah-1))));
%    modtimes2(counter)=name2(position-1+i);
%    modangularvelocity(counter)=name(i+position-1);
%    counter=counter+1;
%end
plot(name2', name','bo','MarkerSize',5,'MarkerEdgeColor', 'k','MarkerFaceColor','y');

plot(modtimes2(1:idivide(int32(numel(name)),gap,'ceil')), modangularvelocity(1:idivide(int32(numel(name)),gap,'ceil')),'k-','LineWidth',6);
newsmooth=smooth(modangularvelocity,0.04,'loess');
mask = modtimes2 < 1.55;
plot(modtimes2(1:idivide(int32(numel(name)),gap,'ceil')), (newsmooth(1:idivide(int32(numel(name)),gap,'ceil'))/1000).^2*1.118*30,'b-','LineWidth',6);

%plot(modtimes2(1:idivide(int32(numel(name)),gap,'ceil')), newsmooth(1:idivide(int32(numel(name)),gap,'ceil')),'b-','LineWidth',6);
plot(modtimes2(1+40:376+48), newsmooth(1+40:376+48),'b-','LineWidth',6);
%rcf=((newsmooth(1:idivide(int32(numel(name)),gap, 'ceil'))/1000).^2)*11.18*6;
%rcf2=((newsmooth(1:idivide(int32(numel(name)),gap, 'ceil'))/1000).^2)*11.18*4;
%plot(modtimes2(1+40:376+48), rcf2(1+40:376+48),'g-','LineWidth',6);
%plot(modtimes2(1:idivide(int32(numel(name)),gap,'ceil')), rcf2(1:idivide(int32(numel(name)),gap,'ceil')),'b-','LineWidth',6);
%mask = (modtimes2 <= 0.8092);
%newrcf2=rcf(mask);
%newmask=( 0.8092 < modtimes2 <0.03);
%nrcf2=rcf(newmask)'
%newrcf2=[newrcf2' nrcf2(10:end)];
%plot(modtimes2(1:numel(newrcf2)), [newrcf2],'g-','LineWidth',6);
num=modtimes2(41)-modtimes2(376+48)