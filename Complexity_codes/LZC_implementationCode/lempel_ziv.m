function [out,P]=lempel_ziv(signal,num_levels)
med=median(signal);
if isnan(signal(1))
    out=NaN;
    return
end
if num_levels==2
    P=(sign(signal-med)+1)/2;
    %corrected for those situation that signal=med
    ind=(signal==med);
    P(ind)=0;
end
if num_levels==3
    P=signal;
    P(signal>=med+abs(max(signal))/16)=2;
    P(signal<=med-abs(max(signal))/16)=0;
    P(signal>med-abs(max(signal))/16 & signal<med+abs(max(signal))/16)=1;
end
c=2;
terminate=false;
r=1;
i=1;
while terminate==false
    S=P(1:r);
    Q=P(r+1:r+i);
    concat=[S,Q];
    if ~belong_to_voc2(Q,concat(1:(size([S,Q],2)-1)))
        c=c+1;
        r=r+i;
        i=1;
    else
        i=i+1;
    end
    if r+i==size(P,2)
        terminate=true;
    end
end


out=c*log2(size(P,2))/size(P,2);
if num_levels==3
    out=out/log2(3);
end
end
        
        