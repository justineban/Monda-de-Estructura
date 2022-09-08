public class Arbol {
  private Nodo raiz;
  private int altura;
  
  
  public Arbol (String nombre, int referencia) {
    this.raiz = new Nodo (nombre, referencia);
  }
  
  
  //-------------------------|Obtener HTML|-------------------------//
  public Nodo obtenerRaiz () {
    return this.raiz;
  }
  
  
  public int obtenerAltura () {
    return alturaRecursivo(this.raiz);
  }
  
  public int alturaRecursivo (Nodo nodo) {
    int mayor = 0, tempo;
    if (nodo == null)
      return 0;
      
    for (int i = 0; i <= nodo.cantidadHijos(); i++) {
      tempo = alturaRecursivo (nodo.obtenerHijo(i));
      
      if (tempo > mayor)
        mayor = tempo;
    }
    
    return mayor + 1;
  }
  
  
  //-------------------------|Asignar Posición|-------------------------//
  public void mostrar (Nodo nodo) {
    nodo.mostrar();
    for (int i = 0; i < nodo.cantidadHijos(); i++) {
      mostrar (nodo.obtenerHijo(i));
    }
  }
}


public class Nodo {
    public String nombre;
    public int referencia;
    private ArrayList <Nodo> hijo;
    private int pos_x, pos_y;
    
    public Nodo (String nombre, int referencia) {
      this.nombre = nombre;
      this.referencia = referencia;
      this.hijo = new ArrayList <Nodo> ();
      this.pos_x = 0;
      this.pos_y = 0;
    }
    
    
    //-------------------------|Añadir Hijo|-------------------------//
    public void añadirHijo (String nombre, int referencia) {
      this.hijo.add(new Nodo (nombre, referencia));
    }
    
    
    //-------------------------|Añadir Hijo|-------------------------//
    public void añadirHijo (Nodo nuevo) {
      this.hijo.add(nuevo);
    }
    
    
    //-------------------------|Obtener Hijo|-------------------------//
    public Nodo obtenerHijo (int pos) {
      if (pos < this.cantidadHijos())
        return this.hijo.get(pos);
      else
        return null;
    }
    
    
    //-------------------------|Obtener Cantidad de Hijos|-------------------------//
    public int cantidadHijos () {
      return this.hijo.size();
    }
    
    
    //-------------------------|Asignar Posición|-------------------------//
    public void asignarPos (int pos_x, int pos_y) {
      this.pos_x = pos_x;
      this.pos_y = pos_y;
    }
    
    
    //-------------------------|Asignar Posición|-------------------------//
    public void mostrar () {
      //Mostrar Nodo
      //println("mostrando en: " + pos_x + "  " + pos_y);
      motor.mostrar("Nodo", pos_x, pos_y, graficador.obtenerTamNodo(), graficador.obtenerTamNodo());
      //Mostrar información
      //Mostrar arista
    }
}
