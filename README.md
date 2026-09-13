# Práctica 2: Exploración del Editor y Núcleo de Godot 4 - Fase 1

## Memorama de Fórmula 1
Proyecto interactivo desarrollado en Godot 4 que implementa un juego de memorama completo con temática de F1.
* **Contenido:** 11 pares (22 cartas en total) representando a las escuderías Red Bull, Ferrari, Mercedes, McLaren, Aston Martin, Alpine, Williams, RB, Audi, Haas y Cadillac, además de un diseño de dorso unificado.
* **Implementación técnica:** Uso de nodos `TextureButton` con propiedades de escalado (`Ignore Texture Size` y `Keep Aspect Centered`), contenedor dinámico `GridContainer` y comunicación desacoplada mediante señales.

---

## Preguntas Guía para la Reflexión

### 1. ¿Qué diferencia observas entre un nodo y una escena?
Un **nodo** es el bloque fundamental e indivisible de Godot; cada uno tiene una función específica (mostrar una imagen, reproducir sonido, manejar colisiones o gestionar una cuadrícula). Una **escena** es un árbol jerárquico compuesto por uno o más nodos guardados en un archivo (`.tscn`), el cual puede funcionar como una entidad reutilizable completa (por ejemplo, una carta individual) o como una pantalla entera (el tablero principal).

### 2. ¿Por qué es importante la jerarquía de nodos (qué hijo depende de qué padre)?
La jerarquía define la relación de dependencia, transformación y ciclo de vida en el árbol de escenas. Si el nodo padre cambia de posición, escala o visibilidad, todos sus hijos heredan ese cambio. Además, contenedores como `GridContainer` requieren que los elementos sean sus hijos directos para poder posicionarlos y alinearlos automáticamente.

### 3. ¿Cómo se relaciona el Inspector con el Viewport?
El **Viewport (área 2D/3D)** es el espacio de trabajo visual donde se compone y visualiza la disposición espacial de los nodos. El **Inspector** es el panel de control de propiedades donde se ajustan de manera precisa y numérica los atributos del nodo seleccionado (texturas, tamaños mínimos, anclajes y márgenes) cuyos cambios se reflejan inmediatamente en el Viewport.

### 4. ¿Qué ventajas tiene crear escenas reutilizables?
Permite aplicar el principio de modularidad y código limpio: se diseña y programa la lógica de la carta (`Carta.tscn`) una sola vez y luego se puede instanciar dinámicamente tantas veces como sea necesario (`22` cartas) mediante código. Cualquier mejora o corrección en la escena base se propaga de inmediato a todas las instancias en el tablero.
