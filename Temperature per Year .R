#SURFACE TEMPERATURE PER YEAR - CONSIDERING CO2 EMISSIONS 

#Greenhouse effect 

#CO2 mixing ration each year (ppm)
Year = (2020:2100)
CO2_mixing_ratio = 1.71*10^-12*exp(1.5916*10^-2*Year)+255

#CH4 mixing ratio (ppm)
CH4_mixing_ratio = 1.6

#Partial Pressure (e) of mixing ratio 
e_mixing_ratio_CO2 = (CO2_mixing_ratio*0.000001*50000)
e_mixing_ratio_CH4 = (CH4_mixing_ratio*0.000001*50000)
e_H20 = 18

#Optical dephs (T) from partial pressures
optical_deph_CO2 = (0.029*sqrt(e_mixing_ratio_CO2))
optical_deph_CH4 = (0.725*sqrt(e_mixing_ratio_CH4))

total_optical_dephs = optical_deph_CO2+optical_deph_CH4+TH20

#Emissivity 
emissivity_model2 = 1/(1+0.75*total_optical_dephs)

#Resulting Surface Temperature 
surface_temperature_year = (E/(emissivity_model2*0.0000000567))^0.25
surface_temperature_year_c = surface_temperature_year - 273.15