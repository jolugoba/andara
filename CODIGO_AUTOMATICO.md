# Generación Automática de Código - Andara

## Descripción General

Este documento explica cómo se ha implementado la generación automática de código en el proyecto Andara, específicamente para los carruseles de imágenes.

## Problema Original

El código original contenía **~664 líneas** con mucha duplicación:
- 7 listas de imágenes diferentes (e, ev, r, m, ed, p, c)
- 7 variables `currentIndex` separadas
- 14 métodos casi idénticos (`_goToPrevious` y `_goToNext` para cada carrusel)
- 7 widgets Stack casi idénticos con la misma estructura

## Solución Implementada

Se creó un widget reutilizable `ImageCarousel` que elimina toda la duplicación de código.

### Archivo Creado: `lib/widgets/image_carousel.dart`

Este widget encapsula toda la lógica del carrusel:
- Gestión del índice actual
- Navegación (anterior/siguiente)
- Renderizado de la imagen
- Flechas de navegación

### Refactorización de `lib/main.dart`

El archivo principal se redujo de **664 líneas a ~185 líneas** (~72% de reducción):

**Antes:**
```dart
int currentIndexe = 0;
final List<String> imagese = [...];
void _goToPreviouse() { ... }
void _goToNexte(int index) { ... }
// ... 400+ líneas de código duplicado para cada carrusel
Stack(...) // Widget complejo y repetitivo
```

**Después:**
```dart
final List<String> imagese = [...];
// ... solo las definiciones de listas
ImageCarousel(images: imagese)
```

## Cómo Agregar un Nuevo Carrusel

Para agregar un nuevo carrusel de imágenes, solo necesitas:

1. **Definir la lista de imágenes** en `_SideMenuScreenState`:
```dart
final List<String> imagesNuevo = [
  'assets/images/nuevo1.png',
  'assets/images/nuevo2.png',
  'assets/images/nuevo3.png',
];
```

2. **Agregar las imágenes a `pubspec.yaml`**:
```yaml
flutter:
  assets:
    - assets/images/nuevo1.png
    - assets/images/nuevo2.png
    - assets/images/nuevo3.png
```

3. **Usar el widget en `views`**:
```dart
views: [
  ImageCarousel(images: imagese),
  ImageCarousel(images: imagesev),
  // ... otros carruseles existentes
  ImageCarousel(images: imagesNuevo), // Nuevo carrusel
],
```

4. **Agregar el item del menú** correspondiente:
```dart
items: [
  // ... items existentes
  Container(
    child: Column(
      children: [
        Icon(Icons.nuevo_icono, color: Colors.white, size: 50)
      ],
    )
  ),
],
```

## Ventajas de esta Implementación

1. **Mantenibilidad**: Cambios en la lógica del carrusel se hacen en un solo lugar
2. **Reutilización**: El widget puede usarse en cualquier parte de la aplicación
3. **Menos Errores**: Código duplicado = oportunidades de errores duplicados
4. **Legibilidad**: El código es más fácil de entender y mantener
5. **Escalabilidad**: Agregar nuevos carruseles es trivial

## Personalización del Carrusel

El widget `ImageCarousel` acepta parámetros opcionales para personalización:

```dart
ImageCarousel(
  images: imagese,
  padding: EdgeInsets.only(left: 100, right: 100, top: 10, bottom: 30),
)
```

## Patrón de Diseño Utilizado

Este refactorización implementa el **patrón de composición** de widgets de Flutter, promoviendo la reutilización y modularidad del código.

## Próximos Pasos Sugeridos

Para continuar mejorando la generación automática de código:

1. **Modelo de Datos**: Crear una clase `Section` que encapsule nombre, ícono e imágenes
2. **Generación de Menú**: Generar automáticamente los items del menú desde una lista de secciones
3. **Configuración JSON**: Cargar la configuración de secciones desde un archivo JSON
4. **Code Generation**: Usar herramientas como `build_runner` y `freezed` para generación de código en tiempo de compilación

## Ejemplo de Extensión Futura

### Opción 1: Enfoque Basado en Datos (IMPLEMENTADO)

Se ha creado un archivo alternativo `lib/main_automated.dart` que demuestra un enfoque completamente automatizado.

**Archivos creados:**
- `lib/models/app_section.dart`: Define el modelo de datos `AppSection`
- `lib/main_automated.dart`: Versión completamente automatizada de main.dart

**Uso:**

1. **Definir las secciones en un solo lugar** (`app_section.dart`):
```dart
static final List<AppSection> sections = [
  AppSection(
    name: 'Ecommerce',
    icon: Icons.shopping_cart_checkout,
    images: ['assets/images/e1.png', ...],
  ),
  // ... más secciones
];
```

2. **Todo se genera automáticamente**:
```dart
// Generar views automáticamente
views: AppSections.sections
    .map((section) => ImageCarousel(images: section.images))
    .toList(),

// Generar items del menú automáticamente
items: AppSections.sections.map(
  (section) => Container(
    child: Column(children: [Icon(section.icon, color: Colors.white, size: 50)])
  ),
).toList(),

// Generar títulos automáticamente
title: Text(AppSections.getSectionName(_index.value)),
```

**Para agregar una nueva sección**, solo necesitas:
1. Agregar un nuevo `AppSection` a la lista en `app_section.dart`
2. Agregar las imágenes a `pubspec.yaml`
3. ¡Listo! Todo lo demás se genera automáticamente.

### Opción 2: Generación de Código con build_runner

Para proyectos más grandes, considera usar herramientas como:
- `build_runner` + `json_serializable` para generar código desde JSON
- `freezed` para generar modelos inmutables
- Configurar secciones en un archivo JSON externo

Ejemplo de configuración JSON:
```json
{
  "sections": [
    {
      "name": "Ecommerce",
      "icon": "shopping_cart_checkout",
      "images": ["e1.png", "e2.png", ...]
    }
  ]
}
```
