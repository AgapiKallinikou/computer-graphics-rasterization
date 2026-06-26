function C = Bezier(P,d)

n = size(P,1)-1;

t = linspace(0,1,d);

C = zeros(d,size(P,2));

for i = 0:n

    B = nchoosek(n,i) .* ...
        (1-t).^(n-i) .* ...
        t.^i;

    C = C + B' * P(i+1,:);

end

end
