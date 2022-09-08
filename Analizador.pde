/*
|====================================================================|
*                      |Analizador|
* Descripción:                                                        
*   Clase encargada de leer el HTML suministrado y encontrar las etiquetas
|====================================================================|
*/
public class Analizador {
    Araña_Web buscador;
    
    public Analizador () {
        this.buscador = new Araña_Web ();
    }
    
    //-------------------------|Analizar HTML|-------------------------//
    public ArrayList<String> analizarHTML (String texto) {
      ArrayList <String> etiquetas = new ArrayList <String>();
      
      //Buscar etiquetas
      for (int i = 0; i < texto.length() - 2; i ++) {
        String etiqueta = "";
         
        if (texto.substring(i, i+1).equals("<")) {
          etiqueta = obtenerEtiqueta (texto, i);
          if (!etiqueta.equals(""))
            etiquetas.add(etiqueta);
        }
      }
      
      return etiquetas;
    }
    
    
    //-------------------------|Analizar Página|-------------------------//
    public String obtenerHTML (String url) {
      return buscador.obtener_html(url);
    }
    
    
    //-------------------------|Obtener SubCadena|-------------------------//
    public String obtenerEtiqueta (String texto, int pos) {
      int j = pos;
      
      //Buscar el fin de la etiqueta
      while (j < texto.length()) {
        if (texto.substring (j, j + 1).equals(" ")
         || texto.substring (j, j + 1).equals(">"))
          return texto.substring (pos + 1, j);
        
        j++;
      }
      
      return "";
    }
}
