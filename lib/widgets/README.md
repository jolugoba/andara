# Widgets Reutilizables de Andara

Este directorio contiene widgets reutilizables para la aplicación Andara-Med.

## ImageCarousel

Widget de carrusel de imágenes con navegación mediante flechas.

### Características

- 📸 Muestra imágenes desde assets
- ⬅️➡️ Navegación con flechas izquierda/derecha
- 🎨 Personalizable con padding
- 🔄 Gestión automática del estado interno
- 🚀 Optimizado y ligero

### Uso Básico

```dart
import 'package:andara/widgets/image_carousel.dart';

ImageCarousel(
  images: [
    'assets/images/image1.png',
    'assets/images/image2.png',
    'assets/images/image3.png',
  ],
)
```

### Uso Avanzado

```dart
ImageCarousel(
  images: myImageList,
  padding: EdgeInsets.only(
    left: 100,
    right: 100,
    top: 10,
    bottom: 30,
  ),
)
```

### Parámetros

| Parámetro | Tipo | Requerido | Default | Descripción |
|-----------|------|-----------|---------|-------------|
| `images` | `List<String>` | Sí | - | Lista de rutas de imágenes en assets |
| `padding` | `EdgeInsets` | No | `EdgeInsets.only(left: 120, right: 120, top: 20, bottom: 40)` | Padding alrededor del contenedor de la imagen |

### Comportamiento

- Las flechas de navegación están siempre visibles
- La flecha izquierda solo funciona si no estás en la primera imagen
- La flecha derecha solo funciona si no estás en la última imagen
- El estado (índice actual) se gestiona internamente en el widget

### Ejemplo Completo

Ver `lib/main.dart` o `lib/main_automated.dart` para ejemplos de uso en la aplicación.
