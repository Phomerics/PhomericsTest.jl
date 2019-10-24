function first_derivative(x_vec,y_vec)
    Nx = length(x_vec)
    Ny = length(y_vec)
    if Nx != Ny
        return println("Error: the two input vectors do not have the same size")
    end
    drv = diff(y_vec)./diff(x_vec)
    #drv[end] = (y_vec[end] - y_vec[end-1])/(x_vec[end] - x_vec[end-1])
    return drv
end
