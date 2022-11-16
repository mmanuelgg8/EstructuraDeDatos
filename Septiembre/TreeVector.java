/******************************************************************************
 * Student's name: Manuel González González
 * Student's group: A
 * Data Structures. Grado en Informática. UMA.
******************************************************************************/

package dataStructures.vector;

import dataStructures.list.ArrayList;
import dataStructures.list.List;

public class TreeVector<T> {

    private final int size;
    private final Tree<T> root;

    private interface Tree<E> {
        E get(int index);

        void set(int index, E x);

        List<E> toList();
    }
    

    private static class Leaf<E> implements Tree<E> {
        private E value;
        
        private Leaf(E x) {
            value = x;
        }

        @Override
        public E get(int index) {
            return value;
        }

        @Override
        public void set(int i, E x) {
        	value = x;
        }

        @Override
        public List<E> toList() {
        	List<E> res = new ArrayList<>();
        	res.append(value);
            return res;
        }
    }

    private static class Node<E> implements Tree<E> {
        private Tree<E> left;
        private Tree<E> right;

        private Node(Tree<E> l, Tree<E> r) {
            left = l;
            right = r;
        }

        @Override
        public E get(int index) {
        	if(index%2 == 0) return left.get(Math.floorDiv(index, 2));
        	else return right.get(Math.floorDiv(index, 2));
        	
        }

        @Override
        public void set(int index, E x) {
        	if(index%2==0) left.set(Math.floorDiv(index, 2), x);
        	else right.set(Math.floorDiv(index, 2), x);
        	
        }

        @Override
        public List<E> toList() {
        	List<E> l = new ArrayList<>();
        	List<E> r = new ArrayList<>();
   
        	l = left.toList();
        	r = right.toList();
        	for(int i=0; i<r.size();i++) {
        		l.append(r.get(i));
        	}
            return l;
        }
    }

    public TreeVector(int n, T value) {
    	if(n<0) throw new VectorException("Valor de tamano negativo");
    	size = (int) Math.pow(n, 2);
    	root = new Leaf<T>(value);
    	
    }

    public int size() {
        return size;
    }

    public T get(int i) {
    	if(i<0 || i>=size) throw new VectorException("Out of bound");
        return root.get(i);
    }

    public void set(int i, T x) {
    	if(i<0 || i>=size) throw new VectorException("Out of bound");
    	root.set(i, x);
    }

    public List<T> toList() {
    	
        return root.toList();
    }

    protected static <E> List<E> intercalate(List<E> xs, List<E> ys) {
    	//to do
        return null;
    }

    
    // Only for students not taking continuous assessment

    static protected boolean isPowerOfTwo(int n) {
    	//to do
        return false;
    }

    public static <E> TreeVector<E> fromList(List<E> l) {
    	//to do
        return null;
    }
}
