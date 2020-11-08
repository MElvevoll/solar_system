import 'dart:ffi';

class Planet {
  String id;
  String name;
  bool isPlanet;
  String moons;
  int semimajorAxis;
  int perihelion;
  int aphelion;
  Float eccentricity;
  Float inclination;
  Mass mass;
  Vol vol;
  Float density;
  Float gravity;
  Float escape;
  Float meanRadius;
  Float equaRadius;
  Float polarRadius;
  int flattening;
  String dimension;
  Float sideralOrbit;
  Float sideralRotation;
  AroundPlanets aroundPlanets;
  String discoveredBy;
  String discoveryDate;
  int axialTilt;
  String rel;

  Planet(
      {this.id,
      this.name,
      this.isPlanet,
      this.moons,
      this.semimajorAxis,
      this.perihelion,
      this.aphelion,
      this.eccentricity,
      this.inclination,
      this.mass,
      this.vol,
      this.density,
      this.gravity,
      this.escape,
      this.meanRadius,
      this.equaRadius,
      this.polarRadius,
      this.flattening,
      this.dimension,
      this.sideralOrbit,
      this.sideralRotation,
      this.aroundPlanets,
      this.discoveredBy,
      this.discoveryDate,
      this.axialTilt,
      this.rel});

  factory Planet.fromJson(Map<String, dynamic> json) {
    return Planet(
        id: json['id'],
        name: json['englishName'],
        isPlanet: json['isPlanet'],
        moons: json['moons'],
        semimajorAxis: json['semimajorAxis'],
        perihelion: json['perihelion'],
        aphelion: json['aphelion'],
        eccentricity: json['eccentricity'],
        inclination: json['inclination'],
        mass: Mass.fromJson(json['mass']),
        vol: Vol.fromJson(json['vol']),
        density: json['density'],
        gravity: json['gravity'],
        escape: json['escape'],
        meanRadius: json['meanRadius'],
        equaRadius: json['equaRadius'],
        polarRadius: json['polarRadius'],
        flattening: json['flattening'],
        dimension: json['dimension'],
        sideralOrbit: json['sideralOrbit'],
        sideralRotation: json['sideralRotation'],
        aroundPlanets: AroundPlanets.fromJson(json['aroundPlanets']),
        discoveredBy: json['disoveredBy'],
        discoveryDate: json['disoveryDate'],
        axialTilt: json['axialTilt'],
        rel: json['rel']);
  }
}

class Mass {
  Float massValue;
  int massExponent;

  Mass({this.massValue, this.massExponent});

  factory Mass.fromJson(Map<String, dynamic> json) {
    return Mass(
        massValue: json["massValue"], massExponent: json['massExponent']);
  }
}

class Vol {
  Float volValue;
  int volExponent;

  Vol({this.volValue, this.volExponent});

  factory Vol.fromJson(Map<String, dynamic> json) {
    return Vol(volValue: json['volValue'], volExponent: json['volExponent']);
  }
}

class AroundPlanets {
  String planet;
  String rel;

  AroundPlanets({this.planet, this.rel});

  factory AroundPlanets.fromJson(Map<String, dynamic> json) {
    return AroundPlanets(planet: json['planet'], rel: json['rel']);
  }
}
