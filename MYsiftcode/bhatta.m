function c = bhatta(u_hist_values, v_hist_values)
    norm_const = sqrt(sum(u_hist_values) * sum(v_hist_values));
    acc = 0;
    for i = 1:36
        dot = u_hist_values(i) .* v_hist_values(i);
        res = sqrt(dot);
        res = res ./ norm_const;
        acc = acc + res;
    end
    c = sqrt(1 - acc);
end