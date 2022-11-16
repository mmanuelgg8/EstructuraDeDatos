<pre><div class="text_to_html">/********************************************************************
 * Estructuras de Datos. 2&ordm; Curso. ETSI Inform&aacute;tica. UMA
 * PRACTICA 4&ordf;. Ejercicio 12.b de la tercera relaci&oacute;n
 *              Implementar el TAD Bolsa en java
 *
 * (completa y sustituye los siguientes datos)
 * Titulaci&oacute;n: Grado en Ingenier&iacute;a [Inform&aacute;tica | del Software | de Computadores].
 * Alumno: APELLIDOS, NOMBRE
 * Fecha de entrega:  DIA | MES | A&Ntilde;O
 ********************************************************************
 */

package dataStructures.bag;

public class SortedLinkedBag&lt;T extends Comparable&lt;? super T&gt;&gt; implements Bag&lt;T&gt; {

	static private class Node&lt;E&gt; {
		E elem;
		int count;
		Node&lt;E&gt; next;

		Node(E x, int n, Node&lt;E&gt; node) {
			elem = x;
			count = n;
			next = node;
		}
	}

	private Node&lt;T&gt; first; // Mantener esta lista enlazada ordenada por &quot;elem&quot;

	public SortedLinkedBag() {
		first = null;
	}

	/**
	 * Devuelve si el bag esta vacio
	 */
	public boolean isEmpty() {

		// COMPLETAR

		return true;
	}

	/**
	 * Inserta un elemento en el bag
	 * Si ya esta, incrementa su contador
	 * en otro caso, lo incluye con contador 1
	 */
	public void insert(T item) {
		Node&lt;T&gt; previous = null;
		Node&lt;T&gt; current = first;

		while (current != null &amp;&amp; current.elem.compareTo(item) &lt; 0) {
			previous = current;
			current = current.next;
		}

		if (current != null &amp;&amp; current.elem.equals(item)) {

			// COMPLETAR

		} else if (previous == null) {
			first = new Node&lt;T&gt;(item, 1, first);
		} else {

			// COMPLETAR

		}
	}

	/**
	 * Devuelve las ocurrencias de &quot;item&quot;.
	 * Devuelve 0 si no esta
	 */
	public int occurrences(T item) {
		Node&lt;T&gt; current = first;
		int result = 0;

		while (current != null &amp;&amp; current.elem.compareTo(item) &lt; 0) {
			current = current.next;
		}

		if (current != null &amp;&amp; current.elem.equals(item)) {

			// COMPLETAR

		}
		return result;
	}

	/**
	 * Elimina &quot;item&quot; del bag.
	 * Si aparece mas de una vez se decrementa el contador
	 * Si solo apercce una vez se elimina
	 * Si no esa, no se hace nada
	 */
	public void delete(T item) {
		Node&lt;T&gt; previous = null;
		Node&lt;T&gt; current = first;

			// COMPLETAR

	}

	/**
	 * Deuelve una representaci&oacute;n textual del bag
	 */
	public String toString() {
		String text = &quot;SortedLinkedBag(&quot;;
		for (Node&lt;T&gt; p = first; p != null; p = p.next) {
			text += &quot;(&quot; + p.elem + &quot;, &quot; + p.count + &quot;) &quot;;
		}
		return text + &quot;)&quot;;
	}
}
</div></pre>