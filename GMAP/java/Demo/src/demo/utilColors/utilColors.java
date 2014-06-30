package demo.utilColors;

import net.sf.jasperreports.functions.annotations.Function;
import net.sf.jasperreports.functions.annotations.FunctionCategories;
import net.sf.jasperreports.functions.annotations.FunctionParameter;
import net.sf.jasperreports.functions.annotations.FunctionParameters;
import java.awt.Color;

@FunctionCategories({ demo.utilColors.LookandfeelCategory.class })
public class utilColors {

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
	
	@Function("RGB_TO_HEX")
	@FunctionParameters({ @FunctionParameter("r"),
			@FunctionParameter("g"), @FunctionParameter("b") })
	public static String RGB_TO_HEX(int r, int g, int b)
	{
		Color c= new java.awt.Color(r,g,b);
		   String hex = Integer.toHexString(c.getRGB() & 0xffffff);
		   while (hex.length() < 6) {
		       hex = "0" + hex;
		   }
		   hex = "#" + hex;
		   return hex.toUpperCase();
	}
	
	@Function("GET_LINEAR_GRADIENT")
	@FunctionParameters({ @FunctionParameter("HEX_Min"),
			@FunctionParameter("HEX_Max"),@FunctionParameter("Value"), @FunctionParameter("Min"),@FunctionParameter("Max") })
	public static String GET_LINEAR_GRADIENT(String HEX_Min, String HEX_Max,Integer Value, Integer Min, Integer Max)
	{
		Color firstColor=new java.awt.Color(
			Integer.valueOf( HEX_Min.substring( 1, 3 ), 16 ),
        	Integer.valueOf( HEX_Min.substring( 3, 5 ), 16 ),
        	Integer.valueOf( HEX_Min.substring( 5, 7 ), 16 ));
		
		Color lastColor=new java.awt.Color(
			Integer.valueOf( HEX_Max.substring( 1, 3 ), 16 ),
			Integer.valueOf( HEX_Max.substring( 3, 5 ), 16 ),
			Integer.valueOf( HEX_Max.substring( 5, 7 ), 16 ));
		
		
		if (Max == Min){Min = 0;}
		float ratio = ((float) Value - (float) Min)/ ((float) Max - (float) Min);
	//first try
	/**	int red = (int) (lastColor.getRed() * ratio + firstColor.getRed() * (1 - ratio));
        int green = (int) (lastColor.getGreen() * ratio + firstColor.getGreen() * (1 - ratio));
        int blue = (int) (lastColor.getBlue() * ratio + firstColor.getBlue() * (1 - ratio));
        //Color stepColor = new Color(red, green, blue);*/
        //rf-ri * val-min/max-min
        //ri-rf * 1-val-min/max-min
        
     //Second try
        int red =lastColor.getRed()-firstColor.getRed()>0? (int) ((lastColor.getRed()-firstColor.getRed()) * ratio):(int) ((firstColor.getRed()-lastColor.getRed()) * (1-ratio)) ;
        int green = lastColor.getGreen() - firstColor.getGreen()>0? (int) ((lastColor.getGreen() - firstColor.getGreen()) * ratio):  (int) ((firstColor.getGreen() - lastColor.getGreen())*(1-ratio));
        int blue = lastColor.getBlue() -firstColor.getBlue()>0? (int) ((lastColor.getBlue() -firstColor.getBlue()) * ratio ):(int) ((firstColor.getBlue() -lastColor.getBlue()) * (1-ratio ));
        String finalColor = RGB_TO_HEX (red,green, blue);
        return finalColor;
}
	
	@Function("GET_STEP_GRADIENT")
	@FunctionParameters({ @FunctionParameter("HEX_Min"),
			@FunctionParameter("HEX_Max"),@FunctionParameter("Value"), @FunctionParameter("Min"),@FunctionParameter("Max"),@FunctionParameter("Steps") })
	public static String GET_STEP_GRADIENT(String HEX_Min, String HEX_Max,int Value, int Min, int Max, int Steps)
	
	{Color firstColor=new java.awt.Color(
			Integer.valueOf( HEX_Min.substring( 1, 3 ), 16 ),
        	Integer.valueOf( HEX_Min.substring( 3, 5 ), 16 ),
        	Integer.valueOf( HEX_Min.substring( 5, 7 ), 16 ));
		
		Color lastColor=new java.awt.Color(
			Integer.valueOf( HEX_Max.substring( 1, 3 ), 16 ),
			Integer.valueOf( HEX_Max.substring( 3, 5 ), 16 ),
			Integer.valueOf( HEX_Max.substring( 5, 7 ), 16 ));
		 
		
		if (Max == Min){Min = 0;}
		float ratio = ((float) Value - (float) Min)/ ((float) Max - (float) Min);
		float fratio = (float) 0.0;
		//Recherche Step
		int fStep=0;
		
		if(ratio >0)
		{Integer i = 1;
			
			while (i<=Steps ) 
			{
				  float min =  ((float) i)/((float) 5.0);
				  float max = (float) (((float)(1.0+ i)/5.0));
				  boolean test = (max > ratio) && (ratio>min);  
				  
				  	if(test )
				  		{ fStep=i;
				  		break;}
				  	else {fStep=fStep;}
				  	
				  i=i+1;
			}
			   fratio = (float) ((fStep*0.1)/(Steps*0.1));
			  
			   System.out.println(i+";"+Steps +";"+ ratio+";"+fStep + ";" + fratio);
			 
		}
		else{  fratio = (float) (fStep/Steps);}
        
     //Second try
        int red =lastColor.getRed()-firstColor.getRed()>0? (int) ((lastColor.getRed()-firstColor.getRed()) * fratio):(int) ((firstColor.getRed()-lastColor.getRed()) * (1-fratio)) ;
        int green = lastColor.getGreen() - firstColor.getGreen()>0? (int) ((lastColor.getGreen() - firstColor.getGreen()) * fratio):  (int) ((firstColor.getGreen() - lastColor.getGreen())*(1-fratio));
        int blue = lastColor.getBlue() -firstColor.getBlue()>0? (int) ((lastColor.getBlue() -firstColor.getBlue()) * fratio ):(int) ((firstColor.getBlue() -lastColor.getBlue()) * (1-fratio ));
        String finalColor = RGB_TO_HEX (red,green, blue);
        return finalColor;
	
	
	
	}
	
	@Function("GET_FIXED_STEP_GRADIENT_ARRAY")
	@FunctionParameters({ @FunctionParameter("HEX_Min"),
			@FunctionParameter("HEX_Max"),@FunctionParameter("Steps") })
	public static String GET_FIXED_STEP_GRADIENT_ARRAY(String HEX_Min, String HEX_Max, int Steps)
	
	{Color firstColor=new java.awt.Color(
			Integer.valueOf( HEX_Min.substring( 1, 3 ), 16 ),
        	Integer.valueOf( HEX_Min.substring( 3, 5 ), 16 ),
        	Integer.valueOf( HEX_Min.substring( 5, 7 ), 16 ));
		
		Color lastColor=new java.awt.Color(
			Integer.valueOf( HEX_Max.substring( 1, 3 ), 16 ),
			Integer.valueOf( HEX_Max.substring( 3, 5 ), 16 ),
			Integer.valueOf( HEX_Max.substring( 5, 7 ), 16 ));
		
		float fratio = (float) 0.0;
		//Recherche Step
		String[] colors = new String[Steps+1];
		Integer i = 0;
		String st ="[";
			while (i<=Steps ) 
			{fratio = (float) ((i*0.1)/(Steps*0.1));
				int red =lastColor.getRed()-firstColor.getRed()>0? (int) ((lastColor.getRed()-firstColor.getRed()) * fratio):(int) ((firstColor.getRed()-lastColor.getRed()) * (1-fratio)) ;
		        int green = lastColor.getGreen() - firstColor.getGreen()>0? (int) ((lastColor.getGreen() - firstColor.getGreen()) * fratio):  (int) ((firstColor.getGreen() - lastColor.getGreen())*(1-fratio));
		        int blue = lastColor.getBlue() -firstColor.getBlue()>0? (int) ((lastColor.getBlue() -firstColor.getBlue()) * fratio ):(int) ((firstColor.getBlue() -lastColor.getBlue()) * (1-fratio ));
		        String finalColor = RGB_TO_HEX (red,green, blue);
		       
		        st= st+"\n'"+finalColor+"',";
		        colors[i] = finalColor;
		        i++;
			}
				st = st.substring(0, st.length()-1)+"\n]";
			 return st;
		
	
	}
	
	}
	
