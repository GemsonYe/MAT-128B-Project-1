phi = inline('z^2-0.123-0.745i');


colormap([0 1 0; 0  0.7 0; 0 0.4 0; 0 0.1 0; 1 1 1]);

M = 5*ones(301, 301);

for j = 1:301
    y = -1.5 + (j-1) * .01;
    for i=1:301
        x = -1.5 + (i-1)*.01;
        z = x + 1i*y;
        zk = z;
        kount = 0;
        
        while kount < 100 && abs(zk) < 100
            kount = kount + 1;
            zk = phi(zk);
            
        end
        
        if abs(zk) >= 100
            if kount <= 100 && kount >= 75
                M(j,i) = 1;
            elseif kount < 75 && kount >= 50
                M(j,i) = 2;
            elseif kount < 50 && kount >= 25
                M(j,i) = 3;
            elseif kount < 25 && kount >= 0
                M(j,i) = 4;
            end
        end
    end
end

image([-1.5 1.5], [-1.5 1.5], M),
axis xy
