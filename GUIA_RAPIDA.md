# Guía Rápida: Código Automático en Andara

## 🚀 Inicio Rápido

Esta guía te muestra cómo trabajar con el nuevo sistema de generación automática de código en Andara.

## 📋 Dos Enfoques Disponibles

### Opción A: Enfoque Simple (`main.dart`)
- ✅ Usa el widget `ImageCarousel` reutilizable
- ✅ Reducción del 72% en líneas de código
- ✅ Fácil de entender para principiantes

### Opción B: Enfoque Avanzado (`main_automated.dart`) ⭐ RECOMENDADO
- ✅ Totalmente automatizado
- ✅ Agregar secciones con 1 línea de código
- ✅ Ideal para proyectos en crecimiento

## 🔧 Cómo Agregar una Nueva Sección

### Con el Enfoque Simple (main.dart)

#### Paso 1: Define las imágenes
```dart
// En lib/main.dart, dentro de _SideMenuScreenState
final List<String> imagesNueva = [
  'assets/images/nueva1.png',
  'assets/images/nueva2.png',
  'assets/images/nueva3.png',
];
```

#### Paso 2: Agrega las imágenes a pubspec.yaml
```yaml
flutter:
  assets:
    - assets/images/nueva1.png
    - assets/images/nueva2.png
    - assets/images/nueva3.png
```

#### Paso 3: Agrega el carrusel a views
```dart
views: [
  ImageCarousel(images: imagese),
  ImageCarousel(images: imagesev),
  // ... existentes
  ImageCarousel(images: imagesNueva), // NUEVO
],
```

#### Paso 4: Agrega el item del menú
```dart
items: [
  Container(),
  // ... existentes
  Container(
    child: Column(
      children: [
        Icon(Icons.tu_icono, color: Colors.white, size: 50)
      ],
    )
  ),
],
```

#### Paso 5: Actualiza el título
```dart
builder: (_, value, __) => Text(
  _index.value == 1 ? "Ecommerce" :
  _index.value == 2 ? "Events" :
  // ... existentes
  _index.value == 8 ? "Nueva Sección" : "Ecommerce",
  style: TextStyle(color: Colors.black)
),
```

---

### Con el Enfoque Avanzado (main_automated.dart) ⭐

#### Paso 1: Agrega la sección a AppSections
```dart
// En lib/models/app_section.dart
static final List<AppSection> sections = [
  // ... secciones existentes
  AppSection(
    name: 'Nueva Sección',
    icon: Icons.tu_icono,
    images: [
      'assets/images/nueva1.png',
      'assets/images/nueva2.png',
      'assets/images/nueva3.png',
    ],
  ),
];
```

#### Paso 2: Agrega las imágenes a pubspec.yaml
```yaml
flutter:
  assets:
    - assets/images/nueva1.png
    - assets/images/nueva2.png
    - assets/images/nueva3.png
```

#### Paso 3: ¡Listo! 🎉
Todo lo demás se genera automáticamente:
- ✅ El carrusel
- ✅ El item del menú
- ✅ El título del AppBar
- ✅ La navegación

---

## 🔄 Cómo Cambiar de un Enfoque a Otro

### Para usar el enfoque avanzado:

1. Renombra `main.dart` a `main_simple.dart` (opcional, para respaldo)
2. Renombra `main_automated.dart` a `main.dart`
3. Reinicia la aplicación

```bash
cd lib
mv main.dart main_simple.dart
mv main_automated.dart main.dart
```

---

## 💡 Ejemplos Prácticos

### Ejemplo 1: Agregar Sección "Promociones"

**Con enfoque avanzado:**
```dart
AppSection(
  name: 'Promociones',
  icon: Icons.local_offer,
  images: [
    'assets/images/promo1.png',
    'assets/images/promo2.png',
  ],
),
```

### Ejemplo 2: Agregar Sección "Testimonios"

**Con enfoque avanzado:**
```dart
AppSection(
  name: 'Testimonios',
  icon: Icons.reviews,
  images: [
    'assets/images/test1.png',
    'assets/images/test2.png',
    'assets/images/test3.png',
  ],
),
```

---

## 🎨 Personalización del Carrusel

### Cambiar el padding del carrusel

```dart
// En widgets/image_carousel.dart, línea 11
padding: const EdgeInsets.only(
  left: 100,    // Cambia estos valores
  right: 100,
  top: 10,
  bottom: 30
),
```

### Cambiar el tamaño de las flechas

```dart
// En widgets/image_carousel.dart, líneas 65 y 76
Icon(
  Icons.arrow_left,
  size: 80,  // Cambia de 100 a 80 (más pequeño)
  color: Colors.black.withOpacity(0.7),
)
```

---

## 📚 Recursos Adicionales

- **Documentación Completa**: Ver `CODIGO_AUTOMATICO.md`
- **Comparación Detallada**: Ver `COMPARACION.md`
- **Documentación del Widget**: Ver `lib/widgets/README.md`

---

## ❓ Preguntas Frecuentes

### ¿Qué enfoque debo usar?

- 👨‍🎓 **Principiante**: Usa `main.dart` (enfoque simple)
- 👨‍💼 **Avanzado**: Usa `main_automated.dart` (enfoque automatizado)
- 🏢 **Proyecto en Producción**: Definitivamente `main_automated.dart`

### ¿Puedo mezclar ambos enfoques?

No es recomendable. Elige uno y manténlo consistente.

### ¿Cómo agrego más funcionalidad a los carruseles?

Modifica `lib/widgets/image_carousel.dart` y la funcionalidad se aplicará automáticamente a todos los carruseles.

### ¿Qué pasa si quiero un carrusel con comportamiento diferente?

Crea un nuevo widget (ej: `image_carousel_advanced.dart`) basado en el existente y úsalo donde lo necesites.

---

## 🆘 Ayuda

Si tienes problemas:
1. Revisa que las rutas de las imágenes en `assets/` sean correctas
2. Verifica que las imágenes estén listadas en `pubspec.yaml`
3. Ejecuta `flutter clean` y `flutter pub get`
4. Revisa los archivos de documentación listados arriba

---

## ✅ Checklist para Agregar una Sección

- [ ] Agregar `AppSection` a `lib/models/app_section.dart`
- [ ] Agregar imágenes a `assets/images/`
- [ ] Listar imágenes en `pubspec.yaml`
- [ ] Ejecutar `flutter pub get`
- [ ] Probar la aplicación

¡Eso es todo! 🎉
