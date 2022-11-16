<pre><div class="text_to_html">/********************************************************************
 * Estructuras de Datos. 2&ordm; Curso. ETSI Inform&aacute;tica. UMA
 * PRACTICA 4&ordf;. Ejercicio 12.c de la tercera relaci&oacute;n
 *              Implementar el TAD Bolsa en java
 *
 * (completa y sustituye los siguientes datos)
 * Titulaci&oacute;n: Grado en Ingenier&iacute;a [Inform&aacute;tica | del Software | de Computadores].
 * Alumno: APELLIDOS, NOMBRE
 * Fecha de entrega:  DIA | MES | A&Ntilde;O
 ********************************************************************
 */

package dataStructures.bag;

import java.util.Arrays;

public class SortedArrayBag&lt;T extends Comparable&lt;? super T&gt;&gt; implements Bag&lt;T&gt; {

	private final static int INITIAL_CAPACITY = 5;

	protected T[] value; // Mantener este array ordenado
	protected int[] count; // Mantener este array con valores positivos
	protected int nextFree;

	public SortedArrayBag() {
		this(INITIAL_CAPACITY);
	}

	@SuppressWarnings(&quot;unchecked&quot;)
	public SortedArrayBag(int n) {
		value = (T[]) new Comparable[n]; // Cada elemento es null
		count = new int[n]; // Cada elemento es 0
		nextFree = 0;
	}

	/**
	 * Asegura que cabe un elemento nuevo
	 */
	private void ensureCapacity() {
		if (nextFree == value.length) {
			value = Arrays.copyOf(value, 2 * value.length);

			// COMPLETAR

		}
	}

	/**
	 * Devuelve si el bag esta vacio
	 */
	public boolean isEmpty() {
		return nextFree == 0;
	}

	/**
	 * Localiza la posicion donde esta o deberia estar un elemento. Si &quot;item&quot;
	 * aparece en el array &quot;value&quot;, devuelve su indice en otro caso, devuelve el
	 * indice donde &quot;item&quot; deberia estar
	 * 
	 * @param item
	 *            el elemento a localizar
	 * @return indice donde esta o deberia estar &quot;item&quot;
	 */
	private int locate(T item) {
		int lower = 0;
		int upper = nextFree - 1;
		int mid = 0;
		boolean found = false;

		// Busqueda binaria
		while (lower &lt;= upper &amp;&amp; !found) {
			mid = lower + ((upper - lower) / 2); // == (lower + upper) / 2;
			found = value[mid].equals(item);
			if (!found) {
				if (value[mid].compareTo(item) &gt; 0) {
					upper = mid - 1;
				} else {
					lower = mid + 1;
				}
			}
		}

		if (found)
			return mid; // El indice donde &quot;item&quot; esta almacenado
		else
			return lower; // el indice donde &quot;item&quot; deberia insertarse
	}

	/**
	 * Inserta un elemento en el bag
	 * Si ya esta, incrementa su contador
	 * en otro caso, lo incluye con contador 1
	 */
	public void insert(T item) {
		int i = locate(item);
		if (value[i] != null &amp;&amp; value[i].equals(item)) {

			// COMPLETAR

		} else {
			ensureCapacity();
			// desplaza los elementos a derecha
			for (int j = nextFree; j &gt; i; j--) {
				value[j] = value[j - 1];
				count[j] = count[j - 1];
			}

			// COMPLETAR

		}
	}

	/**
	 * Devuelve las ocurrencias de &quot;item&quot;.
	 * Devuelve 0 si no esta
	 */
	public int occurrences(T item) {
		int result = 0;
		int i = locate(item);
		if (value[i] != null &amp;&amp; value[i].equals(item)) {

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
		int i = locate(item);

		// COMPLETAR

	}

	/**
	 * Deuelve una representaci&oacute;n textual del bag
	 */
	public String toString() {
		String text = &quot;SortedArrayBag(&quot;;
		for (int i = 0; i &lt; nextFree; i++) {
			text += &quot;(&quot; + value[i] + &quot;, &quot; + count[i] + &quot;) &quot;;
		}
		return text + &quot;)&quot;;
	}
}
</div></pre>