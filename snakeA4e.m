function A = snakeA4e(K, alpha, beta)

D = zeros(K, K);
D1 = zeros(K, K);
D2 = zeros(K, K);

D1 = circshift(eye(K, K), 1) + circshift(eye(K, K), -1) + eye(K, K) * -2;
D2 = circshift(eye(K, K), 2) + circshift(eye(K, K), -2) + circshift(eye(K, K) * -4, 1)+ circshift(eye(K, K) * -4, -1) + eye(K,K) * 6;
D = alpha * D1 - beta * D2;
Iden = eye(K);
A=pinv(Iden-D);
end