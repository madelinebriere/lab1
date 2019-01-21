%% Question 1
% delta = [1 0 0];
% range = 3*length(delta)-2;
% len = length(delta);
% range = -len+1:2*len-2;
% r = zeros(1, length(range));
% for l = -length(delta)+1:length(delta)-1
%     for n = 1:len
%         if (n-l<=0)
%             r(l+len) = 0;
%         elseif (n-l>=length(delta))
%             r(l+len) = 0;
%         else
%         r(l+len) = r(l+len) + delta(n).*conj(delta(n-l));
%         end
%     end
% end

delta = [1 0 0];
range = 3*length(delta)-2;
len = length(delta);
r = zeros(1, range);
for l = 1:range
    for n = 1:len
        if (n-(l-1)<=0)
            r(l) = r(l)+0;
        elseif (n-(l-1)>=length(delta))
            r(l) = r(l)+0;
        else
        r(l) = r(l) + delta(n)*(delta(n-(l-1)));
        end
    end
end