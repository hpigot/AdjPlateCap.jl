module AdjPlateCap
export capacitance

# based on https://doi.org/10.1134/1.1259300
function capacitance(e2,e3,h2,h3,w,s,x)
    # e1, e2, e3. Layer relative permittivity [1]
    # h1, h2, h3. Layer depth [m]
    # w, s, x. Plate length, separation and width [m]

    # reparametrization
    l = 2*x+s;
    # permittivity of free space [F/m]
    e0 = 8.854187817e-12;

    # layer 1 (e.g air gap between capacitor plates)
    k1 = s/l;
    C1 = e0*f(k1)*w;

    # layer 2 (e.g container wall capacitance)
    k2 = tanh(pi*s/(4*h2))/tanh(pi*l/(4*h2));
    C2 = e0*(e2-e3)*f(k2)*w/2;

    # layer3 (e.g fluid capacitance)
    k3 = tanh(pi*s/(4*(h3+h2)))/tanh(pi*l/(4*(h3+h2)));
    C3 = e0*(e3-1)*f(k3)*w;

    # combined capacitance
    return C1 + C2 + C3;
end

function f(k)
    if k^2 <= 1/2
        a = (1-k^2)^(1/4);
        return log(2*(1+a)/(1-a))/pi;
    else
        return pi/log(2*(1+k^(1/2))/(1-k^(1/2)));
    end
end

end
