package linkedListProject;

import java.util.HashSet;

public class LinkedList {

	Node head;
	
	public Node insert(int data){
		Node node = new Node();
		node.data = data;
		
		if( head == null){
			head = node;
		} else {
			Node n = head;
			while(n.next!= null){
				n =n.next;
			}
			n.next = node;
		}
		return node;
	}
	
	public void insertAfter(int afterData, int data){
		Node newNode = new Node();
		newNode.data = data;

		if(head != null){
			Node startNode = head;
			while(startNode.next != null){
				if(startNode.data == afterData) {
					System.out.println("Found node at %s " + startNode.data);
					newNode.next = startNode.next;
					startNode.next = newNode;
					System.out.println("New Node inserted");
					break;
				}
				startNode = startNode.next;
			}
			if(head.data == afterData){
				insert(data);
			}
		} else {
			System.out.println("Linked List is empty");
		}
	}
	
	public void deleteNodeAt(int data){
		//check if Linked List is empty
		if(head != null){
			if(head.data == data) {
				if (head.next != null) {
					head = head.next;
				} else{
					head = null;
				}
			} else {
				Node currentNode = head;
				while(currentNode.next != null){
					if(currentNode.next.data == data) {
						currentNode.next = currentNode.next.next;
						System.out.println("Node deleted");
					}
					currentNode = currentNode.next;
				}	
			}
		} else {
			System.out.println("Linked List is empty");

		}
	}
	
	public void printLinkedList() {
		Node newNode = new Node();
		if( head != null){
			newNode = head;
			while(newNode.next!=null){
				System.out.print(" " + newNode.data);
				newNode = newNode.next;
			}
			System.out.print(" " + newNode.data);
		} else {
			System.out.println("Linked List is empty");
		}
	}
	
	public String isCyclic() {
		if( head != null) {
			Node currentNode = head;
			HashSet<Node> allNodes = new HashSet<Node>();
			
			while(currentNode.next != null){
				if(allNodes.contains(currentNode)) {
					return "Its a cyclic Linked list";
				}
				allNodes.add(currentNode);
				currentNode = currentNode.next;
			}
			return "Linked List is not Cyclic";
		} else {
			return "Linked List is empty";
		}
	}
	
	public void reverseLinkedList(){
		Node previousNode = null;
		Node currentNode = new Node();
		Node nextNode = new Node();
		
		if(head != null){
			currentNode = head;
			
			while(currentNode.next != null){
				nextNode = currentNode.next;
				currentNode.next = previousNode;
				previousNode = currentNode;
				currentNode = nextNode;
			}
			currentNode.next = previousNode;
			head = currentNode;
		}
	}
	
	
}
