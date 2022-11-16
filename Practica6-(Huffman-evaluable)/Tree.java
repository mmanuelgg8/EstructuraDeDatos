import java.util.Iterator;
import java.util.NoSuchElementException;

import dataStructures.queue.LinkedQueue;
import dataStructures.queue.Queue;

public class Tree<T extends Comparable<? super T>> implements Iterable<T> {
	private T elem;
	private Tree<T> left;
	private Tree<T> right;

	public Tree(T e, Tree<T> l, Tree<T> r) {
		elem = e;
		left = l;
		right = r;
	}

	public Iterator<T> iterator() {
		return new LevelsIterator(this);
	}

	public class LevelsIterator implements Iterator<T> {
		// COMPLETAR

		public LevelsIterator(Tree<T> t) {
			// COMPLETAR
		}

		public boolean hasNext() {
			// COMPLETAR
			return false;
		}

		public T next() {
			// COMPLETAR
			return null;
		}
	}
	
	public static void main(String [] args) {
		Tree<Integer> t1 = new Tree<>(6, null, null);
		Tree<Integer> t2 = new Tree<>(3, null, null);
		Tree<Integer> t3 = new Tree<>(5, null, null);
		Tree<Integer> t4 = new Tree<>(9, null, null);
		Tree<Integer> t5 = new Tree<>(4, null, null);
		Tree<Integer> t6 = new Tree<>(8, null, null);
		Tree<Integer> t7 = new Tree<>(1, null, null);
		
		Tree<Integer> ta = new Tree<>(11, t1, t2);
		Tree<Integer> tb = new Tree<>(12, t3, t4);
		Tree<Integer> tc = new Tree<>(13, t5, t6);
		Tree<Integer> td = new Tree<>(15, t7, null);
		
		Tree<Integer> ts1 = new Tree<>(40, ta, tb);
		Tree<Integer> ts2 = new Tree<>(67, tc, td);
		
		Tree<Integer> tree = new Tree<>(90, ts1, ts2);
		
		for (int i: tree) {
			System.out.print(i + " ");
		}
	}

}
/*
 * Resultado: 90 40 67 11 12 13 15 6 3 5 9 4 8 1
 */

