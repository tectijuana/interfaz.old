
Por: EDNA SOFIA VELAZQUEZ LOYON

# Capitulo6-DisenoArq-LI

## Antecedentes

La arquitectura ARM fue desarrollada por Acorn Computer Group en la década de los 80's, empresa a la que actualmente conocemos como ARM;
alrededor de 10 billones de procesadores ARM se venden cada año, tomando en cuenta que la mayoría de celulares y tablets los poseen al igual que muchas de las cosas que usamos hoy como cámaras, robots y servidores.

A pesar de esto ARM no crea procesadores directamente, sino que otorga licencia a otras grandes compañias para que los creen, tales como: Samsung, Apple, Qualcomm, etc. ya sea utilizando microarquitecturas por ARM o microarquitectuas desarrolladas internamente bajo su licencia. 

## Lenguaje Ensamblador
El lenguaje ensamblador es la representación "humanamente legible" del lenguaje nativo del computador. Cada intrucción de este lenguaje representa la operación que se va a realizar y los operandos sobre los cuales se va a llevar a cabo. Introducimos instrucciones aritméticas simples y mostramos como son escritas en lenguaje ensamblador, posteriormente difinimos los operandos de la instrucción ARM: registros, memoria y constantes.

### Instrucciones
La operación más común que se lleva a cabo es la suma, en el ejemplo se muestra la suma de las variables b y c que guardan en el resultado en a, escrito en lenguaje de alto nivel y reescrito en lenguaje ensamblador de ARM. 

#### Ejemplo Adición
| Lenguaje Alto Nivel | Ensamblador ARM |       
|-------------------- | ----------------|       
| a = b + c;          | ADD a , b , c   |  

La primera parte de la instrucción **ADD** es llamada _nemotécnico_ e indica la operación a realizar, la operacion es llevada acabo por **b** y **c** los _operandos fuente_ y el resultado es escrito en **a**, el _operando destino_.

#### Ejemplo Substracción
| Lenguaje Alto Nivel | Ensamblador ARM |       
|-------------------- | ----------------|       
| a = b - c;          | SUB a , b , c   |  

El ejemplo de substacción es similar al de adición excepto por la operación de especificación.

### Principios de Diseño

#### Principio de Diseño 1: La regularidad apoya la simplicidad.

Las instrucciones con un número consistente de operandos en este caso son fuente y uno de destino son mas fáciles de codificar y manejar en hardware. El código más complejo en lenguajes de alto nivel se convierten en múltiples instrucciones ARM.
En los lenguajes de alto nivel los comentarios de una línea comienzan con // y continúan hasta el final de la línea, los multilínea comienzan y terminan con diagonal astérisco. En lenguaje ensamblador ARM comienzan con punto y coma y continuan hasta el final de la línea. 

```
ADD t , b , c : t = b + c

```

#### Principio de Diseño 2: Acelere el caso común

El set de instrucciones ARM acelera el caso común incluyendo solo instrucciones simples comunmente usadas. El numero de instrucciones se mantiene pequeño para que cuando el harware necesite decodificar la instrucción y sus operandos sea mas sencillo y rápido. Las operaciones mas elaboradas son menos comunes y se llevan a cabo usando secuencias múltiples de instrucciones simples. Por lo tanto es una computadora de set de instrucciones reducidas (Arquitectura RISC). Las arquitecturas con muchas instrucciones complejas como Intel x86 son arquiecturas CISC.

La arquitectura RISC minimiza la complejidad del hardware y la codificación de las instrucciones mediante mantener el set de distintas instrucciones pequeño.

#### Operandos: Registros, Memoria y Constantes.

Una instrucción opera en operandos. Las instrucciones necesitan un almacenamiento fisico de donde recuperar los datos binarios. Los operandos pueden ser almacenados en registros o memoria, o pueden ser constantes almacenadas en la misma instrucción.
Las computadoras usan varias locaciones para almacenar operandos en orden para optimizar la velocidad y la capacidad de los datos, los operandos almacenados como constantes o registros son rápidamente accesibles pero solo contienen una pequeña cantidad de información, los datos adicionales son accesados a través de la memoria, lo que es más grande pero más lento. 

#### Registros

Las instrucciones necesitan acceder rapidamente a los operandos para que puedan correr velozmente, pero los operandos almacenados en memoria toman más tiempo en retornar. Las arquitecturas ARM usan 16 registros, entre menos registros más rápido pueden ser accesados.

#### Principio de Diseño 3: Lo pequeño es más rápido.

Leer la información de un registro pequeño es mas rápido que leerlo de una gran memoria. 

#### Set de Registros

Del R0 al R12 son usados para almacenar variables, del R0-R3 también tienen usos especiales durante las llamadas, R13-R15 son también llamadas SP, LR, y PC.

#### Constantes Inmediatas

Además del registro de operaciones, las instrucciones ARM pueden usar contantes o operandos _inmediatos_. Estas constantes son llamadas inmediatas, porque sus valores estan disponibles inmediatamente en la instrucción y no requieren un registro o acceso de memoria. 

|    Nombre           |  Uso            |
|-------------------- | ----------------|       
|  R0                 | Argumento, Retonan valor, variable temporal |               
| R1- R3              | Argumento, Variables Temporales   |            
| R4-R11              | Variables Almacenadas   |    
| R12                 |  Variable Temporal  |      
| R13 (SP)            | Puntero de Pila   |      
| R14 (LR)             | Registro de Enlace  |     
| R15(PC)           | Contador de Programa  |

#### Memoria

Si los registros fueran los únicos espacios de almacenamiento para los operandos estaríamos confinados a simples programas de no más de 15 variables. Sin embargo, los datos también pueden ser almacenados en memoria. Mientras que los registros son pequeños y rápidos, la memoria es grande y lenta, por esta razón las variables usadas frecuentemente se mantienen en los registros. En la arquitectura ARM las instrucciones operan únicamente sobre los registros así que la información se guarda en la memoria así se puede mover a un registro antes de ser procesadas. Usando la combinación de memoria y registros, un programa puede accesar a una gran cantidad de datos rápidamente.

ARM utiliza una memoria direccionable por byte. Lo que es que cada byte en memoria tiene una dirección única. Una palabra de 32-bits consiste en 4 bytes de 8 bits., asi que cada palabra es un múltiplo de 4. El bit mas significativo (MSB) se ubica a la derecha y a la izquierda el bit menos significativo. También provee una instrucción de registro de carga (LDR) para leer los datos de memoria a registro. La instrucción LDR especifica la dirección de memoria utilizando el registro base y una compensación.
STR es una instrucción de registro de almacenamiento para escribir los datos del registro a la memoria. 

### Programación

Los lenguajes de software como C o Java, son llamados lenguajes de programación de alto nivel ya que son escritos en un nivel más abstracto que el lenguaje ensamblador. Muchos de los lenguajes de alto nivel utilizan construcciones de software comunes como operaciones lógicas y aritméticas, execuciones condicionales, declaraciones if/else, ciclos for y while, arreglos y llamada de funciones. 

#### Instrucciones de Procesamiento de Datos
#### Instrucciones Lógicas

Las intrucciones lógicas en ARM incluyen _AND, ORR(OR), EOR (XOR), BIC (BIT CLEAR)_. Estas operan bit por bit en dos fuentes y escriben el resultado en un registro destino. La primera fuente siempre es un registro y el segundo es un inmediato u otro registro. 
Otra operación lógica, MVN (MoVe y Not), realiza un no bit a bit en la segunda fuente (un registro inmediato o) y escribe el resultado en el registro de destino.
La instrucción BIC es eficiente para convertir los bits no deseados a cero.

#### Instrucciones de Cambio

Estas instrucciones cambian el valor de un registro a la izquierda o derecha, eliminando bits del final. La instrucción de rotación rota el valor de un registro derecho por arriba de 31 bits. En ARM las operaciones de cambio LSL (cambio lógico izquierdo), LSR (cambio lógico derecho), ASR (Cambio aritmético derecho), ROR (Rotación Derecha). Los cambios izquierdos siempre llenan el bit menos significativo, sin embargo los giros a la derecha pueden ser ambos lógicos (0 cambia a un bit más significativo) o aritmético (el signo del bit cambia al del bit más significativo).

#### Instrucciones de Multiplicación. 

La multiplicación es otra es de las operaciones aritméticas, multiplicar dos números de 32-bits produce un resultado de 64-bits. 
La Arquitectura ARM instrucciones de multiplicación que resultan en productos en 32 y 64 bits. _MUL_ multiplica dos números de 32-bits y da como resultado un número de 32-bits, _UMULL (Multiplicacion de Long sin Signo) y SMULL (Mutliplicación de Long con Signo)_.

#### Banderas de Condición

En las instrucciones ARM podemos utilizar opcionalmente banderas de condición basado en el resultado y las intrucciones subsecuentes se ejecutaran de acuerdo al estado de la bandera condicional. Las banderas de condición también banderas de estatus son: **Negativo (N), Cero (Z), Carreo (C) y Desbordamiento (V).** Estas banderas son colocadas por la ALU y mantenidas en los 4 bits de arriba del Registro de estatus actual del programa 32-bits. 
La forma más común de establecer los bits de estado es con la instrucción de comparación (CMP), que resta el segundo operando fuente del primero y establece los indicadores de condición según el resultado.

#### Branching 

La ventaja de una computadora sobre una calculadora es la habilidad de tomar decisiones, una compoutadora lleva a cabo multiples tareas dependiendo de la entrada. Por ejemplo condiciones if/else, ciclos while y for que condicionalmente ejecutan el código, lo cual es una manera de tomar decisiones ignorando ciertas instrucciones. 

ARM y otras arquitecturas usan instrucciones branch para omitir ciertas secciones de código o repetirlas. 
Un programa usualmente se ejecuta de forma secuencial con el contador incrementando en 4 despues de cada instrucción . Las instrucciones Branch cambian el contador del programa incluyendo dos tipos de Branch: Branch Simple (B) y Branch & Link (BL). Como en otras instrucciones ARM el branch puede ser condicional o no, también son llamados saltos en otras arquitecturas.

```
Branching Condicional 
MOV R0, #4 ; R0 = 4
ADD R1, R0, R0 ; R1 = R0 + R0 = 8
CMP R0, R1 ; set flags based on R0−R1 = −4. NZCV = 1000
BEQ THERE ; branch not taken (Z != 1)
ORR R1, R1, #1 ; R1 = R1 OR 1 = 9
THERE
ADD R1, R1, #78 ; R1 = R1 + 78 = 87

```
#### Declaraciones Condicionales
##### IF
Una declaración IF ejecuta un bloque de código, solo cuando se conoce la condición. En lenguaje ensamblador el IF evalua la condición opuesta a la del lenguaje de alto nivel. 

```
Lenguaje de Alto Nivel

if (apples == oranges)
f = i + 1;
f = f − i;

Lenguaje Ensamblador ARM

; R0 = apples, R1 = oranges, R2 = f, R3 = i
CMP R0, R1 ; apples == oranges ?
BNE L1 ; if not equal, skip if block
ADD R2, R3, #1 ; if block: f = i + 1
L1
SUB R2, R2, R3 ; f = f − i

```

#### IF/ELSE
Ejecutan uno de los dos bloques de código dependiendo de la condición. cuando la condición es conocida de ejecuta el bloque de código correspondiente. 

#### SWITCH/CASE

Ejecuta uno de múltiples bloques de código dependiendo de la condición. Si no se conoce ninguna de las condiciones se ejecuta el bloque de _Default_ 

#### CICLOS WHILE

Repiten la ejecución de un bloque de código mientras la condición no sea conocida. Así como en if/else, los ciclos while se ejecutan de manera opuesta que en los lenguajes de alto nivel; si la condición opuesta es verdadera el ciclo while se detiene.

#### CICLOS FOR

La inicialización de código se ejecuta antes de que el ciclo empiece, la condición se evalua al principio de cada ciclo, si la condición no es conocida el ciclo existe. Los ciclos son especialmente utiles para accesar a grandes cantidades de información similar almacenada en memoria. 

#### Memoria

Para facilitar el almacenamiento y acceso, los datos parecidos pueden ser agrupados en un arreglo, un arreglo contiene direcciones secuenciales de datos en memoria. cada elemento del arreglo es identificado por un número llamado índice. El número de elementos en el arreglo se le llama longitud. 

#### Bytes y Caracteres

Los números en el rango [-128, 127] puede ser almacenado en un solo byte. ARM provee un byte de carga (LDRB), byte de carga con signo (LDRSB), y un byte de almacenamiento (STRB) para acceder a bytes individuales en memoria. Una serie de caracteres de denomina _string_, los cuales tienen una longitufd variable, asi que los lenguajes de programación pueden proveer una forma de determinar la longitud o fianl de la cadena. En C, un caracter nulo (0x00) significa el final de un string. 

#### LLamada de Funciones

Los lenguajes de alto nivel soportan _funciones_ también llamadas Procedimientos o subrutinas para reusar el código común y hacer el programa más modular y legible. Las funciones tienen entradas llamadas _argumentos_ y salidas llamadas _valor de retorno_, las funciones pueden calcular el valor de retorno sin causar otros efectos secundarios no deseados. Cuando una función llama a otra, la función que llama y la llamadora deben coincidir de en donde poner los argumentos y el valor de retorno. En ARM la llamador normalmente pone cuatro argumentos en los registros R0-R3 antes de hacer la llamada de la función y la llamada situa el valor de retorno en el registro R antes de finalizar.

#### Llamada de Funciones y Retornos
ARM utiliza la instruccion _Branch and Link (BL)_ para llamar a una función y mover el registro de enlace a el PC para regresar de la función. _Bl_ y _MOV PC, LR_ son las dos instrucciones escenciales que necesitamos para llamar y retornar una función.
 BL lleva a cabo dos tareas: almacena la dirección de retorno de la siguiente instrucción en el registro de enlace y lo bifurca a la instrucción objetivo. 
 
 #### La Pila
La pila es memoria usada para guardar información sin una función, esta se expande (usa más memoria) cuando el procesador necesita más espacio vacío y se contrae (utiliza menos memoria) cuando el procesador ya no necesita las variables almacenadas ahí. 
Una función guarda los registros de la pila antes de modificarlos, luego los restaura de la pila antes de regresarlos. 

1. Crea un espacio en la pila para almacenar los valores de uno o más registros.
2. Almacena los valores de los registros en la pila.
3. Ejecuta la función usando los registros.
4. Restaura los valores originales de los registros de la pila.
5. Desasigna espacio de la pila. 
 
**Función guardando registros en la pila**
 ```
 ;R4 = result
DIFFOFSUMS
SUB SP, SP, #12 ; make space on stack for 3 registers
STR R9, [SP, #8] ; save R9 on stack
STR R8, [SP, #4] ; save R8 on stack
STR R4, [SP] ; save R4 on stack
ADD R8, R0, R1 ; R8 = f + g
ADD R9, R2, R3 ; R9 = h + i
SUB R4, R8, R9 ; result = (f + g) − (h + i)
MOV R0, R4 ; put return value in R0
LDR R4, [SP] ; restore R4 from stack
LDR R8, [SP, #4] ; restore R8 from stack
LDR R9, [SP, #8] ; restore R9 from stack
ADD SP, SP, #12 ; deallocate stack space
MOV PC, LR ; return to caller
```

#### Cargando y Almacenando Múltiples Registros.

Guardar y restaurar registros en una pila es una operación muy común que ARM provee a través de instrucciones _LDM y STM_ que son optimizadas para tal propósito. La pila contiene exactamente la misma información pero el código es más corto. 

 ```
 ; R4 = result
DIFFOFSUMS
STMFD SP!, {R4, R8, R9} ; push R4/8/9 on full descending stack
ADD R8, R0, R1 ; R8 = f + g
ADD R9, R2, R3 ; R9 = h + i
SUB R4, R8, R9 ; result = (f + g) − (h + i)
MOV R0, R4 ; put return value in R0
LDMFD SP!, {R4, R8, R9} ; pop R4/8/9 off full descending stack
MOV PC, LR ; return to caller
 ```
 
#### Registros Preservados

Los registros preservados incluyen R4-R11 y los no preservados son R0-R3 y R12, R13 y R14 tambien pueden ser preservados. Una función puede guardar y restaurar cualquiera de los registros preservados que desee usar pero puede ser cambiado a los registros no preservados libremente. 

#### Llamada de Funciones Sin Hojas

Una función que no llamaa otra es llamada funcion hoja, una función que llama a otra es llamada función sin hoja.
Las anteriormente mencionadas son algo más complicadas porque necesitan guardar registros no preservados en la pila antes de llamar a otra función y después restaurar esos registros.
**Una función sin hoja sobreescribe LR cuando se llama a otra funcion usando BL, por lo tanto siempre deberá guardar a LR en la pila para restaurarlo antes de retornar**.

 ```
 Lenguaje de Alto Nivel
 
int f1(int a, int b) {
int i, x;
x = (a + b)*(a − b);
for (i=0; i<a; i++)
x = x + f2(b+i);
return x;
}
int f2(int p) {
int r;
r = p + 5;
return r + p;
}

Lenguaje Ensamblador ARM

; R0 = a, R1 = b, R4 = i, R5 = x
F1
PUSH {R4, R5, LR} ; save preserved registers used by f1
ADD R5, R0, R1 ; x = (a + b)
SUB R12, R0, R1 ; temp = (a − b)
MUL R5, R5, R12 ; x = x * temp = (a + b) * (a − b)
MOV R4, #0 ; i = 0
FOR
CMP R4, R0 ; i < a?
BGE RETURN ; no: exit loop
PUSH {R0, R1} ; save nonpreserved registers
ADD R0, R1, R4 ; argument is b + i
BL F2 ; call f2(b+i)
ADD R5, R5, R0 ; x = x + f2(b+i)
POP {R0, R1} ; restore nonpreserved registers
ADD R4, R4, #1 ; i++
B FOR ; continue for loop
RETURN
MOV R0, R5 ; return value is x
POP {R4, R5, LR} ; restore preserved registers
MOV PC, LR ; return from f1
; R0 = p, R4 = r
F2
PUSH {R4} ; save preserved registers used by f2
ADD R4, R0, 5 ; r = p + 5
ADD R0, R4, R0 ; return value is r + p
POP {R4} ; restore preserved registers
MOV PC, LR ; return from f2
 ```
#### Llamada de Funciones Recursivas
Una función recursiva en una función sin hoja que se llama a si misma. Estas se comportan como llamadora y llamada; también deben guardar nos registros preservados y no preservados, por ejemplo una función factorial.

#### Argumentos Adicionales y Variables Locales
Las funciones deben tener por lo menos cuatro argumentos de entrada y muchas variables locales para mantener preservados los registros, la pila es utilizada para almacenar esta información. Si una función tiene más de cuatro argumentos, los primeros cuatro son pasados en los registros de argumentos como usualmente, los argumentos adicionales son pasados a la pila, justo arriba de SP. 

Una función también puede declarar variables locales y arreglos. Las variables locales se declaran dentro de una función y solo se puede acceder a ellas dentro de esa función. Las variables locales se almacenan en R4 – R11; si hay demasiadas variables locales, también se pueden almacenar en el marco de pila de la función. En particular los arreglos son almacenados en la pila. 

### Lenguaje Máquina

El lenguaje ensamblador es conveniente de leer para los humanos, sin embargo los circuitos digitales solo entienden 0's y 1's. Por lo tanto un programa escrito en lenguaje ensamblador es trasladado de nemotécnicos a una representación de 0 y 1 llamado lenguaje máquina.

#### Principio de Diseño 4: El buen diseño demanda buen compromiso. 

ARM hace el compromiso de definir 3 formatos de instrucciones principales: Procesamiento de Datos, Memoria y Bifuración. Este pequeño número de procesos permite regularidad entre instrucciones de esta manera el decodificador de hardware se adapta mejor a las necesidades de cada instrucción.

#### Instrucciones de Procesamiento de Datos

El formato de instrucciones de procesamiento de datos es el más común, la primer fuente de operando es el registro, la segunda puede ser un inmediato o un registro cambiado opcionalmente. El tercer registro es el destino.
_Rd es la abreviatura para "Registro de Destino" y Rn, Rm indican las fuentes del primer y segundo registro_.

#### Instrucciones de Memoria

Utilizan un formato similar a las instrucciones de procesamiento de datos con los mismos seis campos generales: cond, op, funct, Rn, Rd y Src2. Sin embargo, las instrucciones de memoria usan una codificación de campo de función diferente, tienen dos variaciones de Src2 y usan una op de 012. Rn es el registro base, Src2 contiene el desplazamiento y Rd es el registro de destino en una carga o el registro de origen en una carga. El desplazamiento es un inmediato sin signo de 12 bits (imm12) o un registro (Rm) que opcionalmente se desplaza mediante una constante (shamt5). La función se compone de seis bits de control: I, P, U, B, W y L. Los bits I (inmediato) y U (sumar) determinan si el desplazamiento es inmediato o de registro y si se debe sumar o restar.

#### Instrucciones Branch 

Las instrucciones Branch utilizan un operando inmediato de 24-bits con signo (imm24). Comienzan con una condición de 4-bits y un op de 2 bits lo que es 10_2. El campo de función tiene solo 2 bits. El bit superior de funct es siempre 1 para el branch. El bit inferior, L, indica el tipo de operación de bifurcación: 1 para BL y 0 para B. El campo imm24 de complemento a dos de 24 bits restante se utiliza para especificar una dirección de instrucción relativa a PC + 8.

#### Modos de Direccionamiento 

ARM usa cuatro modos principales: registros, inmediatos, base y direccionamiento relativo de PC. Muchas de las otras arquitecturas proveen modos de direccionamiento similares, así que entender estos modos de direccionamiento nos apoyaran a ensamblar otros lenguajes.
El direccionamiento de base y registros tiene multiples submodos, los primeros 3 (registro, inmediatos y base) definen los modos de escritura del contador del programa (PC). 

Las instrucciones de procesamiento de datos usan direccionamiento inmediato o de registro, en la cual la primer fuente del operando es el registro y la segunda puede ser opcionalmente intercambiada por una cantidad especificada en un inmediato o un tercer registro. Las instrucciones de memoria usan direccionamiento base en el cual la direccion de la base viene del registro y el desplazamiento de un inmediato. Las instrucciones Branch usan una dirección de instrucción relativa al PC, en el que la dirección de destino de la rama se calcula agregando un desplazamiento a PC + 8.

#### Interpretación de Código de Lenguaje Máquina

Para interpretar el lenguaje máquina, debemos decifrar los campos de cada instrucción de 32-bits. Diferentes instrucciones utilizan diferentes formatos, sin embargo todos los formatos empiezan con un campo condicional de 4 bits.

![image](https://user-images.githubusercontent.com/79436710/120058541-72978e00-c000-11eb-9ee0-196b587879ef.png)

#### El Poder del Programa Almacenado

Un programa escrito en lenguaje máquina es una serie de números de 32-bits representando las instrucciones. Como en otros números binarios estas instrucciones pueden ser almacenadas en memoria. A esto le llamamos concepto de programa almacenado y es la razón por la cuál las computadoras son tan poderosas. Correr diferentes programas no requiere una gran cantidad de tiempo y esfuerzo para reconfigurar o recablear el hardware, solo requiere escribir el nuevo programa en memoria. Los programas almacenados ofrecen computación de propósito general, de esta manera, la computadora pede ejecutar aplicaciones desde una calculadora, a un procesador de textos, hasta un reproductor de video simplemente cambiando el programa almacenado. Las instrucciones de este tipo de programas son recuperadas de la memoria y ejecutadas por el procesador. 

### Compilar, Ensamblar y Cargar.

Para convertir un lenguaje de alto nivel a lenguaje máquina debemos seguir los siguientes pasos.

1. El compilador traduce el código de alto nivel en código ensamblador.
2. El ensamblador traduce el código ensambaldor a código máquina y lo coloca en un archivo objeto.
3. El enlazador combina el código máquina con el código de las librerías y otros archivos y determina la dirección adecuada y las variables locales para producir enteramente un programa ejecutable. 
4. Finalmente el cargador carga el programa en la memoria e inicia su ejecución.

#### El Mapa de Memoria. 

1. Segmento de texto: Alamecena el programa en Lenguaje Máquina.
2. Segmento de Datos Globales: Almacena variables locales, pueden ser accesado por todas las funciones del programa; se alojan en la memoria antes de que se ejecute el programa. En ARM también se conoce como segmento de lectura y escritura.
3. Segmento de Datos Dinámicos: Almacena la pila, se aloja y desaloja dinamicamente conforme se ejecuta el programa.
4. Controlador de Excepciones, Sistema Operativo y Segmento de Entradas y Salidas: La parte más baja del mapa de memoria ARM está reservado para las excepciones, la parte mas alta para el sistema operativo y mapa de memoria de E/S.

#### Compilación

 ```
 Ejemplo de Compilación
 
 Código de Alto Nivel 
 
int f, g, y; // global variables
int sum(int a, int b) {
return (a + b);
}
int main(void)
{
f = 2;
g = 3;
y = sum(f, g);
return y;
}

Código de Lenguaje Ensamblador ARM

.text
.global sum
.type sum, %function
sum:
add r0, r0, r1
bx lr
.global main
.type main, %function
main:
push {r3, lr}
mov r0, #2
ldr r3, .L3
str r0, [r3, #0]
mov r1, #3
ldr r3, .L3+4
str r1, [r3, #0]
bl sum
ldr r3, .L3+8
str r0, [r3, #0]
pop {r3, pc}
.L3:
.word f
.word g
.word y
  ```
  
#### Ensamblado
  
Un ensamblador convierte el lenguaje ensamblador en un archivo objeto que contiene el código en lenguaje máquina. Realiza dos pasos para ensamblar el código; primero asigna direcciones de instrucción y encuentra todos los símbolos, como etiquetas y nombres de variables globales. Los nombres y direcciones se los símbolos se mantienen en la tabla de símbolos. En el segundo paso el ensablador produce el código en lenguaje máquina, las direcciones para las etiquetas son tomadas de la tabla de símbolos. El código en lenguaje máquina y la tabla de símbolos es almacenada en el archivo objeto. 

Podemos desensamblar el archivo objeto utilizando el comando _objdump_ para ver el código en lenguaje ensamblador junto a el código en lenguaje máquina. A su vez, podemos ver la tabla de símbolos añadiendo la etiqueta _-t_ al comando anteriormente utilizado. 

#### Enlazado

Los programas más grandes contienen más de un archivo. El trabajo del enlazados es combinar todos los archivos objeto y el código de inicio en un archivo de lenguaje máquina llamado ejecutable y asignar direcciones a las variables globales. El enlazador redirecciona los datos e instrucciones en archivos objeto para que no esten todos encima de los otros. Utiliza la informaciónde la tabla de símbolos para ajustar el código basado en una nueva etiqueta y las direcciones de las variables globales. 

#### Carga

El sistema operativo carga el programa leyendo el segmento de texto del archivo executable almacenado en el dispositivo (usalmente el disco duro) en el segmento de texto de la memoria. 

### Evolución de la Arquitectura ARM

El conjunto de instrucciones ARM ha visto muchas mejoras, el exitoso procesador ARM7TDMI en 1995 introdujo el conjunto de instrucciones Thumb de 16 bits en ARMv4T para mejorar la densidad del código. ARMv5TE agregó procesamiento de señal digital (DSP) e instrucciones opcionales de punto flotante. ARMv6 agregó instrucciones multimedia y mejoró el conjunto de instrucciones Thumb. ARMv7 mejoró las instrucciones de punto flotante y multimedia, renombrándolas Advanced SIMD. ARMv8 introdujo una arquitectura de 64 bits completamente nueva. Varias otras instrucciones de programación del sistema de han ido introduciendo conforme la arquitectura a evolucionado. 

#### Set de Instrucciones THUMB.

Las instrucciones Thumb tienen un tamaño de 16-bits de largo que permiten almacenar código de mayor densidad, son idénticas a las instrucciones ARM regulares pero generalmente tienen limitaciones como: 

* Solo se puede accesar a los ocho registros del fono
* Reusa registros como fuente y destino
* Soporta inmediatos cortos
* Falta de ejecución condicional
* Siempre escribe banderas de estado

Casi todas las instrucciones ARM tienen su equivalente en Thumb, ya que las instrucciones son menos poderosas es más requerido escribirlo en un programa equivalente. El conjunto de instrucciones Thumb es valioso no solo para reducir el tamaño y el costo de la memoria de almacenamiento de código, sino también para permitir un bus de 16 bits económico a la memoria de instrucciones y reducir la energía consumida al obtener instrucciones de memoria.

#### Instrucciones DSP

Los procesadores de señales digitales (DSP) son diseñados para manejar eficientemente señales de procesamiento de algoritmos como la Transformada de Fourier. Sus aplicaciones más comunes incluyen codificación y decodificación de video, control de motor y reconocimiento de voz. ARM provee un número de instrucciones DSP para este propósito.

#### Instrucciones de Punto Flotante

Estas instrucciones son mayormente usadas en gráficos, aplicaciones científicas y control de algoritmos. La aritmética de punto flotante puede ser utilizada en series ordinarias de instrucciones de procesamiento de datos pero es más rápido y consume menos energía usar instrucciones de punto flotante dedicadas y hardware.

#### Instrucciones de Ahorro de Energía y Seguridad

Con ARMv6K se introdujeron una serie de instrucciones que permiten ahorrar energía, la espera para interrumpir las instrucciones permite al procesador entrar en un estado de menor poder hasta que la interupción ocurra. La instrucción de espera de evento es similar pero es más efectiva em sistemas multiprocesamiento.

ARMv7 Con extensiones de seguridad, el procesador define un estado seguro con limitaciones medios de entrada y acceso restringido a partes seguras de la memoria, incluso si un atacante compromete el sistema operativo, el kernel seguro puede resistir la manipulación.

#### Instrucciones SIMD

Es una instrucción única con múltiples iezas de información en paralelo, permite realizar varias operaciones aritméticas pequeñas a la vez, especialmente para procesamiento de gráficos. Las instrucciones SIMD más avanzadas permiten realizar funciones aritméticas básicas con punto flotante, cargar y almacenar múltiples elementos, operaciones lógicas bit a bit, comparaciones, etc.

#### Arquitectura de 64-bits
 En ARMv8 los registros se extendieron a 64-bits, asi que PC y SP no pertenecen más a los registros de propósito general. Las instrucciones de procesamiento de datos pueden operan en valores de 32 o 64 bits, sin embargo la carga y almacenamiento siempre usan direcciones de 64 bits. El campo condicional fue removido de casi todas las instrucciones pero branch aún puede ser condicional; se dobló eñ numero de registros avanzados SIMD y se añadieron instrucciones para criptografía.
 
 
