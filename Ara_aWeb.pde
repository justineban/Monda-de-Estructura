//Importaciones
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;

//Variables Gráficas
Motor_Grafico motor = new Motor_Grafico (5000, 5000);
Arbol arbol;

//Variables Funcionales
Analizador analizador = new Analizador ();
Generador_Arbol generador = new Generador_Arbol ();
Graficador graficador;
String url = "";
String html = "";
int cont = 0;
boolean inicializar = true;

void setup () {
  fullScreen();
  motor.inicializar();
}


void draw () {
  if (inicializar) {
  url = "https://es.wikipedia.org/wiki/Wikipedia:Portada";
  String html = analizador.obtenerHTML (url);  
  ArrayList <String> etiquetas = analizador.analizarHTML(html);
  println("Terminado de Analizar");
  
  for (int i = 0; i < etiquetas.size(); i++) {
    println(etiquetas.get(i));
  }
  println("tamano de la lista: " + etiquetas.size());
  
  println("------------------------//------------------------");
  
  //Generar Árbol
  generador.asignarLista (etiquetas);
  arbol = new Arbol ("html", 1);
  generador.generarArbol (arbol.obtenerRaiz(), 1);
  println("------------------------//------------------------");
  
  //Asignar Posiciones a cada Nodo
  graficador = new Graficador (arbol, 200, 100);
  graficador.asignarPosArbol(arbol.obtenerRaiz(), 0);
  //arbol.mostrar(arbol.obtenerRaiz());
  inicializar = false;
  }
  background(0);
  //motor.mostrar("defect", 0, 0, 1000, 1000);
  
  //Mostrar Árbol
  arbol.mostrar(arbol.obtenerRaiz());
  
}


void keyPressed () {
  motor.mover();
}


void mouseWheel (MouseEvent event) {
  motor.zoom(event.getCount());
}
