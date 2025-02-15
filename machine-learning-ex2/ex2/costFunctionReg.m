function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta



% Vectorized approach		
Hypothesis = sigmoid(X*theta);

J = (-1.0/m) * sum( (y .* log(Hypothesis)) + (1.0 - y) .* log(1.0 -Hypothesis) ) + (lambda/(2*m)) *  norm(theta([2:end]))^2; 

grad = (1.0/m) * ((X' * (Hypothesis - y)) + lambda * theta); 

% I have added the extra term to all the theta elements so now i have to subtract it for theta0 (indexed at 1)
grad(1) = grad(1) - ((1.0/m) * lambda * theta(1));
% =============================================================

end
