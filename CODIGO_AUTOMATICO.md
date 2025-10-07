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

```dart
class Section {
  final String name;
  final IconData icon;
  final List<String> images;
  
  const Section({
    required this.name,
    required this.icon,
    required this.images,
  });
}

final sections = [
  Section(name: 'Ecommerce', icon: Icons.shopping_cart_checkout, images: imagese),
  Section(name: 'Events', icon: Icons.calendar_month, images: imagesev),
  // ... más secciones
];

// Generar views automáticamente
views: sections.map((s) => ImageCarousel(images: s.images)).toList(),

// Generar items automáticamente
items: sections.map((s) => Container(
  child: Column(children: [Icon(s.icon, color: Colors.white, size: 50)])
)).toList(),
```

Este enfoque permitiría agregar nuevas secciones con una sola línea de código.
