function DX(delta, Nx, Ny)
    # This function creates a finite difference operator which represents a
    # first order x-derivitive.
    # INPUT
    # delta: resolution of the operator - scalar / a.u.
    # Nx: Number of elements in x-direction - integer / #
    # Ny: Number of elements in y-direction - integer / #
    # OUTPUT
    # operator:  (Nx*Ny X Nx*Ny)-Dim. FD-Dx operator - array / a.u.
    N = Nx*Ny
    next_vec = fill(1.0/(2.0*delta), N-1)
    if Ny > 1
        for ii in Nx:Nx:N-1 next_vec[ii] = 0.0 end
    end
    next_sparse_mat = sparse(2:N, 1:N-1, next_vec, N, N)
    operator = next_sparse_mat' - next_sparse_mat
    return operator
end

function DXX(delta, Nx, Ny)
    # This function creates a finite difference operator which represents a
    # second order x-derivitive.
    # INPUT
    # delta: resolution of the operator - scalar / a.u.
    # Nx: Number of elements in x-direction - integer / #
    # Ny: Number of elements in y-direction - integer / #
    # OUTPUT
    # operator:  (Nx*Ny X Nx*Ny)-Dim. FD-Dxx operator - array / a.u.
    N = Nx*Ny
    main_vec = fill(-2.0 /delta^2, N)
    next_vec = fill(1.0/delta^2, N-1)
    if Ny > 1
        for ii in Nx:Nx:(N-1) next_vec[ii] = 0.0 end
    end
    main_sparse_mat = sparse(1:N, 1:N, main_vec, N, N)
    next_sparse_mat = sparse(2:N, 1:(N-1), next_vec, N, N)
    operator = next_sparse_mat' + next_sparse_mat + main_sparse_mat
    return operator
end

function DY(delta, Nx, Ny)
    # This function creates a finite difference operator which represents a
    # first order y-derivitive.
    # INPUT
    # delta: resolution of the operator - scalar / a.u.
    # Nx: Number of elements in x-direction - integer / #
    # Ny: Number of elements in y-direction - integer / #
    # OUTPUT
    # operator:  (Nx*Ny X Nx*Ny)-Dim. FD-Dy operator - array / a.u.
    N = Nx*Ny
    next_vec = fill(1.0/(2*delta), (N-Ny))
    next_sparse_mat = sparse((1+Ny):N, 1:(N-Ny), next_vec, N, N)
    operator = next_sparse_mat' - next_sparse_mat
    return operator
end

function DYY(delta, Nx, Ny)
    # This function creates a finite difference operator which represents a
    # second order y-derivitive.
    # INPUT
    # delta: resolution of the operator - scalar / a.u.
    # Nx: Number of elements in x-direction - integer / #
    # Ny: Number of elements in y-direction - integer / #
    # OUTPUT
    # operator:  (Nx*Ny X Nx*Ny)-Dim. FD-Dyy operator - array / a.u.
    N = Nx*Ny
    main_vec = fill(-2.0/delta^2, N)
    next_vec = fill(1.0/delta^2, (N-Ny))
    main_sparse_mat = sparse(1:N, 1:N, main_vec, N, N)
    next_sparse_mat = sparse((1+Ny):N, 1:(N-Ny), next_vec, N, N)
    operator = next_sparse_mat + next_sparse_mat' + main_sparse_mat
    return operator
end
