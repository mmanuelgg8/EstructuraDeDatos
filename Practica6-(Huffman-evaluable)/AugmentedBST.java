package dataStructures.searchTree;

import java.util.Iterator;
import java.util.NoSuchElementException;

import dataStructures.stack.LinkedStack;
import dataStructures.stack.Stack;

/**
 * @author Data Structures, Grado en Informática. UMA.
 * @author Pepe Gallardo, Pablo López, Paco Durán
 *
 *         Search tree implemented using an unbalanced binary search tree
 *         augmented with weight on nodes. Note that elements should define an
 *         order relation ( {@link java.lang.Comparable}).
 *
 * @param <K> Type of keys.
 */
public class AugmentedBST<K extends Comparable<? super K>, V> extends BST<K, V> {

	// class for implementing one node in search tree
	protected static class AugmentedTree<K, V> extends Tree<K, V> {
		int weight; // weight of node: number of elements in tree rooted at this node

		public AugmentedTree(K k, V v) {
			super(k, v);
			weight = 1;
		}
		
		public String toString() {
			return "Node<" + (left == null ? "null" : left) + "," + key + "," + value + "," + weight + ","
					+ (right == null ? "null" : right) + ">";
		}
	}

	private static int weight(Tree<?, ?> node) {
		if (node == null)
			return 0;
		else if (node instanceof AugmentedTree<?, ?>)
			return ((AugmentedTree<?, ?>) node).weight;
		else
			return 1 + weight(node.left) + weight(node.right);
	}

	/**
	 * <p>
	 * Time complexity: O(1)
	 */
	public int size() {
		return weight(root);
	}

	/**
	 * node factory
	 * 
	 * @param key
	 * @param value
	 * @return new node
	 */
	protected AugmentedTree<K, V> make(K key, V value) {
		return new AugmentedTree<>(key, value);
	}

	// returns modified tree
	protected Tree<K, V> insertRec(Tree<K, V> node, K key, V value) {
		node = super.insertRec(node, key, value);
		((AugmentedTree<K,V>)node).weight = 1 + weight(node.left) + weight(node.right);
		return node;
	}

	/**
	 * /** precondition: node and temp are non-empty trees
	 * 
	 * Removes node with minimum key from tree rooted at node. Before deletion, key
	 * is saved into temp node. returns modified tree (without min key)
	 */
	protected Tree<K, V> split(Tree<K, V> node, Tree<K, V> temp) {
		node =  super.split(node, temp);
		// recompute weight for this node
		((AugmentedTree<K,V>)node).weight = 1 + weight(node.left) + weight(node.right);
		return node;
	}

	// returns modified tree
	protected Tree<K, V> deleteRec(Tree<K, V> node, K key) {
		node = super.deleteRec(node, key);
		// recompute weight for this node after deletion
		((AugmentedTree<K,V>)node).weight = 1 + weight(node.left) + weight(node.right);
		return node;
	}

	// You should provide EFFICIENT implementations for the following methods

	// Returns i-th key in BST (i=0 means returning the smallest value
	// in tree, i=1 the next one and so on). If i is out of range it returns null.
	public K select(int i) {
		K sol = null;
		if (i >= 0 && i < weight(root)) {
			sol = selectRec(root, i);
		}
		return sol;
	}

	private K selectRec(Tree<K, V> t, int i) {
		K sol = null;
		if (t != null) {
			int wl = weight(t.left);
			if (i == wl) {
				sol = t.key;
			} else if (i < wl) {
				sol = selectRec(t.left, i);
			} else {  // i > wl
				sol = selectRec(t.right, i - (wl + 1));
			}
		}
		return sol;
	}

	// Returns largest key in BST whose value is less than or equal to k,
	// or null if there is no such element in the tree. If your tree contains
	// elements 2, 4 and 6, then floor(5) should return 4.
	public K floor(K k) {
		return floorRec(root, k);
	}

	private K floorRec(Tree<K, V> t, K k) {
		K sol = null;
		if (t != null) {
			if (k.compareTo(t.key) == 0) {
				sol = t.key;
			} else if (k.compareTo(t.key) < 0) {
				sol = floorRec(t.left, k);
			} else { // k > t.key
				sol = floorRec(t.right, k);
				if (sol == null) {
					sol = t.key;
				}
			}
		}
		return sol;
	}

	// Returns smallest key in BST whose value is greater than or equal to k,
	// or null if there is no such element in the tree. If your tree contains
	// elements 2, 4 and 6, then ceiling(5) should return 6.
	public K ceiling(K k) {
		return ceilingRec(root, k);
	}

	private K ceilingRec(Tree<K, V> t, K k) {
		K sol = null;
		if (t != null) {
			if (k.compareTo(t.key) == 0) {
				sol = t.key;
			} else if (k.compareTo(t.key) < 0) {
				sol = ceilingRec(t.left, k);
				if (sol == null) {
					sol = t.key;
				} 
			} else {
				sol = ceilingRec(t.right, k);
			}
		}
		return sol;
	}

	// returns number of keys in BST whose values are less than k.
	public int rank(K k) {
		return rankRec(root, k);
	}

	private int rankRec(Tree<K, V> t, K k) {
		int sol = 0;
		if (t != null) {
			int wl = weight(t.left);
			if (k.compareTo(t.key) == 0) {
				sol = wl;
			} else if (k.compareTo(t.key) < 0) {
				sol = rankRec(t.left, k);
			} else { // k > t.key
				sol = 1 + wl + rankRec(t.right, k);
			}
		}
		return sol;
	}

	// returns the number of keys in BST whose values are in the range [low, high]
	public int size(K low, K high) {
		return sizeRec(root, low, high);
	}

	private int sizeRec(Tree<K, V> t, K low, K high) {
		int sol = 0;
		if (t != null) {
			if (high.compareTo(t.key) < 0) {
				sol = sizeRec(t.left, low, high);
			} else if (low.compareTo(t.key) > 0) {
				sol = sizeRec(t.right, low, high);
			} else { // t.key in [low, high]
				sol = 1 + sizeRec(t.left, low, t.key) + sizeRec(t.right, t.key, high);
			}
		}
		return sol;
	}

	// returns the minimum key stored in BST, null if tree is empty
	public K min() {
		return (root == null) ? null : minRec(root);
	}

	private K minRec(Tree<K, V> t) {
		while (t.left != null)
			t = t.left;
		return t.key;
	}

	// returning maximum key stored in BST,
	public K max() {
		return (root == null) ? null : maxIter(root);
	}

	private K maxIter(Tree<K, V> t) {
		while (t.right != null)
			t = t.right;
		return t.key;
	}

	public Iterable<K> simpleIterator() {
		return new Iterable<K>() {
			public Iterator<K> iterator() {
				return new IteradorABST();
			}
		};
	}

	private class IteradorABST implements Iterator<K> {
		Stack<Tree<K,V>> stack = new LinkedStack<>();

		IteradorABST(){
			stack.push(root);
		}
		
		@Override
		public boolean hasNext() {
			return !stack.isEmpty();
		}

		@Override
		public K next() {
			if (!hasNext()) {
				throw new NoSuchElementException();
			}
			Tree<K,V> tree = stack.top();
			stack.pop();
			
			while (tree.left != null || tree.right != null ) {
				if (tree.right != null) {
					stack.push(tree.right);
				}
				stack.push(new AugmentedTree<>(tree.key, tree.value));
				if (tree.left != null) {
					stack.push(tree.left);
				}
				tree = stack.top();
				stack.pop();
			}
			return tree.key;
		}
	}
}