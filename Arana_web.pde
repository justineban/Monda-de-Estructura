/*
|====================================================================|
*                      |Modificador de Imágenes|
* Descripción:                                                        
*  Clase encargada de acceder al código base de la página suministrada 
|====================================================================|
*/

public class Araña_Web {
    InputStream entrada;      //Objeto encargado de solicitar el HTML
    BufferedReader escritor;  //Objeto encargado de guardar el HTML
    URL url;                  //Objeto que aloja el URL
    
    
    //-------------------------|Obtener HTML|-------------------------//
    public String obtener_html (String enlace) {
        String html = "";
        
        try {
            this.url = new URL (enlace);
            this.entrada = url.openStream();
            this.escritor = new BufferedReader (new InputStreamReader(entrada));
            
            String linea;
            while ((linea = escritor.readLine()) != null) {
              //println("->  " + linea);  
              html = html + "\n" + linea;
            }
        } catch (MalformedURLException mue) {
            System.out.println("[Error] : Enlace escrito erróneamente");
        } catch (IOException ioe) {
            System.out.println("[Error] : No se pudo completar la solicitud");
        }
        
        //println(html);
        return html;
    }
}
