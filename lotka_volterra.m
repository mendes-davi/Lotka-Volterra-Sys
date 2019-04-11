function [p, v, t] = lotka_volterra(p0, v0, delta_t, c, f, s, r, T);
	steps = ceil(T / delta_t) + 2;
	n = 1;
	p = zeros(1, steps);
	v = zeros(1, steps);
	t = zeros(1, steps);
	p(1) = p0;
	v(1) = v0;
	while t(n) < T
		t(n + 1) = t(n) + delta_t;
		p(n + 1) = p(n) + delta_t * (-c * p(n) + f * s * p(n) * v(n));
		v(n + 1) = v(n) + delta_t * (r * v(n) - s * p(n) * v(n));
		n = n + 1;
	end
	t = t(1 : n - 1);
	v = v(1 : n - 1);
	p = p(1 : n - 1);
end
