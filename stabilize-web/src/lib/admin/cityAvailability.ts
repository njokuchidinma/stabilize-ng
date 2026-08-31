export type CityAvailability = {
  region: string;
  state: string;
  cities: string[];
};

export const cityAvailability: CityAvailability[] = [
  {
    region: 'South West',
    state: 'Lagos State',
    cities: ['Lagos', 'Ikeja', 'Lekki', 'Ikorodu', 'Epe'],
  },
  {
    region: 'North Central',
    state: 'FCT',
    cities: ['Abuja', 'Garki', 'Maitama', 'Gwarinpa', 'Wuse'],
  },
  {
    region: 'South South',
    state: 'Rivers State',
    cities: ['Port Harcourt', 'Bonny', 'Obio-Akpor', 'Eleme'],
  },
  {
    region: 'South East',
    state: 'Enugu State',
    cities: ['Enugu', 'Nsukka', 'Agbani', 'Udi'],
  },
  {
    region: 'North West',
    state: 'Kano State',
    cities: ['Kano', 'Wudil', 'Gwarzo', 'Bichi'],
  },
  {
    region: 'South South',
    state: 'Edo State',
    cities: ['Benin City', 'Ekpoma', 'Auchi', 'Uromi'],
  },
];

export function getAvailabilityByRegion(region: string) {
  return cityAvailability.find((entry) => entry.region === region);
}
