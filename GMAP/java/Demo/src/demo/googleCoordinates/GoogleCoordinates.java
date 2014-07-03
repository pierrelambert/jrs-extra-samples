package demo.googleCoordinates;

import net.sf.jasperreports.functions.annotations.Function;
import net.sf.jasperreports.functions.annotations.FunctionCategories;
import net.sf.jasperreports.functions.annotations.FunctionParameter;
import net.sf.jasperreports.functions.annotations.FunctionParameters;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathFactory;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

import java.io.IOException;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.xpath.XPathExpressionException;
import org.xml.sax.SAXException;

@FunctionCategories({ demo.googleCoordinates.WSCategory.class })
public class GoogleCoordinates {

	@Function("HELLO_WORLD_MSG")
	public static String HELLO_WORLD_MSG() {
		return "Hello World!";
	}

	@Function("REPEAT_MSG")
	@FunctionParameters({ @FunctionParameter("message"),
			@FunctionParameter("times"), @FunctionParameter("forceUpperCase") })
	public static String REPEAT_MSG(String message, Integer times) {
		return REPEAT_MSG(message, times, false);
	}

	public static String REPEAT_MSG(String message, Integer times,
			Boolean forceUpperCase) {
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < times; i++) {
			sb.append(message).append("\n");
		}
		String txt = sb.toString();
		if (forceUpperCase) {
			txt = txt.toUpperCase();
		}
		return txt;
	}
	
	
	@Function("GET_COORDINATES")
	@FunctionParameters({ @FunctionParameter("address")})
	public static String GET_COORDINATES(String address) throws IOException, XPathExpressionException, ParserConfigurationException, SAXException{
	  
		// URL prefix to the geocoder
		String GEOCODER_REQUEST_PREFIX_FOR_XML = "http://maps.google.com/maps/api/geocode/xml";
	  
	  // query address
	   // String test = "1600 Amphitheatre Parkway, Mountain View, CA";

	    // prepare a URL to the geocoder
	    URL url = new URL(GEOCODER_REQUEST_PREFIX_FOR_XML + "?address=" + URLEncoder.encode(address, "UTF-8") + "&sensor=false");

	    // prepare an HTTP connection to the geocoder
	    HttpURLConnection conn = (HttpURLConnection) url.openConnection();

	    Document geocoderResultDocument = null;
	    try {
	      // open the connection and get results as InputSource.
	      conn.connect();
	      InputSource geocoderResultInputSource = new InputSource(conn.getInputStream());

	      // read result and parse into XML Document
	      geocoderResultDocument = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(geocoderResultInputSource);
	    } finally {
	      conn.disconnect();
	    }

	    // prepare XPath
	    XPath xpath = XPathFactory.newInstance().newXPath();

	    // extract the result
	    NodeList resultNodeList = null;


	    // c) extract the coordinates of the first result
	    resultNodeList = (NodeList) xpath.evaluate("/GeocodeResponse/result[1]/geometry/location/*", geocoderResultDocument, XPathConstants.NODESET);
	    float lat = Float.NaN;
	    float lng = Float.NaN;
	    for(int i=0; i<resultNodeList.getLength(); ++i) {
	      Node node = resultNodeList.item(i);
	      if("lat".equals(node.getNodeName())) lat = Float.parseFloat(node.getTextContent());
	      if("lng".equals(node.getNodeName())) lng = Float.parseFloat(node.getTextContent());
	    }
	   String txt= lat + ";" + lng;
	   return txt;
	    

	  }
	
	@Function("GET_SF_COORDINATES")
	public static String GET_SF_COORDINATES() throws IOException, XPathExpressionException, ParserConfigurationException, SAXException{
	  
		// URL prefix to the geocoder
		String GEOCODER_REQUEST_PREFIX_FOR_XML = "http://maps.google.com/maps/api/geocode/xml";
	  
	  // query address
	    String address = "San Francisco, CA";

	    // prepare a URL to the geocoder
	    URL url = new URL(GEOCODER_REQUEST_PREFIX_FOR_XML + "?address=" + URLEncoder.encode(address, "UTF-8") + "&sensor=false");

	    // prepare an HTTP connection to the geocoder
	    HttpURLConnection conn = (HttpURLConnection) url.openConnection();

	    Document geocoderResultDocument = null;
	    try {
	      // open the connection and get results as InputSource.
	      conn.connect();
	      InputSource geocoderResultInputSource = new InputSource(conn.getInputStream());

	      // read result and parse into XML Document
	      geocoderResultDocument = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(geocoderResultInputSource);
	    } finally {
	      conn.disconnect();
	    }

	    // prepare XPath
	    XPath xpath = XPathFactory.newInstance().newXPath();

	    // extract the result
	    NodeList resultNodeList = null;


	    // c) extract the coordinates of the first result
	    resultNodeList = (NodeList) xpath.evaluate("/GeocodeResponse/result[1]/geometry/location/*", geocoderResultDocument, XPathConstants.NODESET);
	    float lat = Float.NaN;
	    float lng = Float.NaN;
	    for(int i=0; i<resultNodeList.getLength(); ++i) {
	      Node node = resultNodeList.item(i);
	      if("lat".equals(node.getNodeName())) lat = Float.parseFloat(node.getTextContent());
	      if("lng".equals(node.getNodeName())) lng = Float.parseFloat(node.getTextContent());
	    }
	   String txt= lat + ";" + lng;
	   return txt;
	    

	  }
}
