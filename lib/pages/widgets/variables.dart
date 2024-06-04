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
const String privacyUrl = 'https://baadhi.com/privacy';
// link of terms & conditions
const String termsAndConditions = 'https://baadhi.com/privacy';

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
    'title':'Bilan - Matière sans réactions',
    'subtitle':'Cas dans le processus de Distillation',
    'question':"""Un mélange liquide contient x(%) en masse de benzène et 55 % de Toluène doit être séparé dans une colonne à distiller continue. 
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

];
