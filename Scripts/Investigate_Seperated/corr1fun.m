function f = corr1fun(y)
c = autocorr(y);
f = c(1:3)';
end