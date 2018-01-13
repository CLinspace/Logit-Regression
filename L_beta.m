function L = L_beta(x_hat,beta,y)

L = 0;

for i = 1:size(x_hat,2)
    L = L-y(:,i)*beta'*x_hat(:,i)+log(1+exp(beta'*x_hat(:,i)));
end