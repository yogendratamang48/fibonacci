function f=fibonacci(n)
f(1)=1;
f(2)=2;
for i=3:n
    f(i)=f(i-1)+f(i-2);
end
end
