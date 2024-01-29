function [out]=belong_to_voc2(string1,string2)
out=false;
size_string1=size(string1,2);
size_string2=size(string2,2);
for i=1:(size_string2-size_string1+1)
    interval_string=string2(i:(i+size_string1-1));
    if isequal(interval_string,string1)
        out=true;
        return
    end
end
end