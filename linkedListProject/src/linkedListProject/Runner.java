package linkedListProject;

public class Runner {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		LinkedList ll = new LinkedList();
		Node node1 = ll.insert(1);
		Node node2 = ll.insert(2);
		Node node3 = ll.insert(3);
		Node node4 = ll.insert(4);
		Node node5 = ll.insert(9);
		Node node6 = ll.insert(15);
//		Node node4 = ll.insert(9);
//		node4.next = node1;
//		ll.insertAfter(7, 9);
//		ll.deleteNodeAt(5);
//		System.out.println(ll.isCyclic());
		ll.printLinkedList();
		System.out.println("reversing the Linked List");
		ll.reverseLinkedList();
		ll.printLinkedList();
		System.out.println("Program Finished");
	}

}
