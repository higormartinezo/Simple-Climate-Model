# Simple Climate Model
A simple climate model (energy budget) to conduct experiences about Earth's climate. 

#PART 1 - THE BLACK BODY MODEL 

#Default value for the luminosity of the sun (Watts)
sun_luminosity = 3.845E+26

#Factor for determining the luminosity of the sun (0.98-1.02)
luminosity_factor = 1 

#Distance from the sun (Astronomical Units)
sun_distance = 1

#Solar energy reaching the planet at the top of atmosphere (watts/meter2)
incoming_solar_energy = 
  ((luminosity_factor*sun_luminosity)/((4*pi*(sun_distance*149600000000)^2)))

#Black body surface temperature (Kelvin)
blackbody_temperature =
  (((incoming_solar_energy)/(4*(0.0000000567)))^0.25) 

#PART 2 - SURFACE FEATURES 
#The area is given in Percentage. 

#Surface composition: Ocean 
ocean_surface_area = 0.7
ocean_albedo = 0.05 

#Surface composition: Land

#Vegetation 
vegetation_surface_area = 0.2 
vegetation_albedo = 0.1 
#Desert 
desert_surface_area = 0.05 
desert_albedo = 0.2 
#Snow and ice 
ice_surface_area = 0.05 
ice_albedo = 0.7 

#Solar Energy Reflected 
ocean_energy_reflected = ((incoming_solar_energy)*(ocean_surface_area)*(ocean_albedo))
vegetation_energy_reflected = ((incoming_solar_energy)*(vegetation_surface_area)*(vegetation_albedo))
desert_energy_reflected = ((incoming_solar_energy)*(desert_surface_area)*(desert_albedo))
ice_energy_reflected = ((incoming_solar_energy)*(ice_surface_area)*(ice_albedo))

surface_energy_reflected = (ocean_energy_reflected + vegetation_energy_reflected + desert_energy_reflected + ice_energy_reflected)

#Solar Energy Absorbed 
energy_absorbed = (incoming_solar_energy - surface_energy_reflected)

#Temperature considering reflection at surface (Kelvin)
temperature_part2 = 
  (((energy_absorbed)/(4*(0.0000000567)))^0.25)

#PART3 - CLOUDS
cloud_area = 0.7
cloud_albedo = 0.3

cloud_energy_reflected = ((incoming_solar_energy)*(cloud_area)*(cloud_albedo)) 

total_energy_absorbed = (incoming_solar_energy)-(surface_energy_reflected+cloud_energy_reflected)

#Planetary Albedo 
planetary_albedo = 
  ((ocean_surface_area*ocean_albedo)+(vegetation_surface_area*vegetation_albedo)+(desert_surface_area*desert_albedo)+(ice_surface_area*ice_albedo)+(cloud_area*cloud_albedo))

#Effective Temperature - Planet with Albedo (Kelvin)
effective_temperature = 
  ((incoming_solar_energy/4*(1-planetary_albedo)/0.0000000567)^0.25)

#PART 4 - GREENHOUSE EFFECT 

#Concentrations (ppm)
CO2_concentration = 411
CH4_concentration = 1.87

#Partial Pressure (e) of mixing ratio 
eCO2 = (CO2_concentration*0.000001*50000)
eCH4 = (CH4_concentration*0.000001*50000)
eH20 = 18 

#Optical dephs (T) from partial pressures
TCO2 = (0.029*sqrt(eCO2))
TCH4 = (0.725*sqrt(eCH4))
TH20 = (0.087*sqrt(eH20))
total_T = TCO2+TCH4+TH20

#Emissivity 
emissivity = 1/(1+0.75*total_T)

#PART 5 - SURFACE TEMPERATURE 

#Stefan–Boltzmann law
E = (0.0000000567*effective_temperature^4) 

surface_temperature = (E/(emissivity*0.0000000567))^0.25
surface_temperature_c = surface_temperature - 273.15
