# Aplicație Flutter GUST - Documentație

## Descriere
Aceasta este o aplicație completă Flutter pentru GUST (Gestiune și Urmărire a Sugarului și Tendinței), care se conectează la backend-ul Java Spring Boot pentru a oferi funcționalități de monitorizare a consumului de zahăr.

## Structură
Aplicația este structurată în mai multe module și utilizează arhitectura modernă recomandată pentru Flutter, inclusiv state management cu Riverpod, navigație cu GoRouter și stocare securizată a token-urilor JWT.

### Dependențe principale
```yaml
dependencies:
  flutter:
    sdk: flutter
  dio: ^5.3.2               # HTTP client cu suport pentru interceptori
  flutter_riverpod: ^2.4.0  # State management
  go_router: ^10.1.2        # Navigație
  flutter_secure_storage: ^8.0.0  # Stocare securizată pentru token-uri JWT
  fl_chart: ^0.64.0         # Grafice pentru analytics
  intl: ^0.18.1             # Formatarea datelor și localelor
  shared_preferences: ^2.2.1  # Stocare preferințe non-sensibile
  freezed_annotation: ^2.4.1  # Imutabilitate pentru modele de date
  json_annotation: ^4.8.1    # Serializare JSON
  connectivity_plus: ^4.0.2  # Verificarea conectivității
  path_provider: ^2.1.1     # Acces la sistemul de fișiere
  file_picker: ^5.5.0       # Selectare fișiere (pentru export)
  permission_handler: ^11.0.0  # Gestionarea permisiunilor
  url_launcher: ^6.1.14     # Deschiderea URL-urilor externe
```

### Structura directoarelor
```
lib/
├── main.dart                  # Punctul de intrare în aplicație
├── app/
│   ├── app.dart               # Widget-ul principal al aplicației
│   └── router.dart            # Configurarea rutelor cu GoRouter
├── config/
│   ├── api_config.dart        # Configurare API (URL-uri, timeouts)
│   └── app_config.dart        # Configurare aplicație (teme, constante)
├── models/
│   ├── user.dart              # Model pentru utilizator
│   ├── sugar_log.dart         # Model pentru log-uri de zahăr
│   ├── emotion.dart           # Enum pentru emoții
│   └── ...                    # Alte modele de date
├── providers/
│   ├── auth_provider.dart     # Provider pentru autentificare
│   ├── sugar_log_provider.dart # Provider pentru log-uri
│   ├── analytics_provider.dart # Provider pentru analytics
│   └── ...                    # Alți provideri
├── repositories/
│   ├── auth_repository.dart   # Repository pentru autentificare
│   ├── sugar_log_repository.dart # Repository pentru log-uri
│   └── ...                    # Alte repository-uri
├── screens/
│   ├── auth/                  # Ecrane de autentificare
│   ├── home/                  # Ecranul principal
│   ├── sugar_logs/            # Ecrane pentru log-uri
│   ├── analytics/             # Ecrane pentru analytics
│   ├── community/             # Ecrane pentru comunitate
│   └── profile/               # Ecrane pentru profil
├── services/
│   ├── api_service.dart       # Serviciu de bază pentru API
│   ├── auth_service.dart      # Serviciu pentru autentificare
│   ├── storage_service.dart   # Serviciu pentru stocare securizată
│   └── ...                    # Alte servicii
├── utils/
│   ├── date_utils.dart        # Utilitare pentru date
│   ├── validators.dart        # Validatori pentru formulare
│   └── ...                    # Alte utilitare
└── widgets/
    ├── common/                # Widget-uri comune
    └── ...                    # Alte widget-uri specifice
```

## Autentificare și Securitate
Aplicația implementează un sistem de autentificare securizat bazat pe JWT, folosind `flutter_secure_storage` pentru stocarea token-urilor și Dio pentru gestionarea cererilor HTTP. Token-urile JWT sunt stocate criptat pe dispozitiv și atașate automat la header-ele HTTP pentru autorizare.

## State Management
Aplicația folosește Riverpod pentru gestionarea stării, cu provideri specifici pentru diferite domenii:
- `AuthProvider` - gestionează starea de autentificare
- `SugarLogProvider` - gestionează log-urile de zahăr
- `AnalyticsProvider` - gestionează datele de analiză
- `CommunityProvider` - gestionează datele despre comunitate

## Navigation
Navigarea este implementată cu GoRouter, cu protecții pentru rutele autentificate și redirecționare către login pentru utilizatorii neautentificați.

## Mod Offline
Aplicația implementează cache-ing local pentru a permite funcționarea parțială în mod offline, sincronizând datele cu serverul când conexiunea este restabilită.

## Grafice și Vizualizări
Pentru vizualizarea datelor de analiză, aplicația folosește biblioteca `fl_chart` pentru a crea grafice interactive care prezintă tendințe, modele de consum și sumarul emoțional.

## Validare și Error Handling
Toate formularele implementează validare complexă pentru a asigura integritatea datelor. Erorile de rețea și de server sunt gestionate adecvat, cu mesaje prietenoase pentru utilizator.

## Responsive Design
UI-ul este construit folosind Material Design 3, cu atenție specială la responsivitatea pe diferite dimensiuni de ecran și orientări.

## Exportul Datelor
Aplicația suportă exportul datelor în format CSV, permițând utilizatorilor să descarce istoricul lor de consum pentru analiză externă.

## Testing
Codul include teste pentru logica de business și componentele UI, asigurând stabilitatea aplicației.