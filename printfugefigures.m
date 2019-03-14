
angularvelocity1=table2array(Aaron3dfuge(:,2))/10;
times1=table2array(Aaron3dfuge(:,1));
angularvelocity2=table2array(Gaurav3dfuge(:,2))/10;
times2=table2array(Gaurav3dfuge(:,1));
angularvelocity2filtered=smooth(angularvelocity2,0.3,'loess');
counter=1;
name=angularvelocity2;
name2=times2;
gap=5;
for i=1:gap:(numel(name))
    blah=min(numel(name)-i,gap);
    [val,position]=max(abs(name(i:(i+blah-1))));
    modtimes2(counter)=name2(position-1+i);
    modangularvelocity(counter)=name(i+position-1);
    counter=counter+1;
end
plot(name2', name','bo','MarkerSize',5,'MarkerEdgeColor', 'k','MarkerFaceColor','y');

plot(modtimes2(1:idivide(int32(numel(name)),gap,'ceil')), modangularvelocity(1:idivide(int32(numel(name)),gap,'ceil')),'k-','LineWidth',6);
newsmooth=smooth(modangularvelocity,0.08,'loess');
mask = modtimes2 < 1.55;
rcf=((newsmooth(1:idivide(int32(numel(name)),gap, 'ceil'))/1000).^2)*11.18*6;
plot(modtimes2(1:idivide(int32(numel(name)),gap,'ceil')), rcf,'b-','LineWidth',6);
plot(modtimes2(1+40:376+48), newsmooth(1+40:376+48),'b-','LineWidth',6);
rcf=((newsmooth(1:idivide(int32(numel(name)),gap, 'ceil'))/1000).^2)*11.18*6;
rcf2=((newsmooth(1:idivide(int32(numel(name)),gap, 'ceil'))/1000).^2)*11.18*4;
plot(modtimes2(1+40:376+48), rcf2(1+40:376+48),'g-','LineWidth',6);
plot(modtimes2(1:idivide(int32(numel(name)),gap,'ceil')), rcf2(1:idivide(int32(numel(name)),gap,'ceil')),'b-','LineWidth',6);
mask = (modtimes2 <= 0.8092);
newrcf2=rcf(mask);
newmask=( 0.8092 < modtimes2 <0.03);
nrcf2=rcf(newmask)'
newrcf2=[newrcf2' nrcf2(10:end)];
plot(modtimes2(1:numel(newrcf2)), [newrcf2],'g-','LineWidth',6);
num=modtimes2(41)-modtimes2(376+48)