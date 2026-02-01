import { subscribe } from '../../hcm-pulse-adjacency-bus/bus/index.js';

let internalDrift = 0;

subscribe(pulse => {
  // الشبكة لا تستجيب، بل تنحرف
  internalDrift += (pulse.intensity - 0.5) * 0.02;
});

export function readGridDrift() {
  return internalDrift;
}
