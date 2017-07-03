# material Graphite-Epoxy UD composite laminate

cond=[0.01386,0.00262,0.00205,0.00173,0.00173];
temp_cond=[10,524,565,815,3316]
temp_cond=temp_cond+273;

density=[1.5967,1.5967,1.1497,1.1497];
density=density*1000;
temp_dens=[10,523,524,3316]
temp_dens=temp_dens+273

sp=[1.2250,2.0569,5.0095,4.9046,1.5939,2.5098];
temp_sp=[10,330,357,496,524,3316]


figure
scatter(temp_cond,cond)
xlabel('Temp in Kelvin')
ylabel('Thermal conductivity W/mK')
title('variation of thermal cond Chen')

figure
scatter(temp_dens,density)
xlabel('Temp in kelvin')
ylabel('Density in Kg/m^3')

figure
scatter(temp_sp,sp)
xlabel('Temp in kelvin')
ylabel('Specific heat in KJ/Kg-K')
