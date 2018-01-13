%********realization of logit regression********

%********import data********
data = xlsread('Your computer path where the data is stored');

%********data preprocess****
x_data = data(:,1:2);y_data = data(:,3);
x = x_data'; y = y_data';
beta = [0;0;1]; %beta = [w1;w2;b];
x_add_1 = ones(1,17); x_hat = [x;x_add_1];
%********Newton_Method******
DL1 = 0; DL2 = 0; %first and second derivative
flag = 0; 
beta_previous = beta;
L_previous = L_beta(x_hat,beta_previous,y);
while (flag == 0)
    [p0,p1] = p(x_hat,beta_previous);
    for i = 1:size(x_hat,2)
        DL1 = DL1-x_hat(:,i)*(y(:,i)-p1(i,:));
        DL2 = DL2+x_hat(:,i)*x_hat(:,i)'*p1(i,:)*(1-p1(i,:));                                                                                                                                                                                                                   
    end
    beta_current = beta_previous-DL2^(-1)*DL1;
    L_current = L_beta(x_hat,beta_current,y);
    r = abs(L_current-L_previous); %difference between current root and previous root
    if (r < 0.0001)
        flag = 1;
    end
    L_previous = L_current;
    beta_previous = beta_current;
end
    w = beta_current(1:2,:);
    b = beta_current(3,:);
    for s = 1:size(x_hat,2)
        if (y(:,s) == 1)
            scatter(x(1,s),x(2,s),'b');
            hold on;
        else
            scatter(x(1,s),x(2,s),'r');
            hold on;
        end
    end
    m1 = [-b/w(1,:),0];
    m2 = [0,-b/w(2,:)];
    plot(m1,m2)
    xlabel('密度');
    ylabel('含糖率');
    title('对率回归'); 

