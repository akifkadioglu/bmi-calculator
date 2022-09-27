import 'package:get/get.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'bmi': 'Body mass index',
          'male': 'Male',
          'female': 'Female',
          'gender': 'Gender',
          'us_units': 'US units',
          'metric_units': 'Metric units',
          'age': 'Age',
        },
        'de_DE': {
          'bmi': 'Body-Mass-Index',
          'male': 'Männlich',
          'female': 'Weiblich',
          'gender': 'Geschlecht',
          'us_units': 'US-Einheiten',
          'metric_units': 'Metrische Einheiten',
          'age': 'das Alter',
        },
        'tr_TR': {
          'bmi': 'Vücut kitle indeksi',
          'male': 'Erkek',
          'female': 'Kadın',
          'gender': 'Cinsiyet',
          'us_units': 'ABD birimleri',
          'metric_units': 'Metrik birimler',
          'age': 'Yaş',
        },
        'fr_FR': {
          'bmi': 'Indice de masse corporelle',
          'male': 'Homme',
          'female': 'Femelle',
          'gender': 'Le genre',
          'us_units': 'Unités américaines',
          'metric_units': 'Unités métriques',
          'age': 'Âge',
        },
        'es_ES': {
          'bmi': 'Índice de masa corporal',
          'male': 'Masculino',
          'female': 'Femenino',
          'gender': 'Género',
          'us_units': 'Unidades estadounidenses',
          'metric_units': 'Unidades metricas',
          'age': 'Años',
        }
      };
}
