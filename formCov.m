function y = formCov(sigma,rho)
%forms cov matrix from vectors of stdevs (sig) and corrs (rho)

N=numel(sigma);
if numel(rho)~= N*(N-1)/2, error('dimensions are incompatible'), end
Rho=eye(N);
for n=1:N-1
    Rho(n,n+1:N)=rho((n-1)*N-n*(n-1)/2+1:n*N-n*(n+1)/2);
    Rho(n+1:N,n)=Rho(n,n+1:N)';
end

y = diag(sigma)*Rho*diag(sigma);