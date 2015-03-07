function y = insertn(p, q, n)
% Insert q into p every n elements

    N = numel(p);
    p_pad = [p(:); zeros((n - mod(N, n)) * (mod(N, n) > 0), 1)];
    y = [reshape(p_pad, n, []); repmat(q(:), 1, numel(p_pad) / n)];
    y = y(1:N + numel(q) * fix(N / n));

    if isrow(p)
        y = y';
    end 