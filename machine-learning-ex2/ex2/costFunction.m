function [J, grad] = costFunction(theta, X, y)
%COSTFUNCTION Compute cost and gradient for logistic regression
%   J = COSTFUNCTION(theta, X, y) computes the cost of using theta as the
%   parameter for logistic regression and the gradient of the cost
%   w.r.t. to the parameters.

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
%
% Note: grad should have the same dimensions as theta
%

% Unvectorized approach for the cost function- UNABLE TO GET IT TO WORK.
%for i = 1:m,
%	temp = sigmoid(theta' * (X(i,:))');
%	J = J + (-1/m)*(y(i)*log(temp) + (1-y(i))* log(1.0-temp));	
%end

%for i = 1:m,
%	temp = sigmoid(theta' * (X(i,:))');
%	for j = 1:m,
%		grad(i) = grad(i) + (1.0/m) * ((temp - y(i)) * (X(j,:))');
%	end
%end		
		
% Vectorized approach		
Hypothesis = sigmoid(X*theta);

J = (-1.0/m) * sum( (y .* log(Hypothesis)) + (1.0 - y) .* log(1.0 -Hypothesis) ); 

grad = (1.0/m) * (X' * (Hypothesis - y)); 
% =============================================================

end
