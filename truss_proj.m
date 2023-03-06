%load in .mat file
load('TrussDesign.mat','C','Sx','Sy','X','Y','L')
 
[j,m] = size(C);
 
 
%CALCULATIONS
 
 
%Calculating A Matrix
equilCx = zeros(j,m);
indexvec = [0;0];
totallength = 0;
lengtharray = [];
for c = 1:m
    indexvec = find(C(:,c) == 1)';
        
    equilCx(indexvec(1), c) = xcalcfunc(indexvec(2), indexvec(1), X, Y);
    
    equilCx(indexvec(2), c) = xcalcfunc(indexvec(1), indexvec(2), X, Y);
    
    %function to calculate total length and length of each member
    [totallength, lengtharray] = lengthfunc(indexvec(2), indexvec(1), X, Y, totallength, lengtharray);
    
end
 
equilCy = zeros(j,m);
indexvec = [0;0];
for c = 1:m
    indexvec = find(C(:,c) == 1)';
        
    equilCy(indexvec(1), c) = ycalcfunc(indexvec(2), indexvec(1), X, Y);
    
    equilCy(indexvec(2), c) = ycalcfunc(indexvec(1), indexvec(2), X, Y);
 
end
 
%making final A matrix
newC = [equilCx; equilCy];
 
newS = [Sx; Sy];
 
A = [newC newS];
 
 
%T matrix
T = zeros(m+3,1);
 
%Solving for T
T = inv(A) * L;
 
%calculating cost
lengthin = totallength;
cost = 10*j + lengthin;
 
 
%calculating the buckling strength
bucklemat = [];
count = 0;
for i = 1:length(T)
    if (T(i) < 0)
        count = count + 1;
        membernum = i;
        memberlength = lengtharray(i);
        bucklemat(1,count) = membernum;
        bucklemat(2,count) = 2945/(memberlength)^2;
        bucklemat(3,count) = 54/memberlength;
    end
end
 
[minval, indx] = min(bucklemat(2,:));
minindx = bucklemat(1,indx);
 
%calculating the R vector for maximum load
W = sum(L);
R = T./W;
 
%calculating maximum load
Wfail = -(bucklemat(2,indx))/R(minindx);
 
%calculating the load/cost ratio
loadcost = Wfail/cost;
 
 
 
%PRINTING
 
 
fprintf("EK301, Section A6, Group Awesome: Eric Davis, Noa Margolin, Emiliano Valencia-Donohue, 11/4/2022\n")
fprintf("Load: %d oz\n", W)
fprintf("Member forces in oz:\n")
 
%for printing out member forces
for i = 1:m
    fprintf("m%d: ",i)
    ctprint(T(i));
end
 
fprintf("Reaction forces in oz:\n")
 
%for printing out S values
fprintf("Sx1: %7.3f\n",T(end-2))
fprintf("Sy1: %7.3f\n",T(end-1))
fprintf("Sy2: %7.3f\n",T(end))
 
 
fprintf("Cost of truss: $%6.2f\n", cost)
fprintf("Theoretical max load/cost ratio in oz/$: %4.3f\n", loadcost)
 
 
%print first member to buckle and uncertainty
fprintf("The first member to buckle is member %d and the uncertainty is %5.3f oz\n", minindx, bucklemat(3,indx))
fprintf("The maximum weight our truss can support is %5.3f oz\n", Wfail)
 
 
 
%function that calculates the x
function xanswer = xcalcfunc(num1, num2, X, Y)
 
    pythag = (X(num2)- X(num1))^2 + (Y(num2) - Y(num1))^2;
    xanswer = (X(num1) - X(num2))/(sqrt(pythag));
    %xanswer  = (num1-num2)/sqrt(pythag);
 
end
 
%function that calculates the y
function yanswer = ycalcfunc(num1, num2, X, Y)
 
    pythag = (X(num2)- X(num1))^2 + (Y(num2) - Y(num1))^2;
    yanswer = (Y(num1) - Y(num2))/(sqrt(pythag));
    %yanswer  = (num1-num2)/sqrt(pythag);
 
end
 
%function that calculates the total length
function [totallength, lengtharray] = lengthfunc(num1, num2, X, Y, totallength, lengtharray)
 
    pythag = (X(num2)- X(num1))^2 + (Y(num2) - Y(num1))^2;
    
    lengtharray = [lengtharray sqrt(pythag)];
    
    totallength = totallength + sqrt(pythag);
    
end
 
 
%function that prints member results
function ctprint(value)
    
    if (value > 0)
        CorTorZ = 'T';
    elseif (value < 0)
        CorTorZ = 'C';
    else
        CorTorZ = 'Z';
    end
    
    fprintf("%7.3f (%c)\n", abs(value), CorTorZ)
 
end

