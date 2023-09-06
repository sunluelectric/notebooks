function y = sgt_pdf(x, p, q, mu, lambda, s)
%% SGT_PDF calculates the pdf of a skewed generalized t-distribution.
    if p*q>2
        nu = q^(-1/p)/sqrt((3*lambda^2+1)*beta(3/p,q-2/p)/beta(1/p,q)-4*lambda^2*beta(2/p,q-1/p)^2/beta(1/p,q)^2);
        s = s/nu;
        m = 2*nu*s*lambda*q^(1/p)*beta(2/p,q-1/p)/beta(1/p,q);
        y = p./(2*nu*s*q^(1/p)*beta(1/p,q)*(abs(x-mu+m).^p./(q*(nu*s)^p*(lambda*sign(x-mu+m)+1).^p)+1).^(1/p+q));
    elseif lambda == 0
        y = p./(2*s*q^(1/p)*beta(1/p,q)*(1+(x-mu).^p/(q*s^p)).^(q+1/p));
    end
    y(isnan(y)) = 0;
end