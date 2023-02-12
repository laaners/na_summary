k = 8;

% 1) For loop strategy
vk = zeros(1, k+1);
for (ii = 0:k)
  vk(ii+1) = (2*ii + 1)^2;
end
vk
% 2) Vector syntax
vk = [1:2:2*k+1].^2;
