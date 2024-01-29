function [out]=construct(sequence)

A=[1,1,0];
B=[1,1,1,0];
C=[1,1,1,1,0];
D=[1,1,1,1,1,0];
E=[1,1,2];
F=[1,1,2];
G=[1,1,2];
H=[1,1,1,2];
I=[1,2,1,1,1,0];
J=[1,1,2,1,1,0];
K=[1,1,2,1,0];
% L=[1,2,1,0];
out=true;
patterns={J,I,D,C,K,B,H,A,E,F,G};
j=0;
while j<=45
for i=1:11
    s=size(patterns{i},2);
    if s==0 & i==11
        out=false;
        return
    end
    if s==0
        continue
    end
    flag=true;
    for k=1:s
        if sequence(k+j)~=patterns{i}(k)
            flag=false;
        end
    end
    if flag
        patterns{1,i}=[];
        j=j+s;
        break
    end
    if i==11
        out=false;
        return
    end
end
end


