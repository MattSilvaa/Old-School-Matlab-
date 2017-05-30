%%By Matheus Da Silva
% Doesn't really need the "for loop" but I included it to be safe
%%Main code
for i = 1:1:365
    x = 1:1:365;
    a = ((sind(23.45*sind(360*(284+x)/365))*sind(32.7)*cosd(25)-sind(23.45*sind(360*(284+x)/365))*cosd(32.7)*sind(25)*cosd(10)+cosd(23.45*sind(360*(284+x)/365))*cosd(32.7)*cosd(25)*cosd(30)+cosd(23.45*sind(360*(284+x)/365))*sind(32.7)*sind(25)*cosd(10)*cosd(30)+cosd(23.45*sind(360*(284+x)/365))*sind(25)*sind(10)*sind(30)));
    b =((cosd(32.7)*cosd(23.45*sind(360*(284+x)/365))*cosd(30)+sind(32.7)*sind(23.45*sind(360*(284+x)/365))));
    y = (a./b);
end


%%Plot
figure
plot(x,y,'r') %giving it a little color
xlim([1 365]) %%Set the right limit
title('ME 556 Homework Problem 5')
xlabel('Days in the Year')
ylabel('R_b')