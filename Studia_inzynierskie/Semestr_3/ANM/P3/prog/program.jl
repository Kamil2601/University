using LinearAlgebra
using Printf

function norm_inf(M)
    res = 0
    n = size(M)[1]
    for i=1:n
        sum = 0
        for j=1:n
            sum+=abs(M[i,j])
        end
        if sum>res
            res=sum
        end
    end
    return res
end


function Schulz(A,X0,n)
    I = one(A)
    X = X0
    for i = 1:n
        X = X + X*(I - A*X)
    end
    
    return X
end

function Schulz2(A,X0,epsilon)
    I = one(A)
    X = X0
    while norm_inf(I-A*X)>epsilon
        X = X + X*(I - A*X)
    end
    return X
end

function norm_1(M)
    res = 0
    n = size(M)[1]
    for i=1:n
        sum = 0
        for j=1:n
            sum+=abs(M[j,i])
        end
        if sum>res
            res=sum
        end
    end
    return res
end

function norm_2(M)
    Mt = transpose(M)
    return sqrt(eigmax(Mt*M))
end

function X01(A)
    return A/(norm_inf(A)^2)
end

function X02(A)
    return transpose(A)/(size(A,1)*norm_1(A)*norm_inf(A))
end

function X03(A)
    return transpose(A)/(norm_2(A)^2)
end

function X04(A)
    B = one(A)
    n = size(B,1)
    for i=1:n
        B[i,i]=1/A[i,i]
    end
    
    return B
end


function gauss(A)
    rows = size(A,1)
    factor = A[1,1]/A[1,1]
    
    A = [A one(A)]

    for j = 1:rows
        for i = j+1:rows
            factor = -A[i,j]/A[j,j]
            A[i,:] = A[i,:] + A[j,:] * factor
        end
    end
    
    U = A[:,1:rows]
    I = A[:,(rows+1):end]
    res = zero(I)
    for j = 1:rows
        for i = rows:-1:1
            res[i,j] = I[i,j]
            for k = (i+1):rows
                res[i,j] -= U[i,k]*res[k,j]
            end
            res[i,j] /=U[i,i]
        end
    end
    return res
end

