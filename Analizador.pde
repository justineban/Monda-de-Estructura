/*
|====================================================================|
*                      |Analizador|
* Descripción:                                                        
*   Clase encargada de leer el HTML suministrado y encontrar las etiquetas
|====================================================================|
*/
public class Analizador {
    Web buscar;
    
    public Analizador () {
        this.buscar = new Web ();
    }
    
    //-------------------------|Analizar HTML|-------------------------//
    public ArrayList<String> analizarHTML (String text) {
      ArrayList <String> etiquetas = new ArrayList <String>();
      
      //Buscar etiquetas
      for (int i = 0; i < text.length() - 2; i ++) {
        String etiqueta = "";
         
        if (text.substring(i, i+1).equals("<")) {
          etiqueta = obtenerEtiqueta (text, i);
          if (!etiqueta.equals(""))
            etiquetas.add(etiqueta);
        }
      }
      
      return etiquetas;
    }
    
    
    //-------------------------|Analizar Página|-------------------------//
    public String obtenerHTML (String url) {
      return buscar.obtener_html(url);
    }
    
    
    //-------------------------|Obtener SubCadena|-------------------------//
    public String obtenerEtiqueta (String text, int pos) {
      int j = pos;
      
      //Buscar el fin de la etiqueta
      while (j < text.length()) {
        if (text.substring (j, j + 1).equals(" ")
         || text.substring (j, j + 1).equals(">"))
          return text.substring (pos + 1, j);
        
        j++;
      }
      
      return "";
    }
}
