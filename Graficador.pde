public class Graficador {
  int tam_niv;        //Tamaño de pixeles por nivel
  int[] cant_nodos;   //Cantidad de Nodos por nivel
  int[] nodos_cont;   //Nodos ya posicionados por nivel
  int niveles;        //Altura del Árbol
  int sep;            //Separación horizontal entre nodos
  int tam_nodo;       //Tamaño de los nodos
  
  public Graficador (Arbol arbol, int tam_nodo, int sep) {
    this.sep = sep;
    this.tam_nodo = tam_nodo;
    
    this.niveles = arbol.obtenerAltura();
    this.cant_nodos = new int[this.niveles];
    this.nodos_cont = new int[this.niveles];
    
    escanearArbol (arbol.obtenerRaiz(), 1);
  }
  
  
  public int obtenerTamNodo () {
    return tam_nodo;
  }
  
  
  //-------------------------|Obtener información del Árbol|-------------------------//
  public void escanearArbol (Nodo nodo, int nivel) {
    //Conseguir la cantidad de nodos por nivel
    this.cant_nodos = new int [this.niveles];
    cant_nodos[0] = 1;
    this.alturaNiveles (0, nodo);
    
    
    //Conseguir la mayor cantidad de nodos en un nivel
    int cant_may = 0;
    for (int i = 0; i < this.niveles; i++) {
      if (cant_may < cant_nodos[i])
        cant_may = cant_nodos[i];
    }
    
    //Conseguir el tamaño por pixeles de todos los niveles
    println(cant_may);
    this.tam_niv = (50 * cant_may) + (sep * (cant_may - 1));
    println(tam_niv + "   " + cant_may * (sep + tam_nodo));
    motor.ajustarMV(tam_niv, cant_may * (sep + tam_nodo));
  }
  
  
  //-------------------------|Obtener la Cantidad de Nodos por Nivel|-------------------------//
  public void alturaNiveles (int nivel, Nodo nodo) {
    if (nivel < this.niveles - 1)
      this.cant_nodos[nivel + 1] += nodo.cantidadHijos();
      
    for (int i = 0; i < nodo.cantidadHijos(); i++) {
      alturaNiveles(nivel + 1, nodo.obtenerHijo (i));
    }
  }
  
  
  //-------------------------|Asignar Posiciones a cada Nodo|-------------------------//
  public void asignarPosArbol (Nodo nodo, int nivel) {
    //Conseguir las coordenadas del Nodo
    int y = ((tam_nodo + sep) * nivel);  //Altura por nivel
    //println(tam_niv);
    //println(centrado + "  " + nivel + "  " + cant_nodos[nivel]);
    int x = (tam_nodo + sep) * (nodos_cont[nivel]);  //Posición según cantidad de nodos del nivel
    x = x + (tam_niv - ((tam_nodo * cant_nodos[nivel]) + (sep * (cant_nodos[nivel] - 1)))) / 2;  //Centrar la figura
    
    //Asignar Posición al nodo
    nodo.asignarPos (x, y);
    nodos_cont[nivel] += 1;
    
    //Recorrer el resto del árbol
    for (int i = 0; i < nodo.cantidadHijos(); i++) {
      asignarPosArbol (nodo.obtenerHijo (i), nivel + 1);
    }
  }
}
