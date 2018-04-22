package com.xinu;
import java.io.IOException;
import java.io.OutputStream;
import java.net.*;

public class Receiver {

	private static int portRecv = 7598;
	private static int portSnd = 7599;

	public static void main(String[] args) {

		try {

			//recvMsgFrmXinu();
			//sendMsgToXinu("192.168.0.101", 5954, "0");

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void sendMsgToXinu(String bbbIP, int bbbPort, String dataToSend) throws Exception {
		try {
			DatagramSocket serverSocket = new DatagramSocket(portSnd);

			System.out.printf("Sending msg to Xinu on udp:%s:%d%n",
					InetAddress.getLocalHost().getHostAddress(), portSnd);

			/* send data begin */
			InetAddress IPAddress = InetAddress.getByName(bbbIP);
			System.out.println("IP of Packet to send" + IPAddress + " data ->" + dataToSend);
			byte[] sendData = dataToSend.getBytes("UTF-8");

			DatagramPacket sendPacket = new DatagramPacket(sendData, sendData.length, IPAddress, bbbPort);
			serverSocket.send(sendPacket);
			serverSocket.close();
			
		} catch (IOException e) {
			System.out.println("Error while sending data: " + e);
		}
	}

	public static String recvMsgFrmXinu() {
		try {
			
			//http://www.instructables.com/id/How-to-use-the-TMP36-temp-sensor-Arduino-Tutorial/
			DatagramSocket serverSocket = new DatagramSocket(portRecv);
			byte[] receiveData = new byte[15];

			System.out.println("Waiting for incoming message listening on udp: "
					+ InetAddress.getLocalHost().getHostAddress() + " port: " + portRecv);

			DatagramPacket receivePacket = new DatagramPacket(receiveData, receiveData.length);

			serverSocket.receive(receivePacket);
			String data = "";
			
			
			data = new String(receivePacket.getData(), 0, receivePacket.getLength());
			
			/*covert to celcius begin*/
			
			int val = Integer.parseInt(data);
			val = val * 1800;
			val = val / 1024;
			val = val - 500;
			val = val/10;

			data =  Integer.toString(val);
			/*covert to celcius end*/
			
			
			
			System.out.println("RECEIVED: " + data);

			serverSocket.close();
			System.out.println("in recv msg");
			return data;
		} catch (IOException e) {
			System.out.println("Error while recieving data: " + e);
		}
		
		return "error";
	}

}