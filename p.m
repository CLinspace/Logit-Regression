function [p0,p1] = p(x_hat,beta)

for i = 1:size(x_hat,2)
    p0(i,:) = 1/(1+exp(beta'*x_hat(:,i)));
    p1(i,:) = 1-p0(i,:);
end