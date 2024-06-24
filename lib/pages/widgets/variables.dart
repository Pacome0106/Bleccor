import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_version_plus/new_version_plus.dart';
import 'package:store_redirect/store_redirect.dart';

import '../../generated/assets.dart';

BorderRadius borderRadius = BorderRadius.circular(15);
BorderRadius borderRadius_2 = BorderRadius.circular(10);
SizedBox sizedBox = const SizedBox(height: 10);
SizedBox sizedBox2 = const SizedBox(width: 10);

// store redirect
final storeRedirect = StoreRedirect.redirect(
  androidAppId: 'com.bitz.bleccor',
  iOSAppId: 'com.bitz.bleccor',
);

//get all version to app
final newVersion = NewVersionPlus(
  iOSId: 'com.disney.disneyplus',
  androidId: 'com.bitz.bleccor',
  androidPlayStoreCountry: null,
);

// link of playStore
const String playStoreUrl =
    'https://play.google.com/store/apps/details?id=com.bitz.bleccor';
// link of privacy policy
const String privacyUrl = 'https://raw.githubusercontent.com/Pacome0106/Bleccor/main/Privacy.md?token=GHSAT0AAAAAACSVAH357JRLRTE26U5BUAZIZTAGFVQ';
// link of terms & conditions
const String termsAndConditions = 'https://raw.githubusercontent.com/Pacome0106/Bleccor/main/Privacy.md?token=GHSAT0AAAAAACSVAH357JRLRTE26U5BUAZIZTAGFVQ';

const String codeAccess = "uRf87Dc";

List<Map<String, dynamic>> simulators = [
  {
    'title': 'Bilan - Matière sans réaction',
    'subtitle': "Lorsqu’aucune réaction n’a lieu dans le système",
    'question':
        """Combien de temps prendra t-il pour vider un réservoir contenant X m3 d’eau si la vanne au bas du tank est ouverte et que l’eau jaillit et coule au travers cette vanne au taux de:""",
    'enter': '0.300',
    'image': Assets.assetsBillan01,
  },
  {
    'title':'Bilan - Matière sans réaction',
    'subtitle':'Cas dans le processus de Distillation',
    'question':"""Un mélange liquide contient x(%) en masse de benzène et le reste de Toluène doit être séparé dans une colonne à distiller continue. 
Si la densité du liquide est de p et que y de mélange est alimenté dans la colonne, déterminez le débit massique de chaque constituant dans le distillat (overhead stream) et 
le condensat (bottom stream) lorsque l’on atteint une pureté de z (%) en benzène dans la partie supérieure de la colonne et w (%) dans sa partie inferieure.
    """,
    'enter':'',
    'image':Assets.assetsBillan02,
  },
  {
    'title': 'Bilan - Matière avec réaction',
    'subtitle': "Lorsqu’au moins une réaction a lieu dans le système",
    'question':
        """Une réaction stoechiométrique en phase liquide A --> B se réalise dans un réacteur (continu à parfaite agitation) de V litres.
Le diagramme ci-après représente le processus. L’agitation étant parfaite, la concentration du produit sortant du réacteur est la même que celle de la solution à l’intérieur de ce dernier. Cette solution contient initialement CA mol/l du réactif A. Calculez CA,S, concentration de A pour un processus non-transitoire""",
    'enter': '',
    'image': Assets.assetsBillan03,
  },
  {
    'title': 'Dimensionnement de la conduite forcée d’une centrale hydroélectrique',
    'subtitle': "Dimensionnement de la conduite forcée",
    'question':
    """L’énergie nécessaire pour pallier le déficit de la ville de X doit aller au-delà d’une nouvelle production de 𝑷e MW; par prévention dimensionnons en plus de cette énergie à produire. 
•Soit 𝑷e MW 
•Nous savons que la puissance est donnée par la relation 
  𝑷e= η𝜌𝑄𝑔[(Δ𝒉+𝒛𝟏)+𝟏/𝟐𝒈(𝒗𝟏𝟐−𝒗𝟐𝟐)−𝒇(𝑳/𝑫)(𝒗𝟐/𝟐𝒈)]
 𝑆1𝑣1=𝑆2𝑣2
 Prenons η l’efficacité globale ou rendement du système η par défaut pour l’estimation d’une bonne production.
•Prenons aussi 𝜌=1000 kg/m3 qui est la densité de l’eau à une température ambiante de 20°C à X et la hauteur h m 
•Q  m3/s : debit de la chute la cité X.
Calculez d1(diamètre la conduite en amont), d2(diamètre en aval) et L (longueur) de la conduit force.

Hypothèses :

•les pertes charges peuvent varier entre 5 à 20% 
•Les machines installées présentent des pertes en hauteur de 20 % or, les machines à installer nécessitent des conduites beaucoup plus larges en termes de diamètre. D’où les pertes peuvent être estimés à j % de l’énergie; les pertes de charge étant inversement proportionnelles au diamètre.;
•soit à supposer aussi le diamètre à l’entrée, 𝑑1= 4/3 d2""",
    'enter': '',
    'image': Assets.assetsBillan04,
  },

];
