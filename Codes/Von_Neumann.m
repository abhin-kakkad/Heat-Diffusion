clc;
clear;
m=30;
n=30;
a=zeros(m,n);
%initialization of temperature grid 
for i=1:m
    a(i,1)=50;
end

for i=1:m
    a(i,n)=50;
end

for j=1:n
    a(1,j)=50;
end

for j=1:n
    a(m,j)=0;
end


 for i=2:m-1
     for j=2:n-1
             a(i,j)=25;
     end
end

maxiter=1;
anew=a;
grid=zeros(m,n,maxiter+1);
grid(:,:,1)=anew;
err=0.001;
diff=err;
while err<=diff
    diff=0.0;
    for j=2:m-1
        for k=2:n-1
            a(j,k)=(anew(j-1,k)+anew(j,k-1)+anew(j,k+1)+anew(j+1,k))/4;
            z=abs(anew(j,k)-a(j,k));
            if(diff<z)
                diff=z;
            end
        end
    end
    %diff
    anew=a;
    grid(:,:,maxiter)=anew;
    maxiter=maxiter+1;
end
%maxiter
applycolor(grid,maxiter);
