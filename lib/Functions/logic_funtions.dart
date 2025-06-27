String getDirection(num degree) {
  if (degree >= 0 && degree < 45) {
    return 'North';
  } else if (degree >= 45 && degree < 90) {
    return 'North-East';
  } else if (degree >= 90 && degree < 135) {
    return 'East';
  } else if (degree >= 135 && degree < 180) {
    return 'South-East';
  } else if (degree >= 180 && degree < 225) {
    return 'South';
  } else if (degree >= 225 && degree < 270) {
    return 'South-West';
  } else if (degree >= 270 && degree < 315) {
    return 'West';
  } else if (degree >= 315 && degree < 360) {
    return 'North-West';
  } else {
    return 'NA';
  }
}
