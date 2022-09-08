public class Generador_Arbol {
  ArrayList <String> etiquetas;
  
  public Generador_Arbol () {
    this.etiquetas = null;
  }
  
  
  public void asignarLista (ArrayList <String> etiquetas) {
    this.etiquetas = etiquetas;
  }
  
  //-------------------------|Generar Árbol|-------------------------//
  public void generarArbol (Nodo raiz, int pos) {
    if (pos > etiquetas.size() && pos <= 0)  //Fin de la Lista
      return;
      
    if (etiquetas.get(pos).substring(0, 1).equals("/"))  //Fin del Nodo
      return;
    
    if (excepciones(pos))  //Excepciones
      return;

    for (int i = pos + 1; i < finCadena(etiquetas.get(pos), pos); i++) {
      //println("-> Estando en: " + pos);
      //println("Generado hijo de " + raiz.nombre +" : \n\t" + i + "  " + etiquetas.get(i));
      
      //Crear el Nuevo Hijo
      Nodo nuevo = new Nodo (etiquetas.get(i), i);
      raiz.añadirHijo(nuevo);
      generarArbol (nuevo, i);
      
      int pos_temp = finCadena (etiquetas.get(i), i);
      if (pos_temp > 0)
        i = pos_temp;
      //println(etiquetas.get(i) + "  " + i );
    }
  }
  
  public boolean excepciones (int pos) {
    if (etiquetas.get(pos).equals("meta") 
    || etiquetas.get(pos).equals("script")
    || etiquetas.get(pos).equals("title")
    || etiquetas.get(pos).equals("link"))
      return true;
    else
      return false;
  }
  
  public int finCadena (String busqueda, int pos) {
     int pos_temp = pos + 1;
     
     //Recorrer hasta encontrar el cierre
     while (pos_temp < etiquetas.size()) {
       if (etiquetas.get(pos_temp).equals("/" + etiquetas.get(pos)))
         return pos_temp;
       pos_temp += 1;
     }
     
     return 0;
  }

}
